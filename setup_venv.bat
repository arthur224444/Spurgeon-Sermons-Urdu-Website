@echo off
set VENV_NAME=venv

echo Starting virtual environment setup...

if exist "%VENV_NAME%" (
    echo Removing existing virtual environment...
    rmdir /s /q "%VENV_NAME%"
    echo Virtual environment removed.
)

echo Creating new virtual environment: %VENV_NAME%
python -m venv %VENV_NAME%

echo Activating virtual environment...
call %VENV_NAME%/Scripts/activate.bat

echo Upgrading pip to latest version...
python -m pip install --upgrade pip

echo Installing required packages from requirements.txt...
python -m pip install -r requirements.txt

echo Virtual environment setup complete!
echo To activate the environment manually, run: %VENV_NAME%\Scripts\activate.bat or call activate_venv.bat