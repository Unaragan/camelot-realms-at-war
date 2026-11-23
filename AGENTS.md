# Codex and Unreal contributor instructions

Use [SETUP.md](SETUP.md) for setup, the [Project Handbook](Docs/Project_Documentation_and_Ideas.md) for collaboration, and the [Game Design Document](Docs/Game_Design_Document.md) for current design scope. The versioned prototype is CamelotRAW_TP on UE 5.8. Caledonia asset and map work uses the separate UE 5.9 workspace. Use ChatGPT/Codex and GitHub Copilot for the current workflow. Communicate with Michael in German and write reusable prompts and contributor documentation in English.

## Unreal MCP and startup

Codex can use the Unreal MCP HTTP endpoint directly, when connected. This desktop configuration is machine-local.

```toml
[mcp_servers.unreal-mcp]
url = "http://127.0.0.1:8000/mcp"
startup_timeout_sec = 120
tool_timeout_sec = 180
```

Discover toolsets and exact schemas before making calls. Start with list_toolsets, then describe_toolset and call_tool where available. If tools are missing, check editor readiness and reconnect Codex. The repository's tools/test-unreal-mcp.ps1 helper can verify the handshake and invoke discovered tools. The direct project launch starts MCP and can open Codex after editor initialization. Commandlets and unattended builds should run without desktop apps.

## Implementation and verification

- Prefer existing engine and project systems. Use Blueprints and DataTables for content and balance and C++ where core systems require it. Keep replicated combat, objective, and respawn decisions on the server.
- Keep new prototype content under Content/Camelot. Track any required external actor and object data in the handoff. The current ignore rules leave gaps in cross-machine World Partition sync. The shared download cache is only one source of dependencies.
- Author new Caledonia mesh assets for Nanite and verify them in UE 5.9. Document unsupported cases.
- Check the editor log, inspect the actual saved result, and run a build for C++ changes. For gameplay, exercise the behavior in Play in Editor. Use two clients for replication. State what was tested and what remains unverified.
- Keep changes scoped. Avoid unrelated gameplay, rendering, or animation changes during setup. Coordinate edits to shared Unreal binaries.

Historical notes and prior workflows are indexed in [Documentation Index](Docs/Documentation_Index.md).
