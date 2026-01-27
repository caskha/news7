# Git 저장소 초기화 및 첫 커밋
# 사용법: PowerShell에서 .\git-upload.ps1 실행
# 실행 정책 오류 시: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$projectPath = $PSScriptRoot
Set-Location $projectPath

Write-Host "=== Git 업로드 준비 ===" -ForegroundColor Cyan
Write-Host "경로: $projectPath`n" -ForegroundColor Gray

# Git 설치 확인
try {
    $null = git --version
} catch {
    Write-Host "Git이 설치되어 있지 않습니다. install-git.ps1 을 먼저 실행하세요." -ForegroundColor Red
    exit 1
}

# 사용자 정보 확인 (최초 1회)
$userEmail = git config --global user.email 2>$null
$userName = git config --global user.name 2>$null
if (-not $userEmail -or -not $userName) {
    Write-Host "`n[필수] Git 사용자 정보가 없습니다. 아래를 실행한 뒤 이 스크립트를 다시 실행하세요:" -ForegroundColor Yellow
    Write-Host '  git config --global user.email "본인이메일@example.com"' -ForegroundColor White
    Write-Host '  git config --global user.name "본인 이름"' -ForegroundColor White
    Write-Host "`n자세한 내용은 git-config-first.txt 를 참고하세요." -ForegroundColor Gray
    exit 1
}

# 이미 저장소가 있으면 init 건너뜀
if (-not (Test-Path ".git")) {
    git init
    Write-Host "git init 완료" -ForegroundColor Green
} else {
    Write-Host "이미 Git 저장소입니다." -ForegroundColor Gray
}

git add .
Write-Host "`n추가된 파일 (git status):" -ForegroundColor Cyan
git status --short

Write-Host "`n[확인] 위 목록에 .env 또는 API 키 파일이 없어야 합니다. 진행할까요? (y/n): " -ForegroundColor Yellow -NoNewline
$confirm = Read-Host
if ($confirm -ne 'y' -and $confirm -ne 'Y') {
    Write-Host "취소했습니다." -ForegroundColor Gray
    exit 0
}

git commit -m "feat: AI 뉴스 챗봇 초기 버전"
Write-Host "`n커밋 완료." -ForegroundColor Green
Write-Host "`n다음: GitHub에 저장소를 만든 후 아래를 실행하세요:" -ForegroundColor Cyan
Write-Host "  git remote add origin https://github.com/사용자명/저장소명.git" -ForegroundColor White
Write-Host "  git branch -M main" -ForegroundColor White
Write-Host "  git push -u origin main" -ForegroundColor White
