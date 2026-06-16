@echo off
REM Study Reminder - GitHub Push Script
REM This script sets up Git and pushes your code to GitHub

echo.
echo ========================================
echo Study Reminder - GitHub Setup
echo ========================================
echo.

REM Check if Git is installed
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Git is not installed in your PATH.
    echo Please install Git from: https://git-scm.com/download/win
    echo Then run this script again.
    pause
    exit /b 1
)

echo [OK] Git is installed
echo.

REM Configure Git
echo Configuring Git...
git config --global user.name "Manjil" 2>nul || (
    echo Please enter your name:
    set /p gitname=
    git config --global user.name "!gitname!"
)

git config --global user.email "manji@example.com" 2>nul || (
    echo Please enter your email:
    set /p gitemail=
    git config --global user.email "!gitemail!"
)

echo.
echo [OK] Git configured
echo.

REM Initialize repository
if not exist .git (
    echo Initializing Git repository...
    git init
    echo [OK] Repository initialized
) else (
    echo [OK] Repository already exists
)

echo.

REM Add files
echo Adding files to repository...
git add .
echo [OK] Files added
echo.

REM Commit
echo Committing changes...
git commit -m "Initial commit: Study Reminder backend with Spring Boot and Supabase integration" 2>nul || (
    echo [NOTE] Commit skipped (files may already be committed)
)
echo.

REM Add remote
echo Adding GitHub remote...
git remote remove origin 2>nul
git remote add origin https://github.com/Manjilachy27/Study-reminder.git
echo [OK] Remote added
echo.

REM Set main branch
echo Setting default branch to main...
git branch -M main
echo [OK] Branch set
echo.

REM Push to GitHub
echo.
echo ========================================
echo IMPORTANT: Authentication Required
echo ========================================
echo.
echo You will now be asked to authenticate with GitHub.
echo You can use:
echo   1. Personal Access Token (recommended)
echo      Create at: https://github.com/settings/tokens
echo   2. GitHub Credentials
echo.
echo Pushing to GitHub...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo SUCCESS! Code pushed to GitHub
    echo ========================================
    echo.
    echo Repository: https://github.com/Manjilachy27/Study-reminder
    echo.
    echo Next steps:
    echo 1. Go to: https://github.com/Manjilachy27/Study-reminder
    echo 2. Choose a deployment platform:
    echo    - Railway: https://railway.app (recommended)
    echo    - Heroku: https://www.heroku.com
    echo    - AWS Elastic Beanstalk: https://aws.amazon.com
    echo.
) else (
    echo.
    echo ERROR: Failed to push to GitHub
    echo Please check your authentication credentials
    echo.
)

pause
