# Camelot: Realms at War — Game Design Document

**Version:** 0.1 · **Date:** November 23, 2026 · **Stage:** Prototype and design proposals

1. [Executive summary](#1-executive-summary)
2. [Setting and lore](#2-setting-and-lore)
3. [World and level design](#3-world-and-level-design)
4. [Characters and progression](#4-characters-and-progression)
5. [Combat and abilities](#5-combat-and-abilities)
6. [Items and economy](#6-items-and-economy)
7. [RvR and territory](#7-rvr-and-territory)
8. [Living world and quests](#8-living-world-and-quests)
9. [Social systems and interface](#9-social-systems-and-interface)
10. [Technical design and production](#10-technical-design-and-production)
11. [Milestones and open decisions](#11-milestones-and-open-decisions)

## 1. Executive summary

**High concept.** Camelot: Realms at War is a tactical multiplayer game where small groups from three realms contest a shared battlefield. Players read terrain, coordinate class abilities, and choose when to commit to a fight or fall back. The first playable milestone is a compact battleground with one contested objective.

**Audience.** Players who enjoy coordinated group PvP, asymmetric faction abilities, and fights shaped by terrain and positioning.

| Design pillar | What it means in play |
|---|---|
| Position matters | Sightlines, cover, elevation, and attack direction change decisions before and during a fight. |
| Classes work together | A group can recognize what each member contributes and how to counter the opposing lineup. |
| Three realms create pressure | Objective placement and alternate routes give each realm a reason to enter the contest. |
| A setback creates a next move | After defeat, players can regroup and return through a readable route with a meaningful choice. |
| Fight readability | Team colors, effects, and objective feedback should remain legible in motion on the target hardware. |

**Core player journey.** Join a realm, spawn with a class, approach the objective, read enemy positions, coordinate an engagement, and capture or defend. After defeat, respawn and decide whether to return directly, regroup, or take another route. The slice begins with two factions so that early tests can isolate class and map problems.

## 2. Setting and lore

| Realm | Visual and cultural direction |
|---|---|
| Albion | Arthurian and British influences. Use fortified masonry and clear martial heraldry. |
| Midgard | Norse and Scandinavian influences. Use practical timber and stone architecture. |
| Hibernia | Celtic and Irish influences. Draw on landscape, woodland, and spiritual sites. |

The frontier brings the realms into contact through contested routes and strongholds. The realm-specific epic quest outlines are source material for faction motives, landmarks, and supporting characters. Develop those details alongside encounter design. See the outlines for [Albion](Design/Albion_Epic_Questline.md), [Midgard](Design/Midgard_Epic_Questline.md), and [Hibernia](Design/Hibernia_Epic_Questline.md).

## 3. World and level design

| Play space | Role | Stage |
|---|---|---|
| Prototype battleground | Small, readable map with one flag or capture node and repeatable fights. | Vertical slice |
| Caledonia Biesenthal | Approximately one kilometre across, with a central keep, three realm approaches, a ring road, woodland, river crossings, and a village. | Active UE 5.9 map workspace |
| Contested frontier | Shared territory with alternate routes, fortifications, and neutral objectives that encourage three-way contact. | Design proposal |
| Home realms | Realm-specific PvE and leveling regions with settlement hubs, quest routes, and entrances to battlegrounds. | Design proposal |

Caledonia's three approaches should give the realms comparable opportunities to reach the contest while using different terrain and sightlines. Test route times at actual movement speed, from spawn to first contact, across multiple runs. Evaluate where players first see each other and whether an approach has a safe regrouping option. Candidate home-realm layouts include hub-and-spoke travel and routes through successive progression regions. See the [frontier vision](Design/OpenWorld_Frontier_3Realms_Vision.md) and [home realms vision](Design/OpenWorld_HomeRealms_Vision.md).

## 4. Characters and progression

Start with one class and a small combat kit. Add a second faction's class once the first kit works across two clients. Test the third faction after the two-faction matchup produces understandable decisions. Use frontline, ranged control, support, and scouting roles as design vocabulary when comparing future kits.

Later progression proposals include passive talents, modifications to existing abilities, and a capstone for each specialization. The detailed notes explore two talent paths per class, PvE leveling, and RvR advancement. The final roster, faction symmetry, level cap, and progression pace remain design decisions. See [class concepts](../CLASSES.md) and [talent progression](Design/SkillTree_Progression.md).

## 5. Combat and abilities

- **Prototype actions** — Movement, target acquisition, auto-attack, and one or two Gameplay Ability System (GAS) abilities. Use distinct cues for ability activation, hit or miss, and defeat.
- **Resources and effects** — Start with health, then add resources or secondary attributes when an ability makes them meaningful. GAS owns modifiers, buffs, debuffs, and cooldowns.
- **Position** — The systems proposal includes a rear-attack mechanic evaluated on the server. Its initial tuning example doubles eligible damage within a rear cone. Validate the angle, timing, counterplay, and resulting burst in playtests before adopting it as a balance rule.
- **Defeat and respawn** — Replicate health, death, and respawn. Verify a defeated player stops participating, both clients see the transition, and control returns at the intended spawn. Investigate waves or invulnerability if testing shows repeated spawn pressure.

See [gameplay systems](../SYSTEMS.md) for attribute, ability, HUD, and implementation notes.

## 6. Items and economy

The slice needs enough loadout data to make combat repeatable. Use controlled test equipment for early balance comparisons. The broader design explores equipment requirements, quality, durability and repair, recipes, and one primary crafting profession per character. Potential suppliers include settlements and resource points on travel routes. Establish whether production and trade create useful player choices before adding an auction house.

The earlier design distinguishes ordinary currency earned and spent in PvE and trade from Realm Points earned through RvR. Final currency tiers, payouts, item requirements, and rank benefits depend on playtest results and progression pacing. Housing is a later expansion concept. See [crafting professions](Design/Crafting_Professions.md), [item requirements](Design/Item_Requirements_Penalties.md), and the [auction-house proposal](Design/Auction_House.md).

## 7. RvR and territory

The first battleground tests capture, contesting, and defense around a single objective. The interface should communicate who controls it and when it is contested. The playtest must show that either team can mount a credible response after losing the objective. Test a third-realm entry once the two-sided loop works.

Later keep design explores ownership, defensive guards, upgrades, and Realm Point rewards for RvR participation. Compare how alternate entrances, reinforcement travel time, and defensible positions affect attackers and defenders. Persistent ownership, rank rewards, guild administration, and large sieges remain later scope. See the [earlier game design](../Design.md) for keep and Realm Point proposals.

## 8. Living world and quests

Caledonia has six documented encounter locations. The gameplay below describes design uses for those locations.

| Location | Encounter idea |
|---|---|
| Northern post station | Escort a traveler or locate a missing delivery. |
| Old quarry | Recover supplies or investigate missing workers. |
| Woodland camp | Follow a caravan's trail, investigate an ambush, or repair a stranded wagon. |
| Fishing site | Move river cargo or uncover a smuggling route. |
| Ruined watchtower | Scout an approach, relay a signal, or defend the vantage point. |
| Old shrine | Find a relic or solve an environmental puzzle. |

Prototype one full encounter with a readable approach, a goal, feedback on completion, and a clear behavior when another player arrives first. Realm-specific quests, spiritual sites, material suppliers, and frontier NPCs can extend this pattern. See [quest design](Design/Quests.md) and [frontier NPCs](Design/Frontier_NPCs_and_Questlines.md).

## 9. Social systems and interface

The battleground HUD should communicate health, ability readiness, faction, and objective state without obscuring the fight. Prioritize dependable feedback for ability activation, damage, defeat, and respawn. Make faction recognition work through readable shapes or labels as well as color. Player-facing text uses Unreal's localization pipeline, with English as the source and German, French, and Spanish as planned languages.

Start with small groups and the communication needed for a playtest. Consider party tools, chat channels, guilds, and social moderation as the audience expands. See [UI design](Design/GUI_UI_Design.md) and [chat concepts](Design/Chat_System.md).

## 10. Technical design and production

| Area | Foundation |
|---|---|
| Repository prototype | `CamelotRAW_TP.uproject` declares UE 5.8. It uses the Third Person Template and a custom GAS foundation. |
| Caledonia | UE 5.9 is the active map and asset workspace. Author all new Caledonia meshes for Nanite and verify them in UE 5.9. Document the rendering path for unsupported asset types. |
| Networking | Listen server for early tests, with server authority for combat and objective state. Evaluate a dedicated server when testing requires it. |
| Content | C++ for core systems, Blueprints and DataTables for content and tuning. Keep original mesh sources and note dependency provenance. |
| Tools | ChatGPT/Codex for planning, review, documentation, cross-file work, and Unreal MCP when connected. GitHub Copilot for focused IDE implementation. |
| Verification | Record engine version, test map, graphics settings, and observed results. Run two clients for replicated changes. Check gameplay-distance readability, collision, materials, and performance on the relevant hardware. |

The [Project Handbook](Project_Documentation_and_Ideas.md) covers setup, collaboration, hardware, and handoff. The [Caledonia release](https://github.com/Unaragan/camelot-realms-at-war/releases/tag/caledonia-katalog-2026-11-23) includes the verified level download and asset previews. Opening the full map requires the matching Caledonia 5.9 project content.

## 11. Milestones and open decisions

| Milestone | Evidence to collect |
|---|---|
| Network baseline | Two clients connect and see each other's movement reliably. |
| First combat kit | Both clients observe consistent damage, cooldowns, death, and respawn. |
| Two-faction objective test | A small group can explain why it won or lost a fight. Both sides get a credible chance to re-engage. |
| Three-realm test | The third realm adds meaningful decisions about timing and routes. Record spawn-to-contact times and contested-objective outcomes by realm. |
| Expansion decision | Use playtest findings to prioritize progression, keeps, or world content. |

**Open decisions.** Pick the first capture rule and reset condition. Decide which class pairs expose the most useful asymmetry. Establish the route-time and frame-time targets after measuring a baseline. Decide which Caledonia routes or locations to bring into the first multiplayer test. Defer account persistence, large-scale hosting, and a full economy until tests justify them.

## Network relevance from the DAoC review

Prototype per-connection interest management after the two-client replication baseline. The server selects relevant actors using spatial proximity and explicit rules for combat, parties, objectives, and private state. Measure how the approach behaves when players converge at the same keep gate. See [Multiplayer Scaling and Network Relevance](Technical/Multiplayer_Scaling.md) for the DOLSharp finding, replication policy, and test plan.
