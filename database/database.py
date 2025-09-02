import os
import sqlite3
from typing import Any, Dict, List, Optional


class Database:
    def __init__(self, db_path: str = None):
        """Set the database path"""
        if db_path is None:
            # Default to database.db in the same directory as this file
            self.db_path = os.path.join(os.path.dirname(__file__), "database.db")
        else:
            self.db_path = db_path

    def _get_connection(self) -> sqlite3.Connection:
        """Get a database connection with row factory for dict-like access"""
        conn = sqlite3.connect(self.db_path)
        conn.execute("PRAGMA foreign_keys = ON")
        conn.row_factory = sqlite3.Row
        return conn

    def search_sermons(self, text: str) -> List[int]:
        """
        Search for sermons based on various criteria
        Returns a list of the Spurgeon Gems sermon numbers that match the search criteria
        """
        results = []
        with self._get_connection() as conn:
            cursor = conn.cursor()
            # Build the base query with JOINs to get related information
            query = """
                SELECT DISTINCT spurgeon_gems_number
                FROM Sermons
                WHERE title      LIKE '%' || :q || '%' COLLATE NOCASE
                OR summary       LIKE '%' || :q || '%' COLLATE NOCASE
                OR bible_passage LIKE '%' || :q || '%' COLLATE NOCASE
            """

            cursor.execute(query, {"q": text})
            rows = cursor.fetchall()
            results = [row[0] for row in rows]
        return results

    def get_sermon_basic_details(
        self, spurgeon_gems_number: int
    ) -> Optional[Dict[str, Any]]:
        """
        Get basic details for a specific sermon
        """
        if not isinstance(spurgeon_gems_number, int):
            raise ValueError("Spurgeon Gems sermon number must be an integer")

        details = {}
        with self._get_connection() as conn:
            cursor = conn.cursor()
            query = """
                SELECT 
                    title,
                    summary,
                    bible_passage,
                    date_delivered,
                    spurgeon_gems_number
                FROM Sermons
                WHERE spurgeon_gems_number = ?
            """
            cursor.execute(query, (spurgeon_gems_number,))
            row = cursor.fetchone()
            details = dict(row)
        return details

    def get_sermon_full_details(
        self, spurgeon_gems_number: int
    ) -> Optional[Dict[str, Any]]:
        """
        Get complete details for a specific sermon by ID
        Returns a dictionary with all sermon information including related data
        """

        sermons_table_query = """
            SELECT 
                s.id,
                s.title,
                s.summary,
                s.bible_passage,
                s.date_delivered,
                s.spurgeon_gems_number,
                pc.first_name || ' ' || pc.last_name as preacher_name,
                d.denomination_name,
                pl.location_name as preaching_location
            FROM Sermons s
            JOIN ProjectContributors pc ON s.preacher_id = pc.id
            JOIN Denominations d ON pc.denomination_id = d.id
            JOIN PreachingLocations pl ON s.location_id = pl.id
            WHERE s.spurgeon_gems_number = ?
        """

        translations_table_query = """
            SELECT 
                t.id as translation_id,
                t.date_translated,
                l.language_name as translation_language
            FROM Translations t
            JOIN Languages l ON t.language_id = l.id
            WHERE t.sermon_id = ?
        """

        audio_table_query = """
            SELECT 
                a.id as audio_id,
                a.date_recorded,
                a.duration_seconds,
                l.language_name as audio_language
            FROM Audio a 
            JOIN Languages l ON a.language_id = l.id
            WHERE a.sermon_id = ?
        """

        with self._get_connection() as conn:
            cursor = conn.cursor()
            cursor.execute(sermons_table_query, (spurgeon_gems_number,))
            row = cursor.fetchone()

            if not row:
                return None

            # Convert to dictionary
            sermon_details = dict(row)

            sermon_id = sermon_details["id"]
            print(f"sermon_id: {sermon_id}, sermon_id_type: {type(sermon_id)}")

            # Get translation information
            cursor.execute(translations_table_query, (sermon_id,))
            translations = [dict(row) for row in cursor.fetchall()]
            sermon_details["translations"] = translations

            # Get audio information
            cursor.execute(audio_table_query, (sermon_id,))
            audio_records = [dict(row) for row in cursor.fetchall()]
            sermon_details["audio_records"] = audio_records

        return sermon_details


# Demonstration code
if __name__ == "__main__":
    database = Database()
    spurgeon_gems_sermon_numbers = database.search_sermons("comforter")
    for spurgeon_gems_sermon_number in spurgeon_gems_sermon_numbers:
        print(f"Sermon number: {spurgeon_gems_sermon_number}")
        print(
            f"Basic details: {database.get_sermon_basic_details(spurgeon_gems_sermon_number)}"
        )
        print(
            f"Full details: {database.get_sermon_full_details(spurgeon_gems_sermon_number)}"
        )
