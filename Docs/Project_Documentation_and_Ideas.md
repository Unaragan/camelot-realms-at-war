# Project Handbook

## Project direction

Camelot: Realms at War is a tactical Realm versus Realm (RvR) multiplayer prototype. Albion draws on Arthurian traditions, Midgard on Norse traditions, and Hibernia on Celtic traditions. The prototype tests whether distinct faction roles, positioning, and group coordination make small fights worth replaying.

The immediate milestone is a compact battleground with one central objective. Start with two connected players, one class with auto-attacks and one or two abilities, and replicated health, death, and respawn. Add a second faction and class to test asymmetric play. Bring in the third faction after the two-faction test plays well. Use friends' playtests to tune abilities, travel times, and how quickly a losing team can rejoin a fight.

## Developer onboarding

1. Sign in to GitHub with your own account and confirm that the private repository is visible. Clone it to a local Windows drive with Git and Git LFS installed. Use the repository's GitHub remote for shared work.
2. Install the Unreal Engine version declared by the project's `.uproject`. The repository's `CamelotRAW_TP.uproject` currently declares UE 5.8. **Caledonia 5.9 is the active Caledonia workspace**, and its level and assets should be opened in that project with UE 5.9. These are distinct workspaces. Ask the project maintainer for the matching Caledonia 5.9 project snapshot and dependency list before attempting a full map load.
3. Install the Visual Studio C++ build workload and Windows SDK for native builds. If opening the project for the first time prompts for a module rebuild, build against the matching engine version.
4. Run the commands below from the repository root. Open the repository's test level and run Play in Editor before beginning a task. For multiplayer changes, run two clients and verify the behavior on both.

```powershell
git lfs install
git lfs pull
.\tools\start-dev.ps1
```

The launcher targets the repository's UE 5.8 project. It checks for a clean worktree before synchronization, starts or reuses the editor, and checks Unreal MCP readiness. Use `-SkipSync` when deliberately working from the local version without pulling or copying the download cache. Keep worktrees local and coordinate changes to shared Unreal binaries before editing. See [developer workspace notes](../AGENTS.md) for startup and troubleshooting details.

## ChatGPT, Codex, and Copilot

- **ChatGPT and Codex** support planning, documentation, code review, and changes that span files or systems. Codex is the current workflow for editor-assisted tasks through Unreal MCP when the editor connection is available. Discover registered tools and their schemas before use. Verify the work in the editor or build rather than relying on a tool's success response alone.
- **GitHub Copilot** supports focused implementation and completions in the IDE, including C++, test scaffolding, Blueprint-facing code, and repetitive structures.
- Human reviewers own changes to gameplay, balance, content, and architecture. In a pull request, record the project and engine version used, what was tested, and any remaining verification or dependencies.

## Collaboration and asset handoff

- Use a focused branch and pull request for each change. Explain the intended outcome, list affected maps, Blueprints, or project settings, and include reproducible verification steps. Add screenshots to visual changes.
- Coordinate ownership before editing the same `.umap` or `.uasset`. These files are difficult to merge. Use the repository's existing Git LFS rules for tracked Unreal binaries.
- **A Git checkout alone does not restore Caledonia.** The published Biesenthal `.umap` is a level file and depends on the matching project content. The repository also documents gaps in cross-machine sync for World Partition external actor and object files. Verify all required packages, plugins, and external actor data on a second machine before calling a handoff complete. Treat the NAS download cache as a cache.
- Use the private [Caledonia release](https://github.com/Unaragan/camelot-realms-at-war/releases/tag/caledonia-katalog-2026-11-23) for dated map snapshots, gallery files, and approved original asset exports. Include provenance, engine version, and any dependencies with each package. Share third-party source assets only when the license permits redistribution.

## First contribution

A practical first task is to open the repository prototype, run a two-client session, and record the connection, movement, and replication baseline. For Caledonia asset work, start with an isolated mesh and confirm Nanite, material appearance, and collision in UE 5.9 before integrating it into the main map. Record whether the evidence came from a build, editor inspection, or playtest.

## Combat and implementation

- The Realm at War prototype uses Epic's Third Person Template and a custom Gameplay Ability System (GAS) foundation. The [README](../README.md) records the move from Lyra.
- C++ supports the core systems. Blueprints and DataTables carry content and balance definitions. Keep player-facing strings localizable with Unreal's `FText` and String Tables where appropriate. English is the source language, with German, French, and Spanish planned.
- Prototype networking starts with a listen server. Evaluate a dedicated server when the test requires one. Authority for damage, health, death, and respawn belongs on the server.
- The combat design proposes reusable rear attacks. Test the angle on the server when the ability activates and apply the proposed damage multiplier only to damage, including when an ability also heals. Validate damage, defeat, and respawn with two clients before layering on more combat systems.
- Keep initial performance testing practical. Measure on the lower-end laptop and the desktop reference, using the same route and scalability settings when comparing changes.

## Rendering, localization, and hosting

The prototype uses a toon-style rendering direction for readable faction colors and a manageable performance budget. The original performance plan calls for baked lighting through Lightmass, evaluating forward rendering, and testing Low through Epic scalability settings. Use the active Caledonia Nanite standard above for new meshes. Keep frame-rate results tied to the hardware, route, and settings used.

Use the Unreal Localization Dashboard to gather English source text, export PO files, and import and compile translations for German, French, and Spanish as content stabilizes. Preserve runtime language switching as the localization pipeline develops.

Use local Play in Editor sessions first. The server plan progresses from a listen server to a headless Linux LAN test when needed, with hosted infrastructure deferred until external testing calls for it. See [cost planning](../COSTS.md) and [network scaling](Technical/Multiplayer_Scaling.md) for background estimates and alternatives.

## Caledonia 5.9 map and assets

**Caledonia 5.9 is the active map project.** The main level is `/Game/Maps/Caledonia_Biesenthal`. The [release](https://github.com/Unaragan/camelot-realms-at-war/releases/tag/caledonia-katalog-2026-11-23) contains the current level file and the asset gallery. A complete level load requires the matching project assets.

The documented terrain is approximately one kilometre across. A central keep anchors the map, with three realm start areas, a ring road, woodland and river approaches, and a village. Keep the three realm approaches comparable in travel time while giving them distinct terrain and sightlines. A route inspection is evidence about geometry and traversal. Class balance, capture timing, and competitive fairness require multiplayer playtests.

Use **Nanite for all new Caledonia mesh assets**. Enable it on import and check the result in Unreal Engine 5.9. Check the mesh at normal gameplay distance and close range. Test walkable collision, object clearances, and material behavior as appropriate for the asset. Record any unsupported asset type and its rendering path. Keep original source files and identify third-party dependencies before packaging downloads.

## Caledonia points of interest

These locations provide places to test quest and encounter ideas. The concepts below describe intended gameplay.

| Location | Design idea |
|---|---|
| Northern post station | Deliver supplies, escort travelers, or follow a missing shipment. |
| Old quarry | Recover tools or resources and investigate missing workers. |
| Woodland camp | Reconstruct a caravan's route, investigate an ambush, or repair a stranded wagon. |
| Riverside fishing site | Handle cargo and river deliveries or investigate smuggling. |
| Ruined watchtower | Scout a route, relay a signal, or defend a vantage point. |
| Old shrine | Explore the site, locate a relic, or solve an environmental puzzle. |

Build a small number of complete encounters before expanding the quest list. Record the intended player approach, the interaction, and what happens when another player or realm reaches the location first.

## Ideas for later milestones

| Idea | Design direction |
|---|---|
| Contested frontier | Give all three realms reasons to enter overlapping territory. Trial a central keep, alternate routes, and neutral objectives that draw players into contact. Evaluate how terrain and objective placement affect third-realm interventions. |
| More battlegrounds | Explore battlegrounds for different level bands. Vary the layout and objective placement while keeping each map's main decision easy to understand. |
| Home realms | Develop realm-specific questing and leveling regions. Compare a hub-and-spoke layout with a more linear route through regions. Use battleground entrances to connect progression areas to RvR. |
| Character progression | Explore two talent paths per class with passive effects, upgrades to existing abilities, and a defining capstone. Keep the first combat test small enough to see whether class roles are distinct. |
| Questlines and realm identity | Develop separate epic questlines for Albion, Midgard, and Hibernia. Use settlements, material suppliers, and spiritual sites to express local identity and give exploration a purpose. |
| Keeps and long-term RvR | Explore ownership, defensive guards, upgrades, and Realm Points. Trial the capture and defense loop before committing to persistent ownership or rank rewards. |
| Crafting and economy | Consider one main profession per character, with recipes, material sources, item quality, durability, and repair. Use the auction-house and economy proposals when evaluating trade and currency sinks. |
| Housing and larger battles | Treat housing as a later expansion idea. Revisit persistent world systems, account infrastructure, and large-scale networking when the playable prototype supports the investment. |

## Design sources

This handbook is the current starting point for contributors. The linked design sources provide detailed mechanics, alternatives, and historical context. Where an older setup note describes a different workflow, use the onboarding section above.

- [Project README](../README.md), [game design document](../Design.md), [gameplay systems](../SYSTEMS.md), and [class concepts](../CLASSES.md)
- [Frontier vision](Design/OpenWorld_Frontier_3Realms_Vision.md), [home realms vision](Design/OpenWorld_HomeRealms_Vision.md), and [multiplayer scaling](Technical/Multiplayer_Scaling.md)
- [Talent progression](Design/SkillTree_Progression.md), [crafting professions](Design/Crafting_Professions.md), and [auction house](Design/Auction_House.md)
- [Spiritual sites](Design/Spiritual_Sites_POI.md), [material suppliers](Design/Material_Suppliers_POI.md), and [frontier NPCs and questlines](Design/Frontier_NPCs_and_Questlines.md)
- Epic questlines for [Albion](Design/Albion_Epic_Questline.md), [Midgard](Design/Midgard_Epic_Questline.md), and [Hibernia](Design/Hibernia_Epic_Questline.md)

## Development workstation

Desktop used for local Unreal Engine development and higher-end performance comparisons. Hardware recorded on November 23, 2026.

| Component | Specification |
|---|---|
| CPU | AMD Ryzen 9 7900X, 12 cores |
| Discrete GPU | AMD Radeon RX 9070 XT, 16 GB VRAM |
| System memory | 31.1 GiB usable, as reported by Windows |
| Motherboard | Gigabyte B840M DS3H WIFI6 |
| Operating system | Windows 11 Pro, version 26H2, build 26300 |

For Unreal performance reports, record the exact engine version, graphics API, resolution, scalability preset, and test scene alongside the results.
