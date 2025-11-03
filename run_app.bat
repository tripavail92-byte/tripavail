@echo off
REM Quick script to run the TripAvail Flutter app

echo Starting TripAvail...
echo.

REM Add Flutter to PATH for this session
set PATH=C:\develop\flutter\bin;%PATH%

REM Run Flutter app
flutter run

pause

