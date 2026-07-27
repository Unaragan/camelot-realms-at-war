# start-dev.ps1 - Startet Unreal Editor + Claude-Code-Terminal
# Camelot: Realms at War
# Hinweis (2026-07-27): der -ExecCmds-Autostart des MCP-Servers ist unzuverlaessig (startet oft nicht).
# Normaler Weg: nach dem Hochfahren im Output Log manuell "ModelContextProtocol.StartServer" eintippen.

# WICHTIG: Projekt liegt jetzt im Git-Repo selbst (nicht mehr unter Documents\Unreal Projects)
# damit Editor-Arbeit und Versionierung nicht auseinanderlaufen. Siehe SETUP.md.
$ProjectDir  = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$ProjectPath = Join-Path $ProjectDir "CamelotRAW_TP.uproject"
$EnginePath  = "C:\Program Files\Epic Games\UE_5.8\Engine\Binaries\Win64\UnrealEditor.exe"

if (-not (Test-Path $EnginePath)) {
    Write-Output "Unreal Editor nicht gefunden unter: $EnginePath"
    Read-Host "Enter zum Beenden"
    exit
}
if (-not (Test-Path $ProjectPath)) {
    Write-Output "Projekt nicht gefunden unter: $ProjectPath"
    Read-Host "Enter zum Beenden"
    exit
}

Write-Output "Starte Unreal Editor (CamelotRAW_TP)..."
Start-Process -FilePath $EnginePath -ArgumentList "`"$ProjectPath`"", "-ExecCmds=`"ModelContextProtocol.StartServer`""

Write-Output "Warte, bis der Editor hochgefahren ist (ca. 25 Sekunden)..."
Start-Sleep -Seconds 25

Write-Output "Oeffne neues Terminal mit Claude Code (verbunden mit unreal-mcp)..."
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$ProjectDir'; claude"

Write-Output ""
Write-Output "Fertig. MCP-Server im Editor jetzt manuell starten:"
Write-Output "  Im Output Log (Window - Output Log) eingeben: ModelContextProtocol.StartServer"
Write-Output "Falls unreal-mcp im Terminal nicht als verbunden auftaucht: /mcp - List/manage MCP servers pruefen."
