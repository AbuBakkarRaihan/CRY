@echo off
:: Batch script to disable User Account Control (UAC)
:: Requires administrator privileges

:: Check for administrative privileges
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires administrative privileges. Please run as administrator.
    pause
    exit /b
)

:: Disable UAC by setting EnableLUA to 0
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f

:: Inform the user that a restart is required
echo UAC has been disabled. Please restart your computer for the changes to take effect.
pause
