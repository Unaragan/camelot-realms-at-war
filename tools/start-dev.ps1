# start-dev.ps1 - Kompletter Projekt-Start: Git-Pull, Shared-Asset-Sync, Unreal Editor + Claude-Code-Terminal
# MCP-Server startet automatisch (CamelotRAW_TP.cpp, OnPostEngineInit-Handler) - falls nach einem
# Rebuild noch nicht aktiv, siehe SETUP.md Schritt 3.
# Camelot: Realms at War
#
# Ersetzt (2026-08-22) das bisherige zusaetzliche start-editor-with-sync.ps1 (OneDrive-Variante,
# entfernt) - ein einziges Skript deckt jetzt den kompletten Start ab, siehe SETUP.md.

$ProjectDir  = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$ProjectPath = Join-Path $ProjectDir "CamelotRAW_TP.uproject"
$EnginePath  = "C:\Program Files\Epic Games\UE_5.8\Engine\Binaries\Win64\UnrealEditor.exe"
$SharedAssetsNas   = "Z:\SharedAssets"
$SharedAssetsLocal = Join-Path $ProjectDir "SharedAssetsCache"

Set-Location $ProjectDir

# --- 1. Git Pull (Quelle der Wahrheit fuer Code/Content/Camelot/Doku) ---
Write-Host "=== Git Pull ===" -ForegroundColor Cyan
git pull origin master
if ($LASTEXITCODE -ne 0) {
    Write-Host "FEHLER: git pull fehlgeschlagen - vor dem Editor-Start klaeren (Konflikte? Uncommitted changes?)." -ForegroundColor Red
    Read-Host "Enter zum trotzdem fortfahren, Strg+C zum Abbrechen"
}

# --- 2. Grosse, nicht-versionierte Assets vom NAS-Stick spiegeln (nur NAS -> lokal, nie umgekehrt) ---
Write-Host "=== Shared-Assets-Sync (Z:\SharedAssets -> SharedAssetsCache) ===" -ForegroundColor Cyan
if (Test-Path $SharedAssetsNas) {
    if (-not (Test-Path $SharedAssetsLocal)) { New-Item -ItemType Directory -Force -Path $SharedAssetsLocal | Out-Null }
    robocopy $SharedAssetsNas $SharedAssetsLocal /MIR /R:1 /W:1 /NFL /NDL /NJH | Out-Null
    Write-Host "Fertig. Neue/aktualisierte Assets liegen in SharedAssetsCache/ - manuell im Content Browser importieren, wo gebraucht." -ForegroundColor Green
} else {
    Write-Host "NAS-Freigabe Z:\SharedAssets nicht erreichbar (Stick nicht verbunden/gemappt?) - Sync uebersprungen, weiter mit lokalem Stand." -ForegroundColor Yellow
}

# --- 3. Unreal Editor starten (MCP-Server startet automatisch, siehe CamelotRAW_TP.cpp) ---
Write-Host "=== Starte Unreal Editor (CamelotRAW_TP) ===" -ForegroundColor Cyan
if (-not (Test-Path $EnginePath)) {
    Write-Host "FEHLER: Unreal Editor nicht gefunden unter: $EnginePath" -ForegroundColor Red
    Read-Host "Enter zum Beenden"
    exit 1
}
if (-not (Test-Path $ProjectPath)) {
    Write-Host "FEHLER: Projekt nicht gefunden unter: $ProjectPath" -ForegroundColor Red
    Read-Host "Enter zum Beenden"
    exit 1
}
Start-Process -FilePath $EnginePath -ArgumentList "`"$ProjectPath`""

Write-Host "Warte, bis der Editor hochgefahren ist (ca. 25 Sekunden)..." -ForegroundColor Yellow
Start-Sleep -Seconds 25

# --- 4. Claude-Code-Terminal oeffnen (verbindet sich mit unreal-mcp, siehe SETUP.md) ---
Write-Host "=== Oeffne Claude-Code-Terminal ===" -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$ProjectDir'; claude"

Write-Host ""
Write-Host "MCP-Server sollte automatisch gestartet sein (CamelotRAW_TP.cpp, OnPostEngineInit)." -ForegroundColor Green
Write-Host "Falls unreal-mcp im Terminal nicht als verbunden auftaucht: /mcp - List/manage MCP servers pruefen," -ForegroundColor Yellow
Write-Host "sonst manuell im Output Log: ModelContextProtocol.StartServer" -ForegroundColor Yellow
Write-Host ""
Write-Host "Am Ende der Sitzung nicht vergessen: git add/commit/push, damit der naechste Rechner den Stand bekommt." -ForegroundColor Yellow
