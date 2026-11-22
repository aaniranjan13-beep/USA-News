@echo off
title USA News 24 - Live Website & Public Tunnel Launcher
color 0A
cd /d "%~dp0"

echo ==========================================================
echo         USA NEWS 24 - AUTOMATIC LAUNCHER
echo ==========================================================
echo.
echo [1/3] Starting backend server and auto-update engine...
start /b "" node server/server.js > server.log 2>&1

timeout /t 2 /nobreak >nul

echo [2/3] Connecting secure Cloudflare public tunnel...
start /b "" cloudflared tunnel --url http://localhost:4000 > tunnel.log 2>&1

echo [3/3] Generating live link for your client...
timeout /t 5 /nobreak >nul

powershell -Command "$link = (Get-Content tunnel.log | Select-String 'trycloudflare.com' | Select-Object -Last 1).Line; if ($link -match '(https://[a-zA-Z0-9\.-]+\.trycloudflare\.com)') { $url = $matches[1]; Set-Content -Path 'CLIENT_LINK.txt' -Value $url; Write-Host ''; Write-Host '==========================================================' -ForegroundColor Cyan; Write-Host '   LIVE LINK FOR YOUR CLIENT:' -ForegroundColor Yellow; Write-Host \"   $url\" -ForegroundColor Green; Write-Host \"   Admin: $url/admin\" -ForegroundColor Green; Write-Host '==========================================================' -ForegroundColor Cyan; Write-Host ''; Write-Host 'Link saved to CLIENT_LINK.txt'; Start-Process $url } else { Write-Host 'Connecting tunnel... Please check CLIENT_LINK.txt in 5 seconds.' }"

echo.
echo Keep this window open while you want the website to be online.
echo To stop, simply close this window.
pause
