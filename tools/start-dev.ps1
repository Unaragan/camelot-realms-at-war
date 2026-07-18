# start-dev.ps1 - Startet Unreal Editor (mit automatischem MCP-Server-Start) + Claude-Code-Terminal
# Camelot: Realms at War

$ProjectPath = "C:\Users\micha\Documents\Unreal Projects\CamelotRAW\CamelotRAW.uproject"
$ProjectDir  = "C:\Users\micha\Documents\Unreal Projects\CamelotRAW"
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

Write-Output "Starte Unreal Editor (CamelotRAW) mit automatischem MCP-Server-Start..."
Start-Process -FilePath $EnginePath -ArgumentList "`"$ProjectPath`"", "-ExecCmds=`"ModelContextProtocol.StartServer`""

Write-Output "Warte, bis der Editor hochgefahren ist (ca. 25 Sekunden)..."
Start-Sleep -Seconds 25

Write-Output "Oeffne neues Terminal mit Claude Code (verbunden mit unreal-mcp)..."
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$ProjectDir'; claude"

Write-Output ""
Write-Output "Fertig. Falls der MCP-Server im Editor NICHT automatisch gestartet ist:"
Write-Output "  Im Output Log (Window - Output Log) manuell eingeben: ModelContextProtocol.StartServer"
Write-Output "Falls unreal-mcp im Terminal nicht als verbunden auftaucht: /mcp - List/manage MCP servers pruefen."
