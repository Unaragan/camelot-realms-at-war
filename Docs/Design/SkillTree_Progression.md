# Skill Tree & Talent Progression System

> **Status:** Early design, not implementation. structure for how players upgrade/specialize skills.

## Core idea

**"Lean Talent System"** — not WoW-like with 100 options, but **2-3 specialization paths per class** (Defense vs. Offense, or Heal-AoE vs. Heal-Single), which make the player clearly distinguishable.

See CLASSES.md: each class has **Two Talent Paths** (defensive/support vs. offensive).

## Progression mechanics

### 1. **Skill points (long-term progression)**

**Leveling phase (Lv 1-50):**
- Players get **1 skill point per level** (Level 1 → 50 = 50 points)
- Investing Points in **Two talent trees** Class
- Maximum **25 points per tree** (balanced)

**Endgame phase (Lv 50+):**
- **Skill progression continues** (1 point per ~30-60 minutes of play)
- **Skill caps with title rewards:**
  - **Common:** 0-100 Skill (simple items craften, casual combat)
  - **Uncommon:** 100-250 skill (standard crafting, normal dungeons)
  - **Rare:** 250-500 Skill (Better Items, More Dungeons)
  - **Epic:** 500-1000 Skill (Epic-Items craften OR Boss-Loot)
  - **Legendary:** 1000-1050 Skill (End-Game Goal, Epic-Crafting only!)

**IMPORTANT: Legendary (1000+) accessible only through EPIC-CRAFTING:**
- ❌ Sub-components alone = max up to ~900 Skill
- Common/Uncommon/Rare Crafting = max up to ~800 Skill
- ✅ **Only those who craft epic items can reach Legendary**
  - Alchemist: Epic potions with rare ingredients
  - Gunsmith: Epic Weapons (Adamantite, Rune-touched)
  - Armormaker: Epic Armor (Adamantite)
  - etc.

**Legendary Reward at 1050 Skill:**
- ✅ Titel (e.g. "Paladin of the Light", "Master Berserker", "Legendary Weaponsmith")
- ✅ Visual Cosmetic (item glow, aura, special particle effect)
- ✅ Small stat boost (+2-3% final stats)
- Rare crafting bonus: Epic items get +5% extra quality
- Later: **Neuspec/Respeck possible** (cost option)

### 2. **Two talent paths per class**

Each class has: **Exactly two tabs**, no more:

| Category | Path A (defensive) | Path B (offensive) |
|---|---|---|
| **paladine** | Holy Defense (tank buffs, shields) | Crusade (Damage Buffs, Aggro-Debuff) |
| **Cleric** | Divine Heal (AoE Heal, Buffs) | Smite (Heal + Damage Hybrid) |
| **Wizard** | Arcane Control (Crowd Control, Defense) | Burst Damage (AoE) |
| **Berserkers** | Battle Fury (Damage + Self-Buff) | Unbreakable (tank-like defense) |
| **Shaman** | Restore (AoE Heal, Group Support) | Curse (Debuffs, Offensive Buffs) |
| **Hunters** | Precision (Single-Target Damage) | Swiftness (mobility, kiting) |
| (etc.) | (etc.) | (etc.) |

## Talent tree layout (conceptual)

**Non linear:** Not necessarily "tree" but rather **3x5 or 3x7 grid** with dependencies (animal-based).

```
Tier 1 (Lv 1-5):      [Talent A]  [Talent B]  [Talent C]
                      |          |          |
Tier 2 (Lv 6-15):     [T.D]  [T.E]--[T.F]  [T.G]
                           |       |
Tier 3 (Lv 16-25):    [T.H]  [T.I]  [T.J]  [T.K]--[T.L]
```

- **Category 1:** Basic Talents (3 options, select 2 = 2 points required)
- **Tier 2:** Specialization Talents (depending on Tier 1 Choice)
- **Tier 3:** Capstone (End-Talents, Final Ability per Path)

## Types of talent

### A. **Passive talents** (Stat boosts)
- +5% Health
- +10% Damage
- +3 Armor
- +Mana Regeneration
- *Cost: 1 point*

### B. **Ability enhancement talents** (capability modification)
- "Holy Strike deals +20% damage to undead"
- "Heal over Time: extends duration by 2 seconds"
- "Crowd Control: stun chance +25%"
- *Cost: 1-2 points*

### C. **Capstone Talents** (unequivocal Abilities)
- "Paladin's Holy Light: instant heal, 30 sec cooldown"
- "Wizard's Inferno: AoE damage burst, high mana cost"
- *Cost: 2-3 points* (are the "great" abilities)

## Vertical Slice Scope (Simple Keep)

For the first implementation:
- **3 Classes** (Paladin, Berserker, Champion)
- **Each has 2 talent paths**
- **Per Path ~10-15 Talents** (no 100 trees)
- **Per-level: 1 point**
- **UI:** A simple Tree View widget (click = point invest)

## Later: Specialization Items

(Post-release idea, not for POC)
- **Rune Stones** or **Talent Runes:** Items that give additional talent modifiers (e.g. +1 point in special talent)
- **Class-specific runes:** e.g. "Paladin's Rune of Holy Wrath" adds bonus effect to Holy Strike
- Doing a little more complexity without changing the tree

## Open points

- **Respeck costs:** Gold? Special item? Free in Towns? (later balance)
- **Animal lockout:** Do you have to play Tier 1 fully before Tier 2 unlocks? (probably yes for simplicity)
- **Pvp balance:** Should the talent tree between PvE and PvP be different? (no, easier for POC)
- **Macro Support:** Should there be save builds ("Talent Preset 1/2")? (later if time)

## UI for Talent Assignment

```
[Character Screen] → Tab: Skills/Talents

┌─────────────────────────────────────────┐
│  Talent Points Available: 5              │
├────────────────────┬────────────────────┤
│  PATH A            │  PATH B             │
│  "Defense"         │  "Offense"         │
│  Points Spent: 12  │  Points Spent: 8   │
│                    │                    │
│  [+] [Talent A1]   │  [+] [Talent B1]   │
│  [+] [Talent A2]   │  [+] [Talent B2]   │
│      [Talent A3]   │      [Talent B3]   │
│      ...           │      ...           │
│                    │                    │
│  [Reset Talents]   │ [Close]            │
└────────────────────┴────────────────────┘
```

