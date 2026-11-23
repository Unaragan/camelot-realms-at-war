# Camelot: Realms at War

- [Game Design Document](Docs/Game_Design_Document.md) covers the game vision, world, combat, progression, and prototype milestones.

A tactical Unreal Engine multiplayer prototype built around Realm versus Realm combat between Albion, Midgard, and Hibernia. The current milestone is a small battleground that proves class roles, positioning, and group play with two factions before adding the third.

## Start here

- [Project handbook](Docs/Project_Documentation_and_Ideas.md) covers the project direction, technical foundation, Caledonia, and design ideas.
- [Developer onboarding](Docs/Project_Documentation_and_Ideas.md#developer-onboarding) covers the Windows setup, Git LFS, engine versions, and the first two-client test.
- [Collaboration and asset handoff](Docs/Project_Documentation_and_Ideas.md#collaboration-and-asset-handoff) covers pull requests, Unreal binaries, and map dependencies.
- [Caledonia release](https://github.com/Unaragan/camelot-realms-at-war/releases/tag/caledonia-katalog-2026-11-23) contains the Biesenthal level file, inline asset gallery, and downloads.

## Caledonia map and asset downloads

[![Preview of 18 Caledonia asset families](https://github.com/user-attachments/assets/c0adff41-981b-4e2a-a269-7c8966ec58a6)](https://github.com/Unaragan/camelot-realms-at-war/releases/tag/caledonia-katalog-2026-11-23)

| Download | Contents |
|---|---|
| [Biesenthal map for UE 5.9](https://github.com/Unaragan/camelot-realms-at-war/releases/download/caledonia-katalog-2026-11-23/Caledonia_Biesenthal.umap) | Unreal level file. Requires the matching Caledonia 5.9 project assets. |
| [Asset catalog (PDF)](https://github.com/Unaragan/camelot-realms-at-war/releases/download/caledonia-katalog-2026-11-23/Caledonia-Assetbibliothek.pdf) | Preview images for 18 asset families. |
| [Asset gallery (ZIP)](https://github.com/Unaragan/camelot-realms-at-war/releases/download/caledonia-katalog-2026-11-23/Caledonia-Assetbibliothek-Galerie.zip) | 18 JPGs, the PDF, and a gallery README. |
| [Original architecture models (ZIP)](https://github.com/Unaragan/camelot-realms-at-war/releases/download/caledonia-katalog-2026-11-23/Caledonia-Eigenassets-Architektur.zip) | 14 untextured OBJ models. |

Access requires signing in with a GitHub account that can view this private repository. The 18-family catalog is a visual preview of the asset library. The downloadable model package covers 14 original architecture models.

## Workspaces

| Workspace | Engine | Purpose |
|---|---|---|
| `CamelotRAW_TP.uproject` in this repository | UE 5.8, as declared in the project file | Third Person Template prototype with a custom Gameplay Ability System foundation. |
| Caledonia 5.9 | UE 5.9 | Active Caledonia map and asset workspace. All new Caledonia meshes are authored for Nanite and verified in UE 5.9. |

The Biesenthal download contains the level file. Ask the maintainer for the matching Caledonia 5.9 project and required assets before opening the full level.

## Development tools

Use **ChatGPT/Codex** for project planning, documentation, cross-file work, and Unreal Editor tasks through Unreal MCP when connected. Use **GitHub Copilot** for focused implementation and IDE completions. Record the engine version, verification steps, and known limitations in each pull request.

The repository is private. The project is independent of *Dark Age of Camelot* and uses none of that game's assets.

## Documentation index

[Browse all project documents](Docs/Documentation_Index.md), including current setup, original design proposals, and archived material.
