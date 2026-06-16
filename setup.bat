@echo off
REM Study Reminder - GitHub Push Script (Batch Version)

setlocal enabledelayedexpansion

echo.
echo ========================================
echo Study Reminder - GitHub Setup
echo ========================================
echo.

REM Check if Git is installed
git --version >nul 2>&1
if !errorlevel! neq 0 (
    echo.
    echo ERROR: Git is not installed
    echo Download from: https://git-scm.com/download/win
    echo.
    pause
    exit /b 1
)

echo Git is installed
echo.

REM Configure Git
echo Configuring Git...
git config --global user.name "Manjil"
git config --global user.email "manji@example.com"

REM Initialize repo
if not exist .git (
    echo Initializing repository...
    git init
)

echo.
echo Adding files...
git add .

echo Creating commit...
git commit -m "Initial commit: Study Reminder backend" 2>nul

echo Configuring GitHub remote...
git remote remove origin 2>nul
git remote add origin https://github.com/Manjilachy27/Study-reminder.git

echo Setting main branch...
git branch -M main 2>nul

echo.
echo ========================================
echo PUSHING TO GITHUB
echo ========================================
echo.
echo If prompted for authentication:
echo - Use your GitHub username
echo - Use Personal Access Token as password
echo - Create token at: https://github.com/settings/tokens
echo.

git push -u origin main

echo.
if !errorlevel! equ 0 (
    echo ========================================
    echo SUCCESS! Code pushed to GitHub
    echo ========================================
    echo.
    echo Repository: https://github.com/Manjilachy27/Study-reminder
    echo.
) else (
    echo ========================================
    echo ERROR: Failed to push
    echo ========================================
    echo.
)

pause
