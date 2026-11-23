# Item Level Requirements & Usage Penalties

> **Status:** Design concept. Level-based item usage with Malus system.

## Core idea

**Players can wear items under their level requirement**but with **Stat-Malus**:
- ✅ Lv5 carries Lv20 sword (possible but weak)
- ❌ Lv50 carries Lv1 sword (possible, but senseless)

---

## Item Level Requirements by Rarity

| Rarity | Typical Min Level | Example |
|---|---|---|
| **Common Commons** | Level 1+ | Linen Tunic (Lv1) |
| **Uncommon** | Level 10+ | Steel Sword (Lv10) |
| **Rare** | Level 25+ | Mithril Plate (Lv25) |
| **Epic** | Level 40+ | Adamantite Axe (Lv40) |
| **Legendary** | Level 48-50 | Eternal Greatsword (Lv48) |

---

## Malus formula (if under level requirement)

```
Level-Difference = Item-Level - Character-Level
If Level-Difference > 0:
  Malus % = Level-Difference × 5%
  Final Stats = Item-Stats × (1 - Malus%)
Else:
  Keine Malus (über Requirement)
```

**Examples:**

```
Scenario 1: Lv10 trägt Lv20 Schwert (10 Levels zu niedrig)
  Level-Difference = 20 - 10 = 10
  Malus = 10 × 5% = 50%
  Schwert Stats: 100 Damage
  Final Damage: 100 × (1 - 0.50) = 50 Damage (nur 50%!)
  ⚠️ Sehr schwach!

Scenario 2: Lv15 trägt Lv20 Schwert (5 Levels zu niedrig)
  Level-Difference = 20 - 15 = 5
  Malus = 5 × 5% = 25%
  Schwert Stats: 100 Damage
  Final Damage: 100 × (1 - 0.25) = 75 Damage (75% Effektivität)
  ⚠️ Acceptable as an interim measure

Scenario 3: Lv20 trägt Lv20 Schwert (genau Requirement)
  Level-Difference = 0
  Malus = 0%
  Final Damage: 100 Damage (100% Effektivität)
  ✅ Perfekt!

Scenario 4: Lv25 trägt Lv20 Schwert (5 Levels über Requirement)
  Level-Difference = 20 - 25 = -5 (negativ)
  Malus = 0% (Bonus ab Lv25+? Optional)
  Final Damage: 100 Damage (100% Effektivität)
  ✅ Volle Power!
```

---

## Alternative: Bonused Stats at Overlevels (Optional)

**If Players ABOVE Level Requirement:**

```
Bonus % = (Character-Level - Item-Level) × 2%
Final Stats = Item-Stats × (1 + Bonus%)

Beispiel:
  Lv30 trägt Lv20 Schwert (10 Levels über Requirement)
  Bonus = 10 × 2% = 20%
  Schwert Stats: 100 Damage
  Final Damage: 100 × (1 + 0.20) = 120 Damage (20% Bonus!)
```

---

## Armor & Other Items

**Same formula for all items:**
- Armor: Armor Value with Malus
- Accessories: Spell-Damage/Crit-Chance with Malus
- Weapons: Damage/DPS with Malus
- Drinks: Healing/Mana-Restore with Malus

**Example of armaments:**
```
Lv15 trägt Lv25 Plate Armor (10 Levels zu niedrig)
  Base Armor: 50
  Malus = 10 × 5% = 50%
  Actual Armor: 50 × (1 - 0.50) = 25 Armor (nur 50%!)
  ⚠️ Kaum Schutz!
```

---

## UI Display

**Inventory/Character Screen:**

```
[Adamantite Plate Armor]
  Level Requirement: 40
  Your Level: 25
  ⚠️ UNDER-LEVEL: 50% Stat Penalty
  
  Stats:
    Armor (Base): 50
    Armor (Actual): 25 (50% penalty)
    
  [Equip] [Drop]
```

**Tooltip at Hover:**
```
Adamantite Plate Armor
Armor: 50 (25 with penalty)
Requirement: Level 40
You: Level 25 (-15 levels)

Penalty: -50% stats
(+5% malus per level below requirement)
```

---

## Equipment Restrictions

**Absolute Restrictions (CANNOT wear):**
- ❌ **More than 20 levels below requirement** Cannot equip at all
- ✅ Any level below that = Can equip with malus

**Example:**
```
Lv1 Player cannot wear Lv50 Epic (49 levels difference > 20 limit)
  → "Level too low to equip this item" message
  → Item grayed out in inventory

Lv35 Player CAN wear Lv50 Epic (15 levels difference < 20 limit)
  → Can equip, but with (15 × 5%) = 75% malus
  → Only 25% of item power available
```

---

## Vertical slice scope

For first implementation:
- ✅ **Level Requirement per Item** (in item data)
- ✅ **Malus formula** (5% per level difference)
- ✅ **UI Display** (in Character/Inventory Screen)
- ✅ **Hard cap** (>20 levels under Requirement = no use)
- ⏸ Bonus for overleveling (optional, later)
- ⏸ Exceptions for certain items (later)
- ⏸ Special-Class-Requirements (e.g. "for paladins only")

---

## Open points

- **Stat type Differences:** Should Armor-Malus be different from Damage-Malus? (probably the same for simplicity)
- **Hard cap value:** 20 levels? Or dynamic (e.g. 50% malus hard cap)?
- **Potato malus:** Should potions also have malus? (probably no, easy to use)
- **Enchantment scaling:** Should enchanted stats also scale? (yes, logically)
- **Over-level bonus:** +2% per level or rather no bonus? (later balance)
