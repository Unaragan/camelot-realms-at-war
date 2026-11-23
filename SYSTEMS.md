# Gameplay systems: Pre-planning (Skills, Passive Values, GUI)

Design reference so that skills, character values and HUD are data-driven from the start – new class/ability later is called "new DataTable line", not "new code".

## Basic principle

Everything that differs between classes/skills is in DataTables – not in Blueprint branches or C++ special cases per class. Creating a new ability should mean filling in a new row in the Ability table, not programming a new class.

## Passive Values (GAS Attribute Set)

**For the Vertical Slice, a slim set is enough:**

| Attribute | Purpose |
|---|---|
| Health | Life Points |
| Resources | Generic resource type (mana/endurance/etc. – later reflavored per class, technically the same attribute type) |
| Damage | Base damage value |
| Armor | Basic armor/damage reduction |

Consciously **not** Now: critical hit chance, Dodge, Elemental Resistances, Itemization Bonuses – this is part of the "Not Now: Deep Itemization" from the README. GAS attribute sets, however, can be extended by nature, which can be retrofitted later without remodeling.

**Starting values per class** as its own DataTable (`FCharacterClassData`). Columns for fraction, basic health, basic resource, basic damage, basic armor. Conscious asymmetry between the classes from CLASSES.md (e.g. Berserker high health/damage, wizard low health/high resource pool).

## Skills (Skills)

**DataTable scheme proposal** (one row = one ability):

| Column | Type | Purpose |
|---|---|---|
| AbilityID | Name | Unique key |
| DisplayName | FText | Display name (localized, see localization rule) |
| Description | FText | Tooltip text (localized) |
| icon | Soft object reference | UI-icon |
| Cooldown | Float | Seconds |
| ResourceCost | Float | Costs in resource attribute |
| Casttime | Float | 0 = instant |
| GameplayEffectClass | Class reference | Which modular effect is triggered (see below) |
| Gameplay Tags | Gameplay tag containers | Categorization (see taxonomy below) |
| AnimationMontage | Soft object reference | Playback animation |

**Modular GameplayEffects instead of single assets per ability:** A generic `GE_InstantDamage` With set-by-caller magnitude (number is passed by the ability at runtime) covers many damage abilities instead of creating its own gameplay effect for each ability. `GE_InstantHeal`, `GE_ApplyBuff`, `GE_ApplyDebuff` Keeps the number of assets small as the class roster grows.

**Gameplay Tag Taxonomy (Starting Suggestion):**

```
Ability.Damage.Melee
Ability.Damage.Ranged
Ability.Heal.Single
Ability.Heal.Group
Ability.Buff
Ability.Debuff.CC
Class.Albion.Paladin
Class.Midgard.Berserker
State.Stunned
State.Silenced
```

Drive tags in GAS activation locks, cool-down tracking and CC states – using a consistent hierarchy from the start (rather than ad-hoc tags per ability) saves a lot of cleanup work later.

## Capacity Scope & Progression (DAOC/MMO Experience Value)

- **Hard slot border:** 2 active hotbars of 10 fields = a maximum of 20 active abilities available at the same time. This deliberately limits how many abilities per class make sense at all - rather few, well-balanced abilities than a growing flood of abilities.
- **Progression Prefers Scaling of Existing Skills** with level increase (damage/cooldown/range improve) instead of constantly unlocking new abilities. technical: GAS modifier magnitude via a curve table, scaled with character level – no separate DataTable line per level level.
- **Skill tree/talents:** limited selection points (player chooses between few specialization options at certain levels), no sprawling talent tree. Own slim talent table: one line per choice point with 2-3 options, no deep branch.
- **Crafting UI:** separately and later (see not-now list: Crafting) - either own bar or directly from the recipe list.

## 2 c. Position-dependent damage (back attack)

Attacks from behind cause double damage – as a reusable mechanic, not just for individual abilities. Technically: Angle check between the target’s gaze direction and the attacker’s position at the activation time (e.g. attacker within a ~120° cone behind the target = back attack). **Evaluation on the server side**, not client-side - otherwise easily manipulated. Only the damage portion doubles, not healing portions in hybrid capabilities.

## Death and Respawn-Handling

**Principle:** no new own code where avoidable — reuse existing engine/framework building blocks instead of building them (see CLAUDE.md, "Blueprint-first").

**To be clarified for the third-person template structure:** the template does not bring a finished death/respawn system (unlike Lyra). AttributeSet `OnOutOfHealth`Delegate, Death Ability and Respawn Timing/Spawn Point logic must be created manually on the basis of the self-built GAS framework (see README "Architectural Change"). [Archive.md](Archive.md) — as a reference, which pitfalls (e.g. target finding at respawn), `RespawnDelaySeconds`-Instance-Default-Trap) can recur generically.

**Consciously not now:** Faction spawn points, respawn waves/timer UI, death statistics/killfeed – this is Battleground Scope (task #8), this is only about working death/respawn on the current test character.

## Reference implementations (Lyra era, archived)

The earlier combat system prototypes (knight prototype before Lyra, `BP_TestKnight` Lyra-based, `BP_Paladin` as a lyra experience including the animation diagnosis that led to the change of architecture [Archive.md](Archive.md) outsourced — no longer directly applicable as Lyra-specific, but useful as a reference for generic GAS teachings (set-by-caller pattern, back attack angle check, timing pitfalls at BeginPlay vs. Possession).

## Quests (Data Scheme Proposal)

Similar to the skill scheme in Section 2: Create a quest to be called "new DataTable line," not new code.**Content** (texts, story, implementation status) lives in [Docs/Design/Quests.md](Docs/Design/Quests.md) – here only the technical scheme, according to which he is later entered into the game.

**DataTable scheme proposal** (one line = one quest):

| Column | Type | Purpose |
|---|---|---|
| QuestID | Name | Unique key (e.g. `AEQ-01`, see Quests.md Convention |
| DisplayName | FText | Quest title (localized) |
| Description | FText | Questlog description (localized) |
| GiverNPC | Object reference | Which NPC blueprint awards the quest |
| Objectives | Array<FText\> | Goal steps (localized) |
| PrerequisiteQuestID | Name | Chain prerequisite, empty = none |
| RequirementsGroup | bool | Solo vs. Group Duty (see Albion Epic Questline Levels with Group Duty) |
| Minlevel | int | Level recommendation |
| Reward ID | Object reference | Placeholder reference until a real Itemization system exists (not-now list) |
| DialogueOpening / DialogueClosing | FText | dialog lines (localized) |

**Consciously not yet decided:** Whether dialog lines are located directly in the Quest DataTable or in a separate dialogue table (more meaningful for multi-line dialogs with branches) – relevant only when the first quests from Quests.md are actually implemented.

**Status:** pure schema, no implementation yet – no quest system (DataTable, Dialog UI, Objective-Tracking) exists in the project so far. This is even the most important open point before individual quests from Quests.md can migrate into the game.

## 4. GUI (HUD)

**Architectural principle:** UMG widgets bind to GAS attribute delegates`OnAttributeChanged`), instead of querying the value of each tick – more performant and fits the performance principle from the README. MVVM patterns (Model-View-ViewModel, natively supported in UE5 via UMG Viewmodels) decouples UI widgets from the gameplay logic – important so that later the art-style change (placeholder → final art) does not have to rebuild the UI.

**Minimum HUD elements for the Vertical Slice** (Battleground, Task #8):
- Health/resource bars (own character)
- Ability bar: 2 hotbars of 10 fields, cooldown display reads icon/cooldown directly from the Ability DataTable (no hard-coded UI per ability)
- Target indicator (Health of the targeted opponent)
- Faction/team indicator
- RvR target status (flag point progress)

Consciously **not** Now: Inventory UI, Character Arc, Crafting UI – follow the non-now list.

## Status

🟡 Design reference, not yet implemented. Concrete when implementing Task #6 (first ability) and #9 (toon-artstyle/UI-look).
