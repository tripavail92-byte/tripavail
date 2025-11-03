@echo off
REM This script adds Flutter to the system PATH permanently

echo Adding Flutter to PATH...

REM Check if already in PATH
echo %PATH% | findstr /C:"C:\develop\flutter\bin" >nul
if errorlevel 1 (
    REM Not in PATH, add it
    for /f "tokens=2*" %%A in ('reg query "HKCU\Environment" /v PATH 2^>nul') do set "USER_PATH=%%B"
    if defined USER_PATH (
        setx PATH "%USER_PATH%;C:\develop\flutter\bin" >nul
    ) else (
        setx PATH "C:\develop\flutter\bin" >nul
    )
    echo Flutter added to PATH successfully!
) else (
    echo Flutter already in PATH.
)

echo.
echo ========================================
echo PATH setup complete!
echo Please close and reopen your terminal
echo to use Flutter commands.
echo ========================================
echo.

pause

