# 이 PC의 개인 스킬(~/.claude/skills)을 저장소의 skills/ 폴더로 모은다.
# 사용: 저장소 폴더에서  powershell -ExecutionPolicy Bypass -File scripts\sync.ps1
# 앱이 자동으로 동기화하는 'synced' 폴더는 내 스킬이 아니므로 제외한다.

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent $PSScriptRoot
$local = Join-Path $HOME '.claude\skills'
$target = Join-Path $repo 'skills'

New-Item -ItemType Directory -Force $target | Out-Null

Get-ChildItem $local -Directory |
    Where-Object { $_.Name -ne 'synced' -and (Test-Path (Join-Path $_.FullName 'SKILL.md')) } |
    ForEach-Object {
        $dest = Join-Path $target $_.Name
        if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }
        Copy-Item $_.FullName $dest -Recurse
        Write-Host "모음: $($_.Name)"
    }

Write-Host ""
Write-Host "완료. 'git status' 로 바뀐 내용을 확인한 뒤 commit / push 하세요."
