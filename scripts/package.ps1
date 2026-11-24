# 저장소의 각 스킬을 Claude Desktop / claude.ai 업로드용 zip으로 만든다.
# 사용: 저장소 폴더에서  powershell -ExecutionPolicy Bypass -File scripts\package.ps1
# 결과: dist\<스킬 이름>.zip  (zip 안 구조: <스킬 이름>/SKILL.md ...)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression, System.IO.Compression.FileSystem

$repo = Split-Path -Parent $PSScriptRoot
$source = Join-Path $repo 'skills'
$dist = Join-Path $repo 'dist'
New-Item -ItemType Directory -Force $dist | Out-Null

Get-ChildItem $source -Directory | ForEach-Object {
    $skill = $_
    $zipPath = Join-Path $dist "$($skill.Name).zip"
    if (Test-Path $zipPath) { Remove-Item $zipPath -Force }

    $fs = [System.IO.File]::Open($zipPath, 'CreateNew')
    $zip = New-Object System.IO.Compression.ZipArchive($fs, [System.IO.Compression.ZipArchiveMode]::Create)
    Get-ChildItem $skill.FullName -Recurse -File | ForEach-Object {
        # zip 안의 경로는 '/' 로 구분해야 업로드가 실패하지 않는다
        $rel = $_.FullName.Substring($skill.FullName.Length + 1).Replace('\', '/')
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $_.FullName, "$($skill.Name)/$rel") | Out-Null
    }
    $zip.Dispose(); $fs.Dispose()
    Write-Host "만듦: dist\$($skill.Name).zip"
}

Write-Host ""
Write-Host "완료. Claude Desktop → 설정 → Capabilities → Skills 에서 zip을 업로드하세요."
