# Camelot: Realms at War

A spiritual successor to *Dark Age of Camelot* (DAoC), built in Unreal Engine 5 around tactical Realm versus Realm (RvR) combat between three factions.

This private repository serves as the development starting point and project record. The project is independent of the original game and uses none of its assets.

## Vision

The project aims to capture the core of DAoC: **small, tactical fights between three asymmetric factions**, with distinct classes and an emphasis on group play. The initial scope excludes an open-world MMO, crafting, and housing.

## Development Context

- **Team** — Solo development with help from Claude Code/Fable for code, backend work, and documentation. Targeted art and audio support may follow. See [Team and Contributors](#team-and-contributors).
- **UE5 experience** — The plan includes time to learn the engine.
- **Background** — IT, networking, and authentication, with most experience on the server and backend side.
- **Current scope** — A small multiplayer prototype.

## Name

The name “Camelot” comes from Arthurian legend. *Dark Age of Camelot* is a distinct EA/Broadsword brand. Mark Jacobs, the creator of the original game, also used “Camelot” in the title of his spiritual successor, *Camelot Unchained*. This project's title is intended to keep a clear distance from the original brand.

## Tech Stack

- **Engine** — Unreal Engine 5.8, installed under `C:\Program Files\Epic Games\UE_5.8`.
- **Foundation** — Epic's **Third Person Template** since July 26, 2026. The team system, multiplayer foundation, and GAS integration are built on top of the template. See [Architecture Change](#architecture-change-lyra-to-third-person-template).
- **Combat** — The Gameplay Ability System (GAS) handles network-replicated classes, abilities, cooldowns, buffs, and debuffs.
- **Languages and tools** — C++ for core systems, Blueprints and DataTables for content and balance.
- **Prototype networking** — Listen server first, with a dedicated server when needed.
- **Authentication and persistence** — Deferred until the combat loop works. If needed, a separate web service can handle login and tokens, with the UE server validating tokens on connection. This fits the project's networking and authentication experience.

## Localization

English is the source language. German, French, and Spanish are target languages from the start. Represent all player-facing text as **`FText`**. Use `LOCTEXT` or `NSLOCTEXT` in C++, `Text` in Blueprints, and `FText` columns in DataTables for class, item, and ability names. Use String Tables for larger or recurring blocks of text.

In the UE5 Localization Dashboard, configure `en` as the source and `de`, `fr`, and `es` as targets. Gather text, export `.po` files, translate them, import the translations, and compile them to `.locres` files. Players can switch languages at runtime.

Set up the localization infrastructure from the beginning. Add German, French, and Spanish translations incrementally as the content stabilizes. Those translations are outside the vertical slice's completion criteria.

## Art Direction

Start with a **comic or toon style**, using cel-shading post-processing and outlines. Refine or replace assets once the core gameplay works.

- Stylized assets are cheaper to make or source than photorealistic assets and easier to combine with Marketplace or Fab content.
- Flat shading helps players distinguish crimson, teal, and forest-green faction colors during RvR fights.
- Simpler materials help meet the performance targets.

Gameplay classes reference meshes and materials through replaceable variables or Data Assets. Use the standard mannequin skeleton for animation retargeting so later meshes can reuse the same animations.

## Asset Production Standard

**Caledonia 5.9 is the active project. All new Caledonia mesh assets are authored for Nanite.** Enable Nanite on import and verify the result in Unreal Engine 5.9 before treating the asset as ready. For asset types that do not support Nanite, document the limitation and the rendering path used.

## Performance Targets

**The game must run on modest hardware.** DAoC designed for low-end hardware from the start with low polygon counts, baked or static lighting, simple shaders, and aggressive LOD and culling.

- Disable **Lumen** and use baked lighting through **Lightmass**.
- Use **Nanite** for new Caledonia mesh assets. See [Asset Production Standard](#asset-production-standard).
- Evaluate **forward rendering** as an option for scenes with many characters, where it may cost less than deferred rendering.
- Test UE5 scalability settings from Low through Epic on multiple machines from the beginning.
- Pick a performance target around a five-year-old midrange GPU and test against it regularly.

## Servers and Test Hardware

Existing test hardware covers both ends of the performance range for task #10 without new purchases.

- **HP ZBook** — Mobile workstation with entry-level NVIDIA G100 professional graphics. This is the lower-end rendering reference.
- **AMD Ryzen 9 desktop with an NVIDIA RTX 40-series GPU** — High-end reference.
- **Older Linux laptop** — LAN dedicated-server test machine. A headless server primarily needs CPU and RAM.

| Phase | Server needs | Cost |
|---|---|---|
| Phases 0–1, learning and original Lyra setup | Use Play in Editor with several local clients | €0 |
| Phase 2, networking foundation (task #5) | Listen server with the UE5 integration for Epic Online Services (EOS). The free tier covers NAT traversal and sessions. | €0 |
| LAN dedicated-server test (task #5) | Use the existing Linux laptop. Cross-compile a UE5 Linux dedicated-server build, run it headless, and connect over the LAN IP. | €0 |
| Internet or 24/7 hosting, once testing extends beyond the home network or needs an always-on machine | Small VPS for a headless server build. Prioritize CPU cores. Example: Contabo Cloud VPS 4, with 4 vCPUs, 8 GB RAM, and a 100 GB SSD. | About €5.50/month in the original 24-month pricing research. Shorter terms cost more. |
| Larger alpha or beta tests if the project grows | Larger VPS such as Contabo Cloud VPS 8, with 8 vCPUs and 24 GB RAM, or equivalent. | About €14/month and up in the original estimate, depending on player count. |

The project's June 2026 research recorded significant Hetzner price increases from June 15, in some cases 2.5–3×, and identified Contabo as the cheaper option at the time. Recheck providers and prices when making a decision.

Use **Linux** for dedicated servers. UE5 supports it natively and it avoids additional OS licensing costs. See [COSTS.md](COSTS.md) for ongoing costs, planned expenses, and free tools.

## Scaling and MMO Scope

UE5's standard replication is built for action multiplayer on the order of dozens to around a hundred players. *Ashes of Creation* is a UE5 reference project aiming for sieges of roughly 250–500 players. Its approach requires extensive networking work, including interest management, server meshing, and Iris replication. That scale takes years of engineering and a team.

DAoC accommodated large server populations, but even its famous keep sieges involved far fewer players within melee range at any one time. Zone battles were closer to dozens to roughly 150 per side. Smaller fights can capture the same feel. Revisit large-scale networking if the project grows and a team forms. The networking layer can be replaced later without rebuilding the GAS combat and class systems.

## Roadmap

**Phase 0 — UE5 fundamentals** 🟡 *In progress*  
Learn Blueprint basics with Epic's “Your First Hour,” then study multiplayer and replication through small throwaway projects.

**Phase 1 — Technical foundation** 🟢 *Complete*  
Set up the Third Person Template, add GAS manually through Blueprints, define what belongs in C++ and Blueprints, and configure the rendering pipeline. The July 26, 2026 switch from Lyra reduced project scope and Git LFS overhead.

**Phase 2 — Vertical slice: battleground first**

First prove that the core combat is fun. Player onboarding becomes relevant when outside testers join.

1. Connect two players and make sure each sees the other move in sync.
2. Implement one class with auto-attacks and one or two GAS abilities. Replicate health, death, and respawning.
3. Add a second class for a second faction to test asymmetric play with a manageable setup.
4. Build a small, symmetrical **battleground** with one central objective, such as a flag or capture node. A toon-style graybox is sufficient. DAoC's Thidranki and Braemar are the reference for scale.
5. Playtest with friends and tune the abilities.
6. Add a third faction and class once combat between two factions works well.

**Starting area and tutorial** — After the vertical slice, build a small starting area for each faction once playtesters or contributors unfamiliar with the project join. Use DAoC zones such as Cotswold as a reference and connect each area to the battleground.

**Afterward** — Consider a larger world or persistence once playtesting shows that the core gameplay is fun.

## Team and Contributors

Earlier community-led DAoC successor projects repeatedly stalled. Common causes included relying on design documents without a playable prototype, volunteer teams without clear commitments, oversized scope, design by committee, and IP concerns.

Recruit around a playable vertical slice. Claude Code/Fable helps with some systems and backend programming, historically a major bottleneck for community projects. Original 3D art, animation, playtesting judgment, and work that can proceed in parallel still need people.

When recruitment begins, look to DAoC subreddits and Discords for players who know the genre, and Unreal Slackers or r/unrealengine for technical skills. Show progress through itch.io or IndieDB devlogs. For individual assets, consider paid commissions with clear deliverables and limited team-management overhead.

## Unreal MCP in the Editor

Epic's official plugin connects Claude Code directly to the Unreal Editor from a terminal session. It can spawn actors, edit Blueprints and materials, and configure GAS abilities through editor tools. See [SETUP.md](SETUP.md) for the full setup and troubleshooting notes.

## GitHub Copilot and Claude Code

Use GitHub Copilot in the editor for self-contained work that follows a known pattern, such as a C++ class, DataTable struct, utility function, or test scaffold. Use Claude Code for work that depends on context across files, architecture decisions, or planning.

For moodboards and visual references, the project preferred Copilot's image generation after comparing battleground concepts with Claude's SVG sketches. See the [Frontier vision document](Docs/Design/OpenWorld_Frontier_3Realms_Vision.md).

## References and Research

- **Dawn of Light (DOL)** — A GPL-licensed DAoC server emulator. Consult it to understand combat and RvR formulas. Respect its license and avoid copying code directly.
- Firsthand play experience is the primary reference for class balance and the feel of RvR.
- Use `/inspect` exports of the developer's characters to calibrate itemization ranges.
- **Ashes of Creation** — Reference for UE5 networking at siege scale.
- [AssetHub.io](https://assethub.io/) — Generates 3D meshes from images or text. Useful for quick placeholders or base meshes in early character, item, and environment prototypes before commissioning custom art.
- **RPG System - All-In-One (Top-Down & Third-Person)** — Marketplace reference for evaluating potential GAS extensions. Use its top-down and third-person RPG systems as an architecture benchmark.

## Architecture Change: Lyra to Third Person Template

The project switched on **July 26, 2026**. Even the smallest Lyra test case, with an empty map, one player-controlled paladin, and no abilities or second actor, repeatedly produced frozen movement or sliding without animation in live playtests after fixes had been reported as verified. See [issue #14](../../issues/14).

The recurring problem was difficult to trace through Lyra's Experience, PawnData, and LinkedAnimLayer systems. Its runtime wiring spans several systems, limiting what property inspection and logs can establish.

Epic's **Third Person Template** provides working movement, animation, and camera behavior out of the box. GAS is added manually. This follows a documented community pattern, including “Getting Started with GAS in Unreal Engine” tutorials and [TheDevRealm's](https://www.youtube.com/@TheDevRealm) MMO series.

The existing [combat, rear-attack, death, and respawn design](SYSTEMS.md) carries over because it uses general GAS concepts. The change primarily rebuilds the character, team, and replication foundation that Lyra previously supplied.

Use a small, empty test map to verify movement and animation first, then rebuild GAS combat incrementally.

## Deferred Scope

- **Crafting** — Planned for release. Materials can be purchased with in-game currency or gathered. See the pacing section of the [Home Realms vision](Docs/Design/OpenWorld_HomeRealms_Vision.md).
- **Housing** — Planned as a post-release add-on. See the same vision document.
- An open, persistent world.
- Account and login servers, and database persistence.
- Deep itemization and loot systems.
- More than three classes per faction.
- Starting areas and tutorials until after the vertical slice. The [Home Realms vision](Docs/Design/OpenWorld_HomeRealms_Vision.md) sketches the longer-term concept.
- Networking for fights of 100+ versus 100+ players, to revisit if the project grows.

## Status

🟢 Unreal Engine 5.8 is installed and the test project runs. The README records the project as being in Phase 0, learning UE5 fundamentals.
