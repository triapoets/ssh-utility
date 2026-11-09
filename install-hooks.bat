@echo off
cd /d "E:\Github\ssh-desktop-fixed"

echo ====================================
echo  INSTALL GIT HOOKS (AUTO PUSH)
echo ====================================
echo.

if not exist .git (
    echo Git repository not initialized.
    echo Please run setup-git.bat first.
    pause
    exit /b
)

echo Installing post-commit hook...
echo git push origin main > .git\hooks\post-commit

echo.
echo Hook installed successfully!
echo.
echo Now, every time you run 'git commit', it will automatically
echo push to GitHub without running auto_push.bat manually.
echo.
pause