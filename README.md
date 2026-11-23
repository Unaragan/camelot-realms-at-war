# Camelot: Realms at War

A tactical Unreal Engine multiplayer prototype built around Realm versus Realm combat between Albion, Midgard, and Hibernia. The current milestone is a small battleground that proves class roles, positioning, and group play with two factions before adding the third.

## Start here

- [Project handbook](Docs/Project_Documentation_and_Ideas.md) covers the project direction, technical foundation, Caledonia, and design ideas.
- [Developer onboarding](Docs/Project_Documentation_and_Ideas.md#developer-onboarding) covers the Windows setup, Git LFS, engine versions, and the first two-client test.
- [Collaboration and asset handoff](Docs/Project_Documentation_and_Ideas.md#collaboration-and-asset-handoff) covers pull requests, Unreal binaries, and map dependencies.
- [Caledonia release](https://github.com/Unaragan/camelot-realms-at-war/releases/tag/caledonia-katalog-2026-11-23) contains the Biesenthal level file, inline asset gallery, and downloads.

## Workspaces

| Workspace | Engine | Purpose |
|---|---|---|
| `CamelotRAW_TP.uproject` in this repository | UE 5.8, as declared in the project file | Third Person Template prototype with a custom Gameplay Ability System foundation. |
| Caledonia 5.9 | UE 5.9 | Active Caledonia map and asset workspace. All new Caledonia meshes are authored for Nanite and verified in UE 5.9. |

The Biesenthal download contains the level file. Ask the maintainer for the matching Caledonia 5.9 project and required assets before opening the full level.

## Development tools

Use **ChatGPT/Codex** for project planning, documentation, cross-file work, and Unreal Editor tasks through Unreal MCP when connected. Use **GitHub Copilot** for focused implementation and IDE completions. Record the engine version, verification steps, and known limitations in each pull request.

The repository is private. The project is independent of *Dark Age of Camelot* and uses none of that game's assets.
