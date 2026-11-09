@echo off
cd /d "E:\Github\ssh-desktop-fixed"

echo ====================================
echo  SETUP GIT REPOSITORY (AUTO)
echo ====================================
echo.

echo Initializing git...
git init

echo.
echo Setting branch to main...
git branch -M main

echo.
echo Please enter your GitHub repository URL (example: https://github.com/username/repo.git)
set /p repoUrl="Repository URL: "

echo.
echo Adding remote origin...
git remote add origin %repoUrl%

echo.
echo Configuring credential helper...
git config --global credential.helper manager

echo.
echo Konfigurasi identitas Git (untuk commit)...
set /p gitName="Nama Anda: "
set /p gitEmail="Email Anda: "
git config --global user.name "%gitName%"
git config --global user.email "%gitEmail%"

echo.
echo Adding all files...
git add .

echo.
echo Creating initial commit...
git commit -m "Initial commit"

echo.
echo Pushing to GitHub...
git push -u origin main

echo.
echo ====================================
echo  SETUP SELESAI
echo ====================================
echo.
echo Repository sudah terhubung dengan GitHub.
echo Setiap commit berikutnya akan otomatis push jika hook terpasang.
echo Jalankan .\install-hooks.bat untuk mengaktifkan auto push setelah commit.
pause