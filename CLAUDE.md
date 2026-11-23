> **Archived workflow.** This page preserves earlier project instructions. Use [AGENTS.md](AGENTS.md) and [Developer Setup](SETUP.md) for the current ChatGPT/Codex and GitHub Copilot workflow. The LFS quota and Lyra instructions below are historical.

# Camelot: Realms at War — Project Guide

Spiritual Successor for Dark Age of Camelot (UE5.8), Three-Faction RvR. [README.md](README.md) Costs: [COSTS.md](COSTS.md) Class design: [CLASSES.md](CLASSES.md) Character Structure per realm: [Docs/Design/Character_Structure_Realms.md](Docs/Design/Character_Structure_Realms.md) Arms & Weapons naming: [Docs/Design/Armor_Weapons_Naming.md](Docs/Design/Armor_Weapons_Naming.md)GUI/UI design: [Docs/Design/GUI_UI_Design.md](Docs/Design/GUI_UI_Design.md) Skill Tree & Talent Progression: [Docs/Design/SkillTree_Progression.md](Docs/Design/SkillTree_Progression.md) Chat system: [Docs/Design/Chat_System.md](Docs/Design/Chat_System.md) Crafting & Professions: [Docs/Design/Crafting_Professions.md](Docs/Design/Crafting_Professions.md) Material suppliers (POIs): [Docs/Design/Material_Suppliers_POI.md](Docs/Design/Material_Suppliers_POI.md) Spiritual sites (POIs): [Docs/Design/Spiritual_Sites_POI.md](Docs/Design/Spiritual_Sites_POI.md) Auction House (Realm Marketplace): [Docs/Design/Auction_House.md](Docs/Design/Auction_House.md) Item Level Requirements & Penalties: [Docs/Design/Item_Requirements_Penalties.md](Docs/Design/Item_Requirements_Penalties.md) Skill/Stat/GUI schemes: [SYSTEMS.md](SYSTEMS.md) Refurbished/archived content (especially Lyra implementation details before the architecture change): [Archive.md](Archive.md) Unreal MCP setup: [SETUP.md](SETUP.md) Reusable terminal prompts: [PROMPTS.md](PROMPTS.md)NPC name pools: [NPC_NAMES.md](NPC_NAMES.md) Frontier NPCs & Questline backlog: [Docs/Design/Frontier_NPCs_and_Questlines.md](Docs/Design/Frontier_NPCs_and_Questlines.md) Epic-Questlines (Lv 1-50) per realm: [Albion](Docs/Design/Albion_Epic_Questline.md), [Midgard](Docs/Design/Midgard_Epic_Questline.md), [Hibernia](Docs/Design/Hibernia_Epic_Questline.md) Quest content & implementation status (central tracker): [Docs/Design/Quests.md](Docs/Design/Quests.md).

## Working Environment: Codex and Unreal

Since 2026-09-29, Codex Desktop has been the active assistant.
Codex chat can be used; a separate Claude terminal session is not required.
Configuration, start sequence and known synchronization limits: **AGENTS.md**.
Check git stand before new work and pull fast-forward only when the work tree is clean.
Game tests remain to be confirmed by the user.

## Definition of Done (editor work)

A terminal session may make a change **not** Report as "fixed"/"verified" only because logs are error-free or object properties show the expected value. Log/property checks only confirm "no error message", not "looks right when actually playing" — this has repeatedly fallen apart (animation, camera, instance number). A change is not considered "finished" until the user has confirmed it himself in a running play session (not just edit mode), ideally with screenshot. Until then: report as "made, untested" or "made, waiting for confirmation", not as done.

## Non-negotiable rules

- **Every player-visible text is `FText`**, never `FString`C++ is hard-coded. `LOCTEXT`/`NSLOCTEXT`Blueprints: `Text`Type. DataTables: `FText`-Column. Target languages: en (source), de, fr, es.
- **No lumen, no nanite for characters.** The target hardware is mid-range, not the developer's computer. *Applies to POC/Vertical Slice.* Artdirection/rendering technique for the final product (possibly lumen/nanite/realistic look) is deliberately still open – see [Docs/Design/OpenWorld_Frontier_3Realms_Vision.md](Docs/Design/OpenWorld_Frontier_3Realms_Vision.md).
- **Gameplay classes reference mesh/material as an interchangeable variable**, never hard-wired — wildcard toon art must be replaceable later without touching logic. standard mannequin skeleton for animation retargeting.
- **Blueprint-first, not a new own C++ code.** New content (classes, skills, items) are built as blueprints, not as new .cpp/.h files — fits the user’s skillset (not a C++ specialist). GAS (Ability System) has been retrofitted manually using the third-person template since the change of architecture (see below) and is no longer prefabricated by Lyra.
- **No original DAOC content** (assets, texts, exact brand names). [CLASSES.md](CLASSES.md) — Archetypes yes, distinctive invented names no.

## Current priority

Battleground vertical slice before starting area/tutorial zone (see roadmap in README.md).

## Scope discipline (not now)

Crafting, housing, open persistent world, login/account server, deep itemization, more than 3 classes per faction, starting area, large network scaling (100+ vs. 100+).

## Server/hardware context

Linux VPS for later dedicated server hosting (Contabo). Two existing test devices: HP ZBook (lower performance target), Ryzen-9/RTX-40s desktop (high-end reference) — both against testing, not just the developer computer.

## Bug tracking

Active, still unresolved bugs are **GitHub Issues** with label `bug` created ()`gh issue create --label bug`), not only mentioned in SETUP.md/SYSTEMS.md.`gh issue close <Nummer>`) with reference to the docu location (SETUP.md Stumbling-Trap Table or SYSTEMS.md Reference Implementation), which explains the fix. **Knowledge base** (how X was solved), GitHub issues are the **Status overview** (what is open now) – `gh issue list --label bug` It shows at a glance what is still active.

## Known technical limitation

Git LFS on GitHub Free has only 1 GB of memory per month — with Lyra as the base (content 1.8 GB, plugins 1.6 GB) already entered. Solution: Content/Plugins deliberately not versioned, installed separately per computer via Epic Games Launcher. See SETUP.md → "Project Base: Lyra + Sync Workflow".
