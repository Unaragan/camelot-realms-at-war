# Frontier NPCs & Questline backlog (design template)

> **Classification:** how [OpenWorld_Frontier_3Realms_Vision.md](OpenWorld_Frontier_3Realms_Vision.md), to which this document belongs — Advance planning for the later open-world frontier/start area phase, **None** Replacement or anticipation of the current Battleground vertical slice Purpose: Content backlog that can be executed independently of the editor (e.g. during build/compile waiting times) — prepare co-pilot prompts and collect results here, see [PROMPTS.md](../../PROMPTS.md) for the established pattern.

## Types of conquest points (base: BG reference images)

From the four moodboards in [References/](References/) and the typing in the vision file (section "Layout refinement v2"):

| Type | Evidence in the image material | Regional bonus on conquest |
|---|---|---|
| **Watchtower** | "Guard Tower"/"Watch Tower"-Beschriftungen (Albion/Midgard) im ersten Moodboard | Line of sight/rally point |
| **Village/supply camp** | "Supply Village" (Albion), "Forge Camp" (Hibernia) im ersten Moodboard | Supply/Resupply |
| **Mine** | Point type taken from the vision file, not yet labeled separately in the image material | Resources |
| **Shrine/skin** | wooded hill with fireplaces near Hibernia in the first Moodboard, fits "Dolmen/mystical forests" imperial identity | Buffalo |
| **Siege camps (neutral, bannerless)** | in Lvl-30 and Lvl-50 image continuously an additional, **Unlabelled** Camps without faction banner next to the three imperial camps | See Section 3 — not a regional realm bonus, but a central castle effect |

The three level-staged maps (Lvl 20/30/50) show the same basic structure in growing complexity — Lvl 20 only the three imperial camps + a simple central target, Lvl 30 additionally the neutral camp, Lvl 50 several smaller intermediate camps distributed along the approach routes. For NPC requirements, the consideration of the point types themselves is sufficient, regardless of how many copies exist per map.

## NPCs per point type

Two specific points per realm (corresponding to the respective biome/character identity from the vision file), plus the one neutral siege camp point. **Generic** Pools in [NPC_NAMES.md](../../NPC_NAMES.md) — Conscious *not* from the mythology pool reserved for the realm leadership (Ector/Kay, Skadi/Vidar, Aengus/Aoife remain untouched).

### Albion (knight castles, open fields, fog)

| Point | Title + Name | Characteristic |
|---|---|---|
| Watchtower | Captain Baldwin | Stoisch, diszipliniert, meldet jede Bewegung im Nebel pflichtbewusst weiter |
| Village/supply camp | President Eleanor | Pragmatic Quartermaster, keeps the supply line to the border running |

### Midgard (fjords, snow, rock cliffs)

| Point | Title + Name | Characteristic |
|---|---|---|
| Watchtower | Captain Gunnar | Directly, honorably, sees the guard service itself as a test of test. |
| Mine | Mine supervisor Ulf | Rough, suspicious, jealous of the ore that finances the war |

### Hibernia (Oak, Dolmen, Mystical Forests)

| Point | Title + Name | Characteristic |
|---|---|---|
| Shrine/skin | Shrinekeeper Niav | Mystical, speaking in natural metaphors, guards the same ward stones that Rí Aengus cares about (see NPC_NAMES.md) |
| Village/forging camp | Commander Cormac | Down-to-earth blacksmith, equips Hibernias skirmisher with what the border forest gives |

### Neutral

| Point | Title + Name | Characteristic |
|---|---|---|
| Siege camps (bannerless) | *The nameless camp captain* | Deliberately unnamed/anonymous — suitable for the bannerless camp in the footage. Mercenary leader without recognizable loyalty to the Reich, helps (or harms) who benefits |

## Central Castle Weakening vs. Regional Bonuses (Mechanical Assignment)

Two separate mechanics tracks to concretely anchor the open question from the vision file ("Neutral Additional Points"):

- **Regional points (watchtower/village/mine/shrine):** Conquest gives the conquering empire a local advantage on the way to the central castle (line of sight, supply, resources, buff — see table above).
- **Neutral Siege Camp:** only point with effect on the central castle itself — exactly the double effect left open in the vision file:
  - **Weakening:** Reduced wall/goal HP, shorter kennel defense time, deactivated trap/gun — useful when an empire actively storms the castle.
  - **Strengthening the Defeated Empire:** hirable NPC mercenaries at the camp itself – useful for unequal numbers of players.
  - **Proposal to resolve the open question:** Both effects are simultaneously linked to the same act of conquest, not selectable — the conquering empire automatically weakens the castle AND can hire mercenaries at the same point. Avoid an additional decision-making UI, a single act of conquest has two immediately noticeable consequences.

## Quest backlog (for waiting times)

### Reusable co-pilot prompt template

> "You are writing content for 'Camelot: Realms at War', a toon-styled 3-faction RvR fantasy game (spiritual successor to Dark Age of Camelot, but with no DAOC-specific names/lore reused). [Kingdom] faction, given by [Title + Name] ([Character description]) stationed at a [Point type] near the frontier. quest premise: [Short premises]. Please generate, in English: quest title, a 2-3 sentence quest description, 3 short objective steps, 3-4 lines of opening dialogue, 3-4 lines of closing dialogue. Tone: [Clay note]. No mention of Dark Age of Camelot or DAOC-specific proper nouns."

**Place-holders:** `[Reich]`, `[Titel + Name]`, `[Charakterbeschreibung]` and `[Ton-Hinweis]` from Section 2, `[Punkt-Typ]` from Section 1, `[Kurzprämisse]` from the backlog table below.

### Backlog

**Note:** finished content and implementation status in the game will be centrally [Quests.md](Quests.md) tracked (master index, frontier point NPCs table), not here. This table remains the premise source.

| ID ID | NPCs | Point | Short premises | Status |
|---|---|---|---|---|
| FNQ-01 | Captain Baldwin | Albion, Watchtower | The tower’s signal fire is extinguished – players should clarify the cause and ignite it again | Open |
| FNQ-02 | President Eleanor | Albion, village | Supply vans to the border are raided – Player to secure route / track down perpetrators | Open |
| FNQ-03 | Captain Gunnar | Midgard, Watchtower | Gunnar asks for proof of probation before admitting the player to the guard (echo of Jarl Skadi’s test ethos) | Open |
| FNQ-04 | Mine supervisor Ulf | Midgard Mine | Ore Deliveries Disappear on the Way to the Forges — Suspicion of Sabotage/Theft | Open |
| FNQ-05 | Shrinekeeper Niav | Hibernia, shrine | The Ward Stones on the Grove Fade — Direct Continuation of Rí Aengus' Care from NPC_NAMES.md | **Promptly formulated, see below** |
| FNQ-06 | Commander Cormac | Hibernia, village/forge | Needs rare materials from the contested border area to continue forging weapons | Open |
| FNQ-07 | The nameless camp captain | Neutral, Siege Camps | Offer help against payment without revealing loyalty – Player experiences the Zentralburg consequence (section 3) only as a result, not as an announcement of the character himself | Open |

### Formulated example: FNQ-05, shrinekeeper Niav

> "You are writing content for 'Camelot: Realms at War', a toon-styled 3-faction RvR fantasy game (spiritual successor to Dark Age of Camelot, but with no DAOC-specific names/lore reused). Write ONE self-contained quest for the Hibernia faction, given by 'Shrine-Keeper Niav' (mystical, speaks in nature metaphors, tends an ancient warding-stone shrine in a grove near the frontier). Quest premise: the warding stones around the shrine have begun to dim, and Niav fears the same weakening that troubles Hibernia's ruler is spreading here too — she asks the player to investigate the cause near the frontier's edge."
>
> Please generate, in English: quest title, a 2-3 sentence quest description, 3 short objective steps, 3-4 lines of opening dialogue, 3-4 lines of closing dialogue. Tone: mystical, reverent toward nature, quietly worried rather than alarmed. No mention of Dark Age of Camelot or DAOC-specific proper nouns."

## Status

🟡 Newly created (2026-07-21) — Point types/NPCs/mechanics assignment are design proposal, backlog entries #1–4/#6/#7 are not yet generated by Copilot. Relevant only from open-world frontier/start area phase, does not change the current Battleground focus.
