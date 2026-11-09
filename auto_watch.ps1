# Auto Watcher - Otomatis commit & push saat file berubah
# Jalankan di background, tekan Ctrl+C untuk berhenti

$folder = "E:\Github\ssh-desktop-fixed"
Set-Location $folder

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $folder
$watcher.Filter = "*.*"
$watcher.NotifyFilter = [IO.NotifyFilters]::LastWrite -bor [IO.NotifyFilters]::FileName -bor [IO.NotifyFilters]::DirectoryName
$watcher.IncludeSubdirectories = $false
$watcher.EnableRaisingEvents = $true

$action = {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $path = $Event.SourceEventArgs.FullPath
    Write-Host "[$timestamp] Change detected: $path" -ForegroundColor Yellow

    # Debounce: tunggu 2 detik agar file selesai ditulis
    Start-Sleep -Seconds 2

    Write-Host "Committing & pushing to GitHub..." -ForegroundColor Cyan
    git add .
    git commit -m "Auto watch: $timestamp"
    git push origin main
    Write-Host "Done. Still watching for changes..." -ForegroundColor Green
}

Register-ObjectEvent -InputObject $watcher -EventName Changed -Action $action
Register-ObjectEvent -InputObject $watcher -EventName Created -Action $action
Register-ObjectEvent -InputObject $watcher -EventName Deleted -Action $action

Write-Host "========================================" -ForegroundColor Green
Write-Host " AUTO WATCHER BERJALAN" -ForegroundColor Green
Write-Host " Folder: $folder" -ForegroundColor Green
Write-Host " Tekan Ctrl+C untuk menghentikan" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

# Keep script alive
while ($true) {
    Start-Sleep -Seconds 1
}