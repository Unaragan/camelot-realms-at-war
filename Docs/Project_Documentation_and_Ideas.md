# Project Documentation and Design Ideas

## Project direction

Camelot: Realms at War is a tactical Realm versus Realm (RvR) multiplayer prototype. Albion draws on Arthurian traditions, Midgard on Norse traditions, and Hibernia on Celtic traditions. The prototype tests whether distinct faction roles, positioning, and group coordination make small fights worth replaying.

The immediate milestone is a compact battleground with one central objective. Start with two connected players, one class with auto-attacks and one or two abilities, and replicated health, death, and respawn. Add a second faction and class to test asymmetric play. Bring in the third faction after the two-faction test plays well. Use friends' playtests to tune abilities, travel times, and how quickly a losing team can rejoin a fight.

## Combat and implementation

- The Realm at War prototype uses Epic's Third Person Template and a custom Gameplay Ability System (GAS) foundation. The [README](../README.md) records the move from Lyra.
- C++ supports the core systems. Blueprints and DataTables carry content and balance definitions. Keep player-facing strings localizable with Unreal's `FText` and String Tables where appropriate. English is the source language, with German, French, and Spanish planned.
- Prototype networking starts with a listen server. Evaluate a dedicated server when the test requires one. Authority for damage, health, death, and respawn belongs on the server.
- The combat design proposes reusable rear attacks. Test the angle on the server when the ability activates and apply the proposed damage multiplier only to damage, including when an ability also heals. Validate damage, defeat, and respawn with two clients before layering on more combat systems.
- Keep initial performance testing practical. Measure on the lower-end laptop and the desktop reference, using the same route and scalability settings when comparing changes.

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

This English overview consolidates current project decisions and selected ideas. The linked source documents preserve detailed mechanics and alternatives in their original language.

- [Project README](../README.md), [game design document](../Design.md), [gameplay systems](../SYSTEMS.md), and [class concepts](../CLASSES.md)
- [Frontier vision](Design/OpenWorld_Frontier_3Realms_Vision.md), [home realms vision](Design/OpenWorld_HomeRealms_Vision.md), and [multiplayer scaling](Technical/Multiplayer_Scaling.md)
- [Talent progression](Design/SkillTree_Progression.md), [crafting professions](Design/Crafting_Professions.md), and [auction house](Design/Auction_House.md)
- [Spiritual sites](Design/Spiritual_Sites_POI.md), [material suppliers](Design/Material_Suppliers_POI.md), and [frontier NPCs and questlines](Design/Frontier_NPCs_and_Questlines.md)
- Epic questlines for [Albion](Design/Albion_Epic_Questline.md), [Midgard](Design/Midgard_Epic_Questline.md), and [Hibernia](Design/Hibernia_Epic_Questline.md)
