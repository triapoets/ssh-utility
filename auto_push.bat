@echo off
cd /d "E:\Github\ssh-desktop-fixed"

echo ====================================
echo  AUTO PUSH TO GITHUB
echo ====================================
echo.

git status

echo.
echo Adding all changes...
git add .

echo.
echo Committing...
git commit -m "Auto update: %date% %time%"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo DONE!
pause