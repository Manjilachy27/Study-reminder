# Study Reminder - Complete Setup & Deploy Script
# This PowerShell script installs Git, sets up your repo, and pushes to GitHub

$ErrorActionPreference = "Continue"

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Study Reminder - Complete Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check and install Git if needed
Write-Host "Checking for Git installation..." -ForegroundColor Yellow
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git not found. Installing..." -ForegroundColor Yellow
    
    $gitUrl = "https://github.com/git-for-windows/git/releases/download/v2.54.0.windows.1/Git-2.54.0-64-bit.exe"
    $installerPath = "$env:TEMP\git-installer.exe"
    
    Write-Host "Downloading Git installer..." -ForegroundColor Yellow
    $ProgressPreference = 'SilentlyContinue'
    Invoke-WebRequest -Uri $gitUrl -OutFile $installerPath -UseBasicParsing
    $ProgressPreference = 'Continue'
    
    Write-Host "Running Git installer..." -ForegroundColor Yellow
    Start-Process -FilePath $installerPath -ArgumentList "/SILENT /NORESTART" -Wait
    
    # Refresh environment
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    
    Write-Host "Git installation complete!" -ForegroundColor Green
} else {
    Write-Host "[OK] Git is installed" -ForegroundColor Green
}

Write-Host ""

# Verify Git works
$gitVersion = git --version 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "[OK] $gitVersion" -ForegroundColor Green
} else {
    Write-Host "[ERROR] Git is not working properly" -ForegroundColor Red
    exit 1
}

Write-Host ""

# Configure Git
Write-Host "Configuring Git..." -ForegroundColor Yellow
git config --global user.name "Manjil" 2>$null
git config --global user.email "manji@example.com" 2>$null
Write-Host "[OK] Git configured" -ForegroundColor Green

Write-Host ""

# Initialize repository if needed
if (-not (Test-Path .git)) {
    Write-Host "Initializing Git repository..." -ForegroundColor Yellow
    git init
    Write-Host "[OK] Repository initialized" -ForegroundColor Green
} else {
    Write-Host "[OK] Repository already exists" -ForegroundColor Green
}

Write-Host ""
Write-Host "Adding files..." -ForegroundColor Yellow
git add .
Write-Host "[OK] Files added" -ForegroundColor Green

Write-Host ""
Write-Host "Creating initial commit..." -ForegroundColor Yellow
git commit -m "Initial commit: Study Reminder backend with Spring Boot and Supabase" 2>$null
Write-Host "[OK] Commit created" -ForegroundColor Green

Write-Host ""
Write-Host "Configuring GitHub remote..." -ForegroundColor Yellow
git remote remove origin 2>$null
git remote add origin https://github.com/Manjilachy27/Study-reminder.git
Write-Host "[OK] Remote configured" -ForegroundColor Green

Write-Host ""
Write-Host "Setting main branch..." -ForegroundColor Yellow
git branch -M main 2>$null
Write-Host "[OK] Branch set to main" -ForegroundColor Green

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "PUSHING TO GITHUB" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "A browser window may open for authentication." -ForegroundColor Yellow
Write-Host "If prompted, create a Personal Access Token:" -ForegroundColor Yellow
Write-Host "  https://github.com/settings/tokens" -ForegroundColor Cyan
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "✓ SUCCESS! Code pushed to GitHub" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Repository: https://github.com/Manjilachy27/Study-reminder" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "NEXT STEPS - Deploy to Production:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Option 1: Railway (Recommended - Simple)" -ForegroundColor Cyan
    Write-Host "  1. Go to https://railway.app" -ForegroundColor White
    Write-Host "  2. Sign in with GitHub" -ForegroundColor White
    Write-Host "  3. Create new project → GitHub repo" -ForegroundColor White
    Write-Host "  4. Add environment variables:" -ForegroundColor White
    Write-Host "     - SUPABASE_URL" -ForegroundColor White
    Write-Host "     - SUPABASE_ANON_KEY" -ForegroundColor White
    Write-Host "  5. Deploy!" -ForegroundColor White
    Write-Host ""
    Write-Host "Option 2: Heroku (Free tier deprecated)" -ForegroundColor Cyan
    Write-Host "  1. Install Heroku CLI" -ForegroundColor White
    Write-Host "  2. heroku login" -ForegroundColor White
    Write-Host "  3. heroku create your-app-name" -ForegroundColor White
    Write-Host "  4. heroku config:set SUPABASE_URL=... SUPABASE_ANON_KEY=..." -ForegroundColor White
    Write-Host "  5. git push heroku main" -ForegroundColor White
    Write-Host ""
    Write-Host "Option 3: AWS, Azure, or Google Cloud" -ForegroundColor Cyan
    Write-Host "  See README.md for deployment instructions" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "✗ FAILED to push to GitHub" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Possible causes:" -ForegroundColor Yellow
    Write-Host "  1. Authentication failed" -ForegroundColor White
    Write-Host "  2. No internet connection" -ForegroundColor White
    Write-Host "  3. Repository doesn't exist on GitHub" -ForegroundColor White
    Write-Host ""
    Write-Host "Solution:" -ForegroundColor Yellow
    Write-Host "  1. Create Personal Access Token:" -ForegroundColor White
    Write-Host "     https://github.com/settings/tokens" -ForegroundColor Cyan
    Write-Host "  2. Try again: git push -u origin main" -ForegroundColor White
    Write-Host ""
}

Read-Host "Press Enter to exit"
