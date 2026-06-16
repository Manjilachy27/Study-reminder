# Study Reminder - GitHub Push Guide

Your code is **ready to deploy**! Follow these steps to push it to GitHub.

## Step 1: Install Git

1. **Download Git for Windows:**
   - Go to: https://git-scm.com/download/win
   - Click the installer to download

2. **Run the Installer:**
   - Open the downloaded `Git-2.54.0-64-bit.exe` file
   - Click through the installation (default settings are fine)
   - Make sure to check "Git Bash Here" during installation
   - Complete installation and **restart your computer** or terminal

3. **Verify Installation:**
   ```powershell
   git --version
   ```
   You should see: `git version 2.54.0...`

## Step 2: Configure Git (First Time Only)

Open PowerShell or Command Prompt and run:

```powershell
git config --global user.name "Manjil"
git config --global user.email "manji@example.com"
```

## Step 3: Initialize Repository

Navigate to your backend folder:

```powershell
cd "C:\Users\manji\Downloads\Study Reminder\backend"
```

Initialize Git:

```powershell
git init
git add .
git commit -m "Initial commit: Study Reminder backend with Spring Boot and Supabase integration"
```

## Step 4: Push to GitHub

Add GitHub remote:

```powershell
git remote add origin https://github.com/Manjilachy27/Study-reminder.git
git branch -M main
git push -u origin main
```

### If You're Prompted for Password:

**Do NOT use your GitHub password!**

Instead:
1. Go to: https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Set Name: `Study Reminder`
4. Check scope: `repo` (full control of private repositories)
5. Click "Generate token"
6. **Copy the token** (you won't see it again!)
7. When prompted for password in terminal, **paste the token**

## Step 5: Verify Success

Your code should now be on GitHub!

Check: https://github.com/Manjilachy27/Study-reminder

## Step 6: Deploy to Production

### Option A: Railway (Recommended - 5 minutes)

```
1. Go to https://railway.app
2. Sign in with GitHub
3. Create new project → GitHub repo
4. Select your repo
5. Add these environment variables:
   - SUPABASE_URL = https://your-project.supabase.co
   - SUPABASE_ANON_KEY = your-anon-key
6. Railway auto-deploys! (Check in 2-5 minutes)
7. Get your URL from Railway dashboard
```

### Option B: AWS Elastic Beanstalk

```
1. Install AWS CLI
2. Create EB app: eb create study-reminder
3. Set env vars: eb setenv SUPABASE_URL=... SUPABASE_ANON_KEY=...
4. Deploy: eb deploy
```

### Option C: Heroku (Legacy - Paid Only Now)

```
1. Install Heroku CLI
2. heroku login
3. heroku create your-app-name
4. heroku config:set SUPABASE_URL=... SUPABASE_ANON_KEY=...
5. git push heroku main
```

## Troubleshooting

### "Git is not recognized"
- Restart PowerShell/Command Prompt after installing Git
- Or reinstall Git with admin rights

### "Authentication failed"
- Use Personal Access Token, NOT your GitHub password
- Token from: https://github.com/settings/tokens

### "Repository not found"
- Check repo exists: https://github.com/Manjilachy27/Study-reminder
- Verify URL is correct in git remote: `git remote -v`

### "Permission denied"
- Make sure you have admin rights to the GitHub repo
- Double-check your token has `repo` scope

## Quick Reference Commands

```powershell
# Check status
git status

# See commits
git log --oneline

# See remote
git remote -v

# Push again (after first time)
git push origin main

# Make a new commit
git add .
git commit -m "Your message"
git push
```

---

**Need Help?**
- GitHub Docs: https://docs.github.com
- Railway Deploy: https://docs.railway.app
- Ask in GitHub Issues: https://github.com/Manjilachy27/Study-reminder/issues
