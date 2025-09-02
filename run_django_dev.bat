@echo off
echo Starting Django Development Server...
echo.

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM Check if activation was successful
if errorlevel 1 (
    echo Error: Could not activate virtual environment
    echo Make sure the venv folder exists and contains Scripts\activate.bat
    pause
    exit /b 1
)

echo Virtual environment activated successfully
echo.

REM Run Django development server
echo Starting Django development server on http://127.0.0.1:8000/
echo Press Ctrl+C to stop the server
echo.
python manage.py runserver

REM Keep window open if there's an error
if errorlevel 1 (
    echo.
    echo Error occurred while running Django server
    pause
)
