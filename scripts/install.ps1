# 저장소의 skills/ 폴더에 있는 스킬을 이 PC의 ~/.claude/skills 로 설치한다.
# 사용: 저장소 폴더에서  powershell -ExecutionPolicy Bypass -File scripts\install.ps1
# 같은 이름의 스킬이 이미 있으면 저장소 버전으로 덮어쓴다.

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot
$source = Join-Path $repo 'skills'
$local = Join-Path $HOME '.claude\skills'

New-Item -ItemType Directory -Force $local | Out-Null

Get-ChildItem $source -Directory | ForEach-Object {
    $dest = Join-Path $local $_.Name
    if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }
    Copy-Item $_.FullName $dest -Recurse
    Write-Host "설치: /$($_.Name)"
}

Write-Host ""
Write-Host "완료. 새 Claude Code 세션에서 스킬을 사용할 수 있습니다."
