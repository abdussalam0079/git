# Daily Commit Script

# Perform 5 commits daily
for ($i = 1; $i -le 5; $i++) {
    $currentDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $commitMessage = "Daily commit #$i : $currentDate"

    # Append to the log file
    Add-Content -Path "daily-log.md" -Value "`n- $commitMessage"

    # Git commands
    git add daily-log.md
    git commit -m "$commitMessage"
}

# Push all commits at once
git push origin master