#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Read a CSV of sermons and print SQLite INSERT OR IGNORE statements.

Usage:
  python csv_to_sqlite_inserts.py input.csv > inserts.sql
"""

import csv
import re
import sys
from datetime import date

TABLE = "Sermons"
COLUMNS = [
    "preacher_id",
    "bible_passage_english",
    "bible_passage_urdu",
    "location_id",
    "date_delivered",
    "original_language_id",
    "title_english",
    "title_urdu",
    "summary_english",
    "summary_urdu",
    "spurgeon_gems_number",
]

NULLISH = {"", "tbd", "yet to be added", "n/a", "na", "null", "none"}


def is_subselect(s: str) -> bool:
    return s.strip().startswith("(SELECT") and s.strip().endswith(")")


def is_int(s: str) -> bool:
    return re.fullmatch(r"\d+", s.strip()) is not None


def sql_escape(s: str) -> str:
    # Escape single quotes for SQL literal
    return s.replace("'", "''")


def clean_null(value: str):
    if value is None:
        return None
    v = value.strip()
    if v.lower() in NULLISH:
        return None
    return v


def normalize_date(raw: str):
    """
    Accepts:
      - dd/mm/yyyy
      - d/m/yy
      - dd/mm/yy  (two-digit year rules below)
      - common typo: ddmm/yyyy (e.g. 0110/2025 -> 01/10/2025)
    Returns ISO 'YYYY-MM-DD' or None if unparseable/NULLish.
    """
    raw = (raw or "").strip()
    if raw.lower() in NULLISH:
        return None

    # Fix common typo: 4 digits + '/' + 4 digits, where first 4 should be ddmm
    m = re.fullmatch(r"(\d{4})/(\d{4})", raw)
    if m:
        ddmm, yyyy = m.groups()
        dd, mm = ddmm[:2], ddmm[2:]
        raw = f"{dd}/{mm}/{yyyy}"

    # dd/mm/yyyy
    m = re.fullmatch(r"(\d{1,2})/(\d{1,2})/(\d{4})", raw)
    if m:
        d, mth, y = map(int, m.groups())
        return f"{y:04d}-{mth:02d}-{d:02d}"

    # dd/mm/yy
    m = re.fullmatch(r"(\d{1,2})/(\d{1,2})/(\d{2})", raw)
    if m:
        d, mth, yy = map(int, m.groups())
        # Century rules tailored to your dataset
        if 13 <= yy <= 17:
            century = 1900
        elif 60 <= yy <= 99:
            century = 1800
        else:
            century = 1900
        y = century + yy
        return f"{y:04d}-{mth:02d}-{d:02d}"

    # If we get here, we couldn't parse it
    return None


def to_sql_literal(value: str, column: str):
    """
    Convert a CSV cell to an SQL literal or expression:
      - NULLISH -> NULL
      - subselects -> as-is
      - date column -> 'YYYY-MM-DD' or NULL
      - integers for spurgeon_gems_number -> as-is
      - everything else -> quoted text literal
    """
    v = clean_null(value)
    if v is None:
        return "NULL"

    # Subselects are passed through
    if is_subselect(v):
        return v.strip()

    # Date normalization
    if column == "date_delivered":
        nd = normalize_date(v)
        if nd is None:
            # Keep original in a safe literal so you can spot/fix it later
            return "NULL"
        return f"'{nd}'"

    # Integer column
    if column == "spurgeon_gems_number" and is_int(v):
        return v.strip()

    # All other text -> quoted, SQL-escaped
    return f"'{sql_escape(v)}'"


def build_insert_row(row_dict: dict, rownum: int):
    values_sql = []
    for col in COLUMNS:
        values_sql.append(to_sql_literal(row_dict.get(col, ""), col))

    stmt = (
        f"INSERT OR IGNORE INTO {TABLE} (\n  "
        + ", ".join(COLUMNS)
        + "\n) VALUES (\n  "
        + ",\n  ".join(values_sql)
        + "\n);"
    )
    return stmt


def main():
    if len(sys.argv) != 3:
        print(
            "Usage: python csv_to_sqlite_inserts.py input.csv output.sql",
            file=sys.stderr,
        )
        sys.exit(1)

    input_path = sys.argv[1]
    output_path = sys.argv[2]
    insert_statements = []

    problems = []
    with open(input_path, "r", encoding="utf-16", newline="") as f:
        reader = csv.DictReader(f)
        # Ensure columns match expected
        missing = [c for c in COLUMNS if c not in reader.fieldnames]
        if missing:
            print(f"ERROR: CSV is missing columns: {missing}", file=sys.stderr)
            sys.exit(2)

        for i, row in enumerate(reader, start=2):  # header is line 1
            # Pre-validate date to collect problems (we still emit an INSERT with NULL date)
            raw_date = (row.get("date_delivered") or "").strip()
            if clean_null(raw_date) is not None and normalize_date(raw_date) is None:
                problems.append(
                    f"Line {i}: Unparseable date '{raw_date}' -> storing NULL. "
                    "Tip: use dd/mm/yyyy or dd/mm/yy (e.g., 01/10/2025)."
                )
            stmt = build_insert_row(row, i)
            insert_statements.append(stmt)

    if problems:
        print("\n-- Warnings:", file=sys.stderr)
        for p in problems:
            print(f"-- {p}", file=sys.stderr)

    with open(output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(insert_statements))


if __name__ == "__main__":
    main()
