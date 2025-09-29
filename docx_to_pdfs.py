import shutil
import subprocess
from pathlib import Path


def find_soffice():
    # 1) Try PATH
    for name in ("soffice", "soffice.exe"):
        exe = shutil.which(name)
        if exe:
            return exe

    # 2) Try typical Windows install locations
    candidates = [
        r"C:\Program Files\LibreOffice\program\soffice.exe",
        r"C:\Program Files (x86)\LibreOffice\program\soffice.exe",
    ]
    for c in candidates:
        if Path(c).exists():
            return c

    # Not found
    return None


def convert_docx_to_pdf(src_folder, out_folder=None):
    src = Path(src_folder)
    out = Path(out_folder) if out_folder else src
    out.mkdir(parents=True, exist_ok=True)

    docx_files = list(src.rglob("*.docx"))
    if not docx_files:
        print("No .docx files found.")
        return

    soffice = find_soffice()
    if not soffice:
        raise FileNotFoundError(
            "LibreOffice 'soffice.exe' not found. Install LibreOffice or add it to PATH.\n"
            "Expected at e.g. C:\\Program Files\\LibreOffice\\program\\soffice.exe"
        )
    print(f"Using soffice at: {soffice}")

    for f in docx_files:
        cmd = [
            soffice,
            "--headless",
            "--convert-to",
            "pdf:writer_pdf_Export",
            "--outdir",
            str(out),
            str(f),
        ]
        print(f"Running command: {cmd}")
        # capture output so you can see LibreOffice errors if any
        result = subprocess.run(
            cmd, check=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True
        )
        print(result.stdout)
        print(f"Converted: {f.name} → {f.stem}.pdf")


if __name__ == "__main__":
    src_folder = input("Enter the path to the sermons folder of docx files: ")
    out_folder = input("Enter the path to the output folder for the pdf files: ")
    convert_docx_to_pdf(src_folder, out_folder)
