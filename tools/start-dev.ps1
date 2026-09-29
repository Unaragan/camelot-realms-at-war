param([switch]$SkipSync)
$ErrorActionPreference = 'Stop'
$ProjectDir = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$ProjectPath = Join-Path $ProjectDir 'CamelotRAW_TP.uproject'
$EnginePath = 'C:\Program Files\Epic Games\UE_5.8\Engine\Binaries\Win64\UnrealEditor.exe'
Set-Location $ProjectDir
if (-not (Test-Path $ProjectPath) -or -not (Test-Path $EnginePath)) { throw 'Project or Unreal Editor missing.' }
$editors = @(Get-CimInstance Win32_Process -Filter "Name='UnrealEditor.exe'")
$ours = @($editors | Where-Object { $_.CommandLine -like "*$ProjectPath*" })
if ($editors.Count -and -not $ours.Count) { throw 'Another Unreal project is open. Close it first to avoid an MCP port conflict.' }
if (-not $SkipSync -and -not $ours.Count) {
    if (git status --porcelain) { throw 'Local changes exist. Save/commit them before syncing, or explicitly use -SkipSync.' }
    git pull --ff-only origin master
    if ($LASTEXITCODE -ne 0) { throw 'Git pull failed; editor startup stopped.' }
    $source = 'Z:\SharedAssets'
    $destination = Join-Path $ProjectDir 'SharedAssetsCache'
    if (Test-Path $source) {
        # Copy downloads only; never delete local cache files automatically.
        robocopy $source $destination /E /R:1 /W:1 /NFL /NDL /NJH | Out-Null
        if ($LASTEXITCODE -ge 8) { throw 'Shared asset copy failed.' }
        Write-Host 'Shared downloads copied. This is not a complete Unreal dependency sync.'
    } else { Write-Warning 'SharedAssets NAS unavailable; using local assets.' }
} elseif ($ours.Count) { Write-Host 'Project already open; no pull or asset copy while editing.' }
if (-not $ours.Count) { Start-Process -FilePath $EnginePath -ArgumentList ('"' + $ProjectPath + '"') }
$inventory = & (Join-Path $PSScriptRoot 'test-unreal-mcp.ps1')
Write-Host ("Registered toolsets: " + ([regex]::Matches(($inventory -join "`n"), "(?m)^- [\w.]+:").Count))
& (Join-Path $PSScriptRoot 'open-codex.ps1')
Write-Host 'Editor and MCP ready. Continue in the Codex desktop chat. No Claude terminal needed.'
