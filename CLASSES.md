# Class concept (design reference)

First design reference for the class roster, based on DAOC’s proven three-role structure per faction (tank/near combat, healer/support, distance combat/magic) – not on the concrete, partly very idiosyncratic DAOC class name.

## Legal framework (short, no legal advice)

Game mechanics and class**Archetypes** (tank, healer, range fighter) are not protective — this is pure gameplay concept, just like any other RPG. **Names** a distinction is made between:

- **Generic fantasy/mythology terms** (Wizard, Cleric, Druid, Ranger, Paladin, Champion, Shaman, Berserker, Hunter, Rogue, Bard, Minstrel, Skald, Raider, Duelist) are used in dozens of games or are real historical/mythological terms (Skald = historical Nordic warrior poet, Bard = historical-mythological Celtic), not exclusively associated with DAOC and therefore harmless.
- **Unusual, recognizable for DAOC invented names / spellings** (e.g. "Vampiir", "Bainshee", "Animist", "Valewalker", "Mauler", "Runemaster", "Bonedancer", "Spiritmaster") become aware here **not** As with the project name itself, we deliberately keep our distance from everything that is too clearly recognizable.

The Realm names (Albion, Midgard, Hibernia) are like "Camelot" in the public domain historical/mythological terms (Albion = ancient name for Britain, Midgard = Norse mythology, Hibernia = Latin name for Ireland) and harmless.

## Roster: Vertical Slice vs. Final Version

**Vertical Slice (now):** three archetypes per faction, corresponding to the non-now limit ("max. 3 classes per faction"). Order of construction follows the roadmap (Task #6: first class, Task #7: second fraction/class).

**Final version (target image, not build now):** five classes per faction — the three existing plus two other archetypes (near-fighting burst/stealth, support/buffs) that serve the role of back attack mechanics (SYSTEMS.md) and group control.

### Albion (arthurian, versatile, heavy armor)

| Category | Archetype | Short description | Phase phase |
|---|---|---|---|
| paladine | Tank/Support Hybrid | Heavy armor, buffs for the group, solid melee defense | Vertical Slice |
| Cleric | Healers | Classic group healer, defensive support | Vertical Slice |
| Wizard | Distance wizards | High individual damage from a distance, low self-defense | Vertical Slice |
| Rogue | Close combat burst/stealth | High single target burst, mobility, benefits greatly from back attack | Final version |
| Minstrel | Support/Buffs | Group buffs, debuffs/control, medieval English musician tradition | Final version |

### Midgard (Nordic)

| Category | Archetype | Short description | Phase phase |
|---|---|---|---|
| Berserkers | Close combat DPS/tank | Aggressive front-line fighter, high damage at risk | Vertical Slice |
| Shaman | Healer/Support | Group healing with Nordic buffs/debuffs | Vertical Slice |
| Hunters | Distance combat | Distance combat, mobility, single target focus | Vertical Slice |
| Raiders | Close combat burst/mobility | Viking Quick Attacker, Benefits from Back Attack | Final version |
| Skald | Support/Buffs | Historic Norse warrior poet, group buffs/control | Final version |

### Hibernia (Celtic)

| Category | Archetype | Short description | Phase phase |
|---|---|---|---|
| Champion | Close combat tank | Robust frontline fighter, Celtic-influenced skills | Vertical Slice |
| Druid | Healers | Nature-based healing/support, surface effect | Vertical Slice |
| Rangers | Distance combat/stealth-nah | Distance combat with mobility and camouflage elements | Vertical Slice |
| Duelists | Close combat burst/mobility | Fast lone fighter, benefits from the back attack | Final version |
| Bard | Support/Buffs | Historical-mythological Celtic term, group buffs/control | Final version |

## Specialization path (talent choice per archetype)

Each archetype gets two talent paths – one defensive/support-oriented, one offensive/damage-oriented. Matches the “slim talent choice points” principle from SYSTEMS.md (2-3 options, no deep branch).

| Archetype | Spec A (defensive/support) | Spec B (offensive) |
|---|---|---|
| Tank (Paladin/Berserker/Champion) | Def tank: high defense, aggro binding, group protection | 2H damage: offensive, high individual damage, less defense |
| Healer (Cleric/Shaman/Druid) | Group healing: AoE-Heal, Buffs | Single healing + damage: strong single target healing, offensive hybrid capabilities |
| Caster (Wizard) | Area damage: multiple targets at the same time, weaker per target | Single target burst: high damage to a target |
| Long range fighter (Hunter/Ranger) | Control: shackling/slowing, group control | Precision: high individual damage, mobility |
| Close combat burst (Rogue/Raider/Duelist, final version) | Stealth/Preparation: out of camouflage, reliable back attack | Open blade: higher basic speed, less reliant on back attack |
| Support (Minstrel/Skald/Bard, final version) | Group Buffs: Stat-Boosts, Endurance/Resource Support | Control: Debuffs, crowd control, weaken opponents |

Technically: one choice point per archetype/level in the talent table from SYSTEMS.md, no deeper branch than these two options.

## For the Vertical Slice (Phase 2)

- **Task #6:** one class for fraction 1 – **decided: Paladin** (the previous one) `BP_TestKnight`-Prototype already fits content: high health pool, attack + self-healing attack = tank/support hybrid, see below "TestKnight → Paladin"
- **Task #7:** first class for fraction 2 (suggestion: berserker — maximum different fighting feeling to the first class, tests the asymmetry most clearly)
- Fraction 3 (Hibernia) and other classes per faction come after the not-now list only when the two-faction fight already feels good

### TestKnight → Paladin: renaming mapping (task #6 completion)

Pure renaming/reflavoring of the existing verified assets (see SYSTEMS.md → "Reference Implementation v2") – no new mechanics, no change in value. Values (250 HP, 25/15 damage) remain unchanged for the time being; true stat differentiation between classes only follows with Task #13 (DataTable scheme) or as soon as Task #7 (Berserker) provides noticeable contrast.

| Old | New | Note: |
|---|---|---|
| `BP_TestKnight` | `BP_Paladin` | Actor blueprint |
| `GA_TestKnight_MeleeBase` | `GA_Paladin_MeleeBase` | Basic Ability (damage/healing functions, back check) |
| `GA_Attack1` (25 Damage) | `GA_Paladin_Strike` | Base attack |
| `GA_Attack2` (15 Damage + 15 Self-Healing) | `GA_Paladin_LayOnHands` | Matches the content well with the tank/support hybrid – self-healing attack is a generic paladin trope, not a DAOC-specific name |
| `GE_Init_TestKnightHealth` | `GE_Init_PaladinHealth` | Health initialization |
| `/Game/Characters/TestKnights/` | `/Game/Characters/Paladin/` | Folder Structure – Model for future class folders (Task #7): `/Game/Characters/Berserker/`) |

In addition: Assign Albion team/color via Lyra’s existing team system – useful now because Task #7 needs two distinguishable teams anyway.

## Status

🟡 Design reference, no implementation yet. Fine-tuning (concrete capabilities, values, cooldowns) follows when implementing Task #6/#7. 5-class target image per faction (2026-07-21) is pure pre-allocation for the final version, does not change the current non-now boundary.
