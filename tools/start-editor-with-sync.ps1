# start-editor-with-sync.ps1
# Startet den Unreal Editor mit automatischer OneDrive-Synchronisierung vor und nach dem Spielen

param(
    [string]$ProjectPath = (Join-Path (Resolve-Path (Join-Path $PSScriptRoot "..")).Path "CamelotRAW_TP.uproject")
)

# OneDrive-Sync erzwingen (Start)
Write-Host "=== OneDrive Sync (Start) ===" -ForegroundColor Cyan
Start-Process "C:\Program Files\Microsoft OneDrive\OneDrive.exe" -ArgumentList "/update" -Wait -ErrorAction SilentlyContinue
Start-Sleep -Seconds 3

# Auf Sync warten (max 30 Sekunden)
Write-Host "Warte auf OneDrive-Synchronisierung..." -ForegroundColor Yellow
$timeout = 30
$elapsed = 0
while ($elapsed -lt $timeout) {
    $syncStatus = Get-Process OneDrive -ErrorAction SilentlyContinue | Select-Object ProcessName
    if ($syncStatus) {
        Write-Host "OneDrive aktiv - starte Editor..." -ForegroundColor Green
        break
    }
    Start-Sleep -Seconds 1
    $elapsed++
}

# Editor starten
Write-Host "=== Starte Unreal Editor ===" -ForegroundColor Cyan
if (Test-Path $ProjectPath) {
    & "C:\Program Files\Epic Games\UE_5.8\Engine\Binaries\Win64\UnrealEditor.exe" $ProjectPath
} else {
    Write-Host "FEHLER: Projekt nicht gefunden: $ProjectPath" -ForegroundColor Red
    exit 1
}

# Nach Editor-Schließung: OneDrive nochmal synchen (Exit)
Write-Host "=== OneDrive Sync (Exit) ===" -ForegroundColor Cyan
Write-Host "Editor wurde geschlossen - erzwinge finale OneDrive-Synchronisierung..." -ForegroundColor Yellow
Start-Process "C:\Program Files\Microsoft OneDrive\OneDrive.exe" -ArgumentList "/update" -Wait -ErrorAction SilentlyContinue

# Warte auf Sync completion
Start-Sleep -Seconds 5
Write-Host "OneDrive-Sync abgeschlossen. Bis morgen!" -ForegroundColor Green
