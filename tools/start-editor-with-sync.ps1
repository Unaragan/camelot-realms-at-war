# start-editor-with-sync.ps1
# Startet den Unreal Editor mit Git als alleinigem Sync-Mechanismus (kein OneDrive mehr,
# siehe SETUP.md-Stolperfallen-Tabelle - OneDrive lief unzuverlaessig parallel zu Git und
# zeigte auf verschiedenen Rechnern unterschiedliche Staende).

param(
    [string]$ProjectDir = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path,
    [string]$ProjectPath = (Join-Path $ProjectDir "CamelotRAW_TP.uproject")
)

Set-Location $ProjectDir

Write-Host "=== Git Pull (Start) ===" -ForegroundColor Cyan
git pull origin master
if ($LASTEXITCODE -ne 0) {
    Write-Host "FEHLER: git pull fehlgeschlagen - vor dem Editor-Start klaeren (Konflikte? Uncommitted changes?)." -ForegroundColor Red
    Read-Host "Enter zum trotzdem fortfahren, Strg+C zum Abbrechen"
}

# Editor starten
Write-Host "=== Starte Unreal Editor ===" -ForegroundColor Cyan
if (Test-Path $ProjectPath) {
    & "C:\Program Files\Epic Games\UE_5.8\Engine\Binaries\Win64\UnrealEditor.exe" $ProjectPath
} else {
    Write-Host "FEHLER: Projekt nicht gefunden: $ProjectPath" -ForegroundColor Red
    exit 1
}

# Nach Editor-Schliessung: an Commit/Push erinnern, Stand zeigen
Write-Host "=== Editor geschlossen ===" -ForegroundColor Cyan
git status --short
Write-Host ""
Write-Host "Nicht vergessen: aenderungen committen und pushen (git add / git commit / git push origin master)," -ForegroundColor Yellow
Write-Host "damit der naechste Rechner den aktuellen Stand per 'git pull' bekommt." -ForegroundColor Yellow
