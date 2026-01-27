# Git 설치 스크립트
# PowerShell에서 "실행 정책" 오류 시: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

Write-Host "=== Git 설치 시도 (winget) ===" -ForegroundColor Cyan

try {
    winget install --id Git.Git -e --accept-source-agreements --accept-package-agreements
    Write-Host "`n설치가 완료되었으면 **터미널을 닫았다가 새로 열고** git-upload.ps1 을 실행하세요." -ForegroundColor Green
} catch {
    Write-Host "winget 설치 실패. 아래 주소에서 수동 설치해 주세요:" -ForegroundColor Yellow
    Write-Host "https://git-scm.com/download/win" -ForegroundColor White
    Start-Process "https://git-scm.com/download/win"
}
