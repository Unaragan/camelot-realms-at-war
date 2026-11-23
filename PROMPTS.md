> **Archived prompt examples.** These prompts assume older tools and project structures. Use [AGENTS.md](AGENTS.md) and [Developer Setup](SETUP.md) for the current workflow.

# Prompt template

Reusable prompts – two categories: **Terminal Claude code** (MCP-connected to the Unreal Editor, for editor actions) and **Co-pilot** (Content generation like quest/dialog texts, no editor access required.) Not every small statement — just patterns that are used repeatedly so they don't have to be reinvented every time they're used.

## Terminal Claude Code (Unreal-MCP)

## Combat Character with GAS Abilities (Lyra Base)

Used for: First Knight Test Characters (POC, discarded), Rebuild after Lyra Switch (Task #6), Template for Task #7 (other classes).

> "We're building on the Lyra base." [Rollers]Test characters as blueprint subclasses of Lyra’s existing GAS/character classes (not a new C++ code) – where possible, use Lyra’s existing Ability System framework from scratch instead of own attribute sets. [X] Health. Two abilities: Attack 1 adds to the target [X] Damage to; Attack 2 adds [X] Damage and heal the attacker [X] Both use a modular, reusable GameplayEffect with set-by-caller magnitude instead of their own effects per ability. In addition: server-side angle check between target's viewing direction and attacker's position - if the attacker is within a 120° cone behind the target, only the damage portion is doubled (healing remains unchanged). [Rollers] so that they can attack each other, and test by PIE.

**Adaptable placeholders:** `[Rollen]` (e.g. Knight/Paladin/Berserker from CLASSES.md), `[X]` Health/Damage/Curing Values from SYSTEMS.md.

## Tod & Respawn (Lyra Base)

Used for: Task #6, Death/Respawn handling for the TestKnight characters. [SYSTEMS.md](SYSTEMS.md) → "2e. Tod & Respawn-Handling".

> "First, check if there's a problem." `BP_TestKnight` already one `ULyraHealthComponent` If not, supplement them. – Lyras `LyraHealthSet` Already solves a `OnOutOfHealth`-Delegates from, as soon as Health falls to 0, this takes over the complete death sequence (state tags, `GA_Hero_Death`-Ability for Ragdoll/Deactivation) automatically, no new code required. [X] Seconds of delay after death, respawn to the original position (not a team spawn system that comes with the Battleground map), full health, no leftover state tags/cooldowns. `BeginPlay` Test by PIE: make knights fight to the death in a duel, watch death sequence (Ragdoll/Deactivation) and Respawn after the timer expires.

**Adaptable placeholders:** `[X]` Respawn delay in seconds (suggestion: 5).

## Renaming TestKnight → Paladin (Task #6 Completion)

Used for: Finalize Task #6. [CLASSES.md](CLASSES.md) → "TestKnight → Paladin: renaming mapping".

> "Name the TestKnight prototype assets under" `/Game/Characters/TestKnights/` in accordance with the mapping table in CLASSES.md to the final paladin class: `BP_TestKnight` → `BP_Paladin`, `GA_TestKnight_MeleeBase` → `GA_Paladin_MeleeBase`, `GA_Attack1` → `GA_Paladin_Strike`, `GA_Attack2` → `GA_Paladin_LayOnHands`, `GE_Init_TestKnightHealth` → `GE_Init_PaladinHealth`Move the assets `/Game/Characters/Paladin/`Leave values (250 Health, 25/15 Damage) unchanged – pure renaming, no balance change. Add Albion as a team to both placed instances via Lyra’s existing team system (team color visible). After renaming, check all internal references (blueprint repair, asset references in BeginPlay/Grant Ability logic) and test the complete duel including death/respawn again via PIE to ensure that nothing is broken by the renaming.

## Setting Startup Map (instead of Lyra’s standard frontend) — historical, solved since ShooterCore deactivation

**Status (2026-07-22): done.** Since the ShooterCore plugin family has been completely deactivated (see SETUP.md) and `/Game/Maps/L_PaladinTest` exists as its own test level, show `GameDefaultMap`/`EditorStartupMap` in `Config/DefaultEngine.ini` This prompt remains only as a reference for the symptom/solution at that time.

Used for (historical): Play launched Lyra’s own frontend/default game by default instead of our test card.

> "The editor is opening Lyra's default showcase hub level (L_DefaultEditorOverview) on startup instead of our test level. Fix both settings: (1) Project Settings → Maps & Modes → set 'Editor Startup Map' and 'Game Default Map' to `/ShooterTests/Maps/L_ShooterTest_Basic`. (2) Editor Preferences → General → Loading & Saving → 'Load Level at Startup' → set to 'Editor Startup Map' (not 'Last Opened Level' or similar) so it actually respects setting (1). Confirm by fully closing and reopening the editor — it should open directly into `L_ShooterTest_Basic` with both Paladin instances, not the Lyra showcase hub."

**Note:** `[Levelpfad]` Adjust if necessary if a different test level than `L_ShooterTest_Basic` is currently in use (see SYSTEMS.md → Reference Implementation). *and* Editor Preferences are needed — Insight from 2026-07-22: Project Settings alone was not enough, Lyra’s own “Default Editor Overview” hub map opened anyway, with a faded hint in the level itself to exactly these two digits.

## Albion Team + Assign Color (Task #6 Completion)

Used for: last open point from the TestKnight→Paladin renaming. `RealmTeamStatics` (C++ wrapper) `ULyraTeamSubsystem::ChangeTeamForActor`is compiled, see [SYSTEMS.md](SYSTEMS.md) → Section 2d.

> "Wire the Albion team assignment in" `BP_Paladin`s `BeginPlay`: after one `Switch Has Authority`-Node exclusively in the authority branch `AssignTeam(Actor=Self, TeamId=0)` Excl. `RealmTeamStatics` Call – mandatory, since `ChangeTeamForActor` no authority checks, otherwise clients would also `SetGenericTeamId` Call locally, then add a simple visible material coloring for Team 0/Albion (Carmine red according to README fraction colors) — by dynamic material instance, triggered either via `OnTeamIndexChangedDelegate` or immediately following the `AssignTeam`Call. Test by PIE: Team membership is visible (color or print output) and confirm that the call is only on the server side.

## Build lighting (black game viewport)

> "Build the lighting for the current level" ([Level name])."

Necessary after each new/changed level, if Lumen is disabled (see CLAUDE.md) and the Play-Viewport remains black.

## Copilot (content generation)

For text/dialog content that Copilot generates directly in the editor or chat – see [README.md](README.md) → "Tool split: Copilot vs. Claude". Claude Code does not have direct access to Copilot (no MCP, IDE typing is blocked anyway) - these prompts must be inserted manually.

**Important:** This file contains only the **Request templates** (Prompts), not the generated results. Finished quest content plus implementation status in the game lives in [Docs/Design/Quests.md](Docs/Design/Quests.md) – there is also the master index of all Quest IDs (AEQ, FNQ).

### Beispiel-Questline Albion: Lord Ector → Burgvogt Kay (AEQ-01 bis AEQ-03, 2026-07-21)

3-piece chain, sample content matching the quest hooks [NPC_NAMES.md](NPC_NAMES.md) → "Basic Conflict Proposal". Escalation Diplomacy (Ector) → Mobilization (Kay), ends with transition to border/battleground. Edition deliberately requested in English (FText source language according to CLAUDE.md). [Quests.md](Docs/Design/Quests.md) AEQ-01/02/03.

**Quest 1 – Missing Border Explorers:**

> "You are writing content for 'Camelot: Realms at War', a toon-styled 3-faction RvR fantasy game (spiritual successor to Dark Age of Camelot, but with no DAOC-specific names/lore reused — only generic medieval-English/Arthurian-inspired flavor).
>
> Quest premise: several border scouts near the frontier with the rival realms have gone missing; Ector asks the player to investigate.
>
> Please generate, in English (the game's source language for localization):
> - Quest title
> - 2-3 sentence quest description (as shown in a quest log)
> - 3 short objective steps
> - Opening dialogue from Ector when offering the quest (3-4 lines)
> - Closing dialogue from Ector when the player returns with partial findings (3-4 lines), ending on a note of ambiguous unease rather than resolution — this quest is not the outcome, it's the entry point to a longer 3-part questline.
>
> Keep the tone grounded/medieval, not high-fantasy melodrama. No mention of Dark Age of Camelot or DAOC-specific proper nouns."

**Quest 2 – Evidence of Targeted Assault:**

> "Continuing the same questline for 'Camelot: Realms at War' (Albion faction, Lord Ector as quest giver, toon-styled 3-faction RvR fantasy game, generic medieval-English/Arthurian flavor, no DAOC-specific names).
>
> Quest premise: while searching, the player found physical evidence suggesting the scouts' disappearance was not an accident but a deliberate incursion by a rival realm (generic signs — a broken banner, foreign tracks, a discarded weapon of foreign make; keep the responsible realm a to-be-revealed mystery for now, don't lock in Midgard or Hibernia specifics yet). The player must bring this evidence back to Lord Ector, who grows concerned and decides the matter needs his military commander's attention.
>
> Please generate, in English:
> - Quest title
> - 2-3 sentence quest description
> - 3 short objective steps (e.g., gather/confirm evidence, return to Ector, be sent onward)
> - Dialogue from Ector reacting to the evidence (4-5 lines, shift from calm to genuine concern)
> - A short closing line where Ector says he's sending the player to his military commander, 'Burgvogt Kay', to decide next steps — this is the handoff into quest 3."

**Quest 3 – Mobilization / Border Patrol:**

> "Continuing the same questline for 'Camelot: Realms at War' (Albion faction, toon-styled 3-faction RvR fantasy game, generic medieval-English/Arthurian flavor, no DAOC-specific names). Write the THIRD and final quest of the 3-part chain. The quest giver is now 'Burgvogt Kay', Albion's military commander — more impatient and action-oriented than Lord Ector, eager to respond decisively.
>
> Quest premise: with Ector's evidence in hand, Kay is done waiting — he wants to test the player's combat readiness and then send them out on Albion's first real patrol to the frontier, directly leading into the game's frontier/battleground content.
>
> Please generate, in English:
> - Quest title
> - 2-3 sentence quest description
> - 3 short objective steps (e.g., defeat a few training opponents to prove readiness, then join a border patrol)
> - Dialogue from Kay offering the quest (blunt, impatient, 3-4 lines)
> - A closing line from Kay right before the player heads to the frontier/battleground, giving the moment a sense of stakes rising — this line should work as a narrative bridge into actual RvR combat content."

## Status

🟡 Recently expanded 2026-07-21 (copilot category added) – will be supplemented with additional reusable patterns (e.g. battleground greyboxing, vegetation placement) if necessary, not retroactively for each individual statement.
