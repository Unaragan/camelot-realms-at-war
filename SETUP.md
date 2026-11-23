# Developer Setup

Start with the [Project Handbook](Docs/Project_Documentation_and_Ideas.md#developer-onboarding) and the [Game Design Document](Docs/Game_Design_Document.md).

## Windows and Unreal

1. Get access to the private GitHub repository. Clone it to a local drive and install Git LFS.
2. Install UE 5.8 for the checked-in `CamelotRAW_TP.uproject`, plus the Visual Studio C++ toolchain and Windows SDK. The launcher currently expects Unreal under `C:\Program Files\Epic Games\UE_5.8`. Caledonia 5.9 is a separate workspace. Obtain its matching project snapshot and dependencies before loading Biesenthal.
3. From the clone, run:

```powershell
git lfs install
git lfs pull
.\tools\start-dev.ps1
```

The launcher checks for a clean worktree before synchronizing, fast-forwards from `origin/master`, and starts or reuses the editor. It can copy downloads from the optional shared cache. Close any other Unreal project before launching because the projects can compete for the MCP port. Use `-SkipSync` when deliberately staying on the local checkout. For a direct editor launch, open the checked-in project file. A direct launch skips Git synchronization and cache copying.

## Verify the workspace

Open the test map and run Play in Editor. For replication work, use two clients and verify both perspectives. If dependencies are missing, obtain the matching project snapshot or template content from the maintainer. Preserve tracked configuration and project files while restoring dependencies. A Git clone and the download cache alone do not restore every Unreal dependency, including ignored World Partition packages.

## ChatGPT/Codex, Copilot, and Unreal MCP

Use ChatGPT/Codex for planning, review, documentation, and editor operations. Use GitHub Copilot for focused work in the IDE. The Unreal MCP endpoint is local to the development machine. Follow [AGENTS.md](AGENTS.md) for the endpoint, tool discovery, and the repository's handshake helper.

## Historical setup

The [July–September 2026 setup notes](https://github.com/Unaragan/camelot-realms-at-war/blob/3aa5872b6ea092e1eb33400e80bea2305c8ab8a1/SETUP.md) are retained in Git history for troubleshooting context. They describe older Claude and Lyra workflows.
