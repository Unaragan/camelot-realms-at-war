# Codex + Unreal (2026-09-29)

This file supplements CLAUDE.md; read its gameplay rules and Definition of Done.
Current workspace: this repository, CamelotRAW_TP.uproject, Third Person + custom GAS.
Communicate with Michael in German; reusable prompts in English.

## Editor access
Codex desktop can use the existing Unreal MCP HTTP server directly. A Claude terminal
is no longer required. The Windows user configuration contains:
[mcp_servers.unreal-mcp]
url = "http://127.0.0.1:8000/mcp"
startup_timeout_sec = 120
tool_timeout_sec = 180

Start with list_toolsets, then describe_toolset and call_tool. Discover exact schemas;
never invent tool names. If tools are absent in an already-running chat, reconnect the
MCP server or restart Codex after Unreal is ready. Configuration alone is not proof
that a tool is callable in the current chat.

## Startup
tools/start-dev.ps1: clean-worktree fast-forward pull, optional NAS download cache copy,
start/reuse this editor, MCP initialize/tools-list/toolsets check, open/reuse Codex.
-SkipSync explicitly skips the pull and cache copy for local work.
Do not sync assets while an editor is already using the project.
No Claude terminal is launched and no AI task is submitted automatically.

Direct .uproject launch: the compiled editor module starts MCP and invokes
tools/open-codex.ps1 once during engine initialization. Commandlets/unattended builds
must not open desktop apps. This path does not pull Git or copy files after load.
MCP user config is machine-local: configure each PC separately.
Source changes to the startup module require an editor-closed build on each PC.

## Verification and known limitations
Never equate successful compilation/property reads with user-confirmed gameplay.
Check Saved/Logs/CamelotRAW_TP.log proactively.
Keep new content under Content/Camelot, but World Partition actor files are also
required under Content/__ExternalActors__/Camelot and possibly __ExternalObjects__.
Those external files are currently ignored: cross-machine map sync is NOT complete.
NAS SharedAssetsCache is a download cache, not a complete project dependency restore.
Do not claim a clean git status proves a complete backup.
Do not make unrelated gameplay/animation changes while configuring integration.

## Current verification (2026-09-29)
Editor module compiled and linked successfully using GetOnPostEngineInit().
MCP HTTP initialize, tools/list and tools/call list_toolsets succeeded from this chat.
The native Unreal MCP tools may need a Codex reconnect/restart; until then the same
server can be called through tools/test-unreal-mcp.ps1 -ToolName ... -ArgumentsJson ...
This helper discovers meta-tools on every connection and supports schema-driven calls.
Default readiness timeout is 600s (the first DX11 launch took about 3 minutes).
On this notebook only, Saved/Config/WindowsEditor/Engine.ini sets DX11 after a
reproducible NVIDIA nvcuda64.dll access violation during DX12 startup. This local
override is not versioned or a universal recommendation for the desktop PC.
Separate startup findings: GameFeatureData AssetManager scan rule missing;
GameplayCueNotifyPaths unspecified; navigation serialization/layout warnings.
No gameplay or asset modifications were made as part of the Codex migration.

Final read-only MCP call: EditorAppToolset.SearchCVars(sg.ShadowQuality) returned 0.
Launcher reuse test passed: no second editor, no Claude terminal, MCP registry reachable.
