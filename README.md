# Automated Daily GitHub Commit System

This repository is set up to automatically commit changes daily to maintain a GitHub contribution streak.

## Setup Instructions

1. **Create a GitHub Repository:**
   - Go to GitHub and create a new repository (e.g., `daily-commits`).
   - Copy the repository URL (e.g., `https://github.com/yourusername/daily-commits.git`).

2. **Set Up Remote Origin:**
   - Run the following command in the terminal (replace with your repo URL):
     ```
     git remote add origin https://github.com/yourusername/daily-commits.git
     ```
   - Push the initial commit:
     ```
     git push -u origin master
     ```

3. **Configure Git Credentials:**
   - For automated pushes, you need to use a Personal Access Token (PAT).
   - Go to GitHub Settings > Developer settings > Personal access tokens > Tokens (classic).
   - Generate a new token with `repo` scope.
   - In the PowerShell script `daily-commit.ps1`, modify the push line to include the token:
     ```
     git push https://yourusername:YOUR_TOKEN@github.com/yourusername/daily-commits.git master
     ```
     Replace `YOUR_TOKEN` with your actual token.

4. **Schedule the Script:**
   - Open Task Scheduler on Windows.
   - Create a new task:
     - General: Name it "Daily GitHub Commit", run with highest privileges if needed.
     - Triggers: Daily, at a specific time (e.g., 12:00 AM).
     - Actions: Start a program, Program/script: `powershell.exe`, Arguments: `-ExecutionPolicy Bypass -File "d:\git hub commit\daily-commit.ps1"`
     - Conditions: Ensure it runs even if on battery, etc.

5. **Test the Script:**
   - Run the script manually first to ensure it works:
     ```
     powershell -ExecutionPolicy Bypass -File "d:\git hub commit\daily-commit.ps1"
     ```

## How It Works

- The `daily-commit.ps1` script updates `daily-log.md` with the current date and time.
- It then adds, commits, and pushes the changes to GitHub.
- Scheduled to run daily via Task Scheduler.

## Security Note

- Keep your PAT secure and don't commit it to the repository.
- Consider using GitHub Actions or other CI/CD for more robust automation if possible.