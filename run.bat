@echo off
REM Double-click to start CivicMap Mumbai on Windows.
cd /d "%~dp0"
echo Installing packages (first time only)...
py -m pip install -r backend\requirements.txt
echo.
echo Starting CivicMap...  Open http://127.0.0.1:8000/login.html
start "" http://127.0.0.1:8000/login.html
py -m uvicorn backend.main:app --host 127.0.0.1 --port 8000 --reload
pause
