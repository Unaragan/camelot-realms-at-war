param([int]$TimeoutSeconds = 600, [string]$ToolName = "list_toolsets", [string]$ArgumentsJson = "{}", [switch]$ShowToolSchemas)
$ErrorActionPreference = 'Stop'
$uri = 'http://127.0.0.1:8000/mcp'
$deadline = (Get-Date).AddSeconds($TimeoutSeconds)
$headers = @{ Accept = 'application/json, text/event-stream' }
function Read-Rpc($response) {
    $body = [string]$response.Content
    if ($body.TrimStart().StartsWith('{')) { return ($body | ConvertFrom-Json) }
    foreach ($line in ($body -split "\r?\n")) {
        if ($line.StartsWith('data:')) {
            $value = $line.Substring(5).Trim() | ConvertFrom-Json
            if ($null -ne $value.id) { return $value }
        }
    }
    throw 'No JSON-RPC response received.'
}
do {
    try {
        $response = Invoke-WebRequest -UseBasicParsing -Uri $uri -Method Post -Headers $headers -ContentType 'application/json' -TimeoutSec 5 -Body '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-03-26","capabilities":{},"clientInfo":{"name":"Camelot-startup-check","version":"1.0"}}}'
        $rpc = Read-Rpc $response
        if ($rpc.error -or -not $rpc.result.serverInfo) { throw 'MCP initialization failed.' }
        break
    } catch {
        if ((Get-Date) -ge $deadline) { throw "Unreal MCP not ready: $($_.Exception.Message)" }
        Start-Sleep -Seconds 2
    }
} while ($true)
if ($response.Headers['Mcp-Session-Id']) { $headers['Mcp-Session-Id'] = [string]$response.Headers['Mcp-Session-Id'] }
$headers['MCP-Protocol-Version'] = $rpc.result.protocolVersion
try {
    $null = Invoke-WebRequest -UseBasicParsing -Uri $uri -Method Post -Headers $headers -ContentType 'application/json' -TimeoutSec 10 -Body '{"jsonrpc":"2.0","method":"notifications/initialized"}'
    $list = Read-Rpc (Invoke-WebRequest -UseBasicParsing -Uri $uri -Method Post -Headers $headers -ContentType 'application/json' -TimeoutSec 15 -Body '{"jsonrpc":"2.0","id":2,"method":"tools/list","params":{}}')
    if ($list.error -or -not $list.result.tools) { throw 'MCP returned no tools.' }
    if ($ShowToolSchemas) { $list.result.tools | ConvertTo-Json -Depth 30; return }
    Write-Host ('Unreal MCP ready: ' + ($list.result.tools.name -join ', ')) -ForegroundColor Green
    $toolRequest = @{ jsonrpc = "2.0"; id = 3; method = "tools/call"; params = @{ name = $ToolName; arguments = ($ArgumentsJson | ConvertFrom-Json) } } | ConvertTo-Json -Depth 30 -Compress
    $sets = Read-Rpc (Invoke-WebRequest -UseBasicParsing -Uri $uri -Method Post -Headers $headers -ContentType 'application/json' -TimeoutSec 180 -Body $toolRequest)
    if ($sets.error -or $sets.result.isError) { throw ($sets | ConvertTo-Json -Depth 10 -Compress) }
    $sets.result.content | Where-Object type -eq text | ForEach-Object { $_.text }
} finally {
    if ($headers['Mcp-Session-Id']) {
        try { $null = Invoke-WebRequest -UseBasicParsing -Uri $uri -Method Delete -Headers $headers -TimeoutSec 5 } catch {}
    }
}
