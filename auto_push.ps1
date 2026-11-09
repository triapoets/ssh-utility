# Auto Push to GitHub - PowerShell
Set-Location "E:\Github\ssh-desktop-fixed"

Write-Host "====================================`n  AUTO PUSH TO GITHUB`n====================================`n" -ForegroundColor Cyan

Write-Host "Checking git status..." -ForegroundColor Yellow
git status

Write-Host "`nAdding all changes..." -ForegroundColor Yellow
git add .

Write-Host "`nCommitting..." -ForegroundColor Yellow
$commitMessage = "Auto update: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
git commit -m $commitMessage

Write-Host "`nPushing to GitHub..." -ForegroundColor Yellow
git push origin main

Write-Host "`nDONE!" -ForegroundColor Green