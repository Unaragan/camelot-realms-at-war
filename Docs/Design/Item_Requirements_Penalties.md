# Item Level Requirements & Usage Penalties

> **Status:** Design-Konzept. Level-basierte Item-Nutzung mit Malus-System.

## Kern-Idee

**Spieler können Items unter ihrem Level-Requirement tragen**, aber mit **Stat-Malus**:
- ✅ Lv5 trägt Lv20 Schwert (möglich, aber schwach)
- ❌ Lv50 trägt Lv1 Schwert (möglich, aber sinnlos)

---

## Item-Level-Requirements nach Rarity

| Rarity | Typical Min Level | Beispiel |
|---|---|---|
| **Common** | Level 1+ | Linen Tunic (Lv1) |
| **Uncommon** | Level 10+ | Steel Sword (Lv10) |
| **Rare** | Level 25+ | Mithril Plate (Lv25) |
| **Epic** | Level 40+ | Adamantite Axe (Lv40) |
| **Legendary** | Level 48-50 | Eternal Greatsword (Lv48) |

---

## Malus-Formel (wenn unter Level-Requirement)

```
Level-Difference = Item-Level - Character-Level
If Level-Difference > 0:
  Malus % = Level-Difference × 5%
  Final Stats = Item-Stats × (1 - Malus%)
Else:
  Keine Malus (über Requirement)
```

**Beispiele:**

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
  ⚠️ Akzeptabel für Übergang

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

## Alternative: Bonused Stats bei Überleveln (Optional)

**Wenn Spieler ÜBER Level-Requirement:**

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

## Rüstung & Andere Items

**Gleiche Formel für alle Items:**
- Rüstung: Armor-Value mit Malus
- Accessories: Spell-Damage/Crit-Chance mit Malus
- Waffen: Damage/DPS mit Malus
- Tränke: Healing/Mana-Restore mit Malus

**Beispiel Rüstung:**
```
Lv15 trägt Lv25 Plate Armor (10 Levels zu niedrig)
  Base Armor: 50
  Malus = 10 × 5% = 50%
  Actual Armor: 50 × (1 - 0.50) = 25 Armor (nur 50%!)
  ⚠️ Kaum Schutz!
```

---

## UI Display

**Im Inventory/Character Screen:**

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

**Tooltip beim Hover:**
```
Adamantite Plate Armor
Armor: 50 (25 with penalty)
Requirement: Level 40
You: Level 25 (-15 levels)

Penalty: -50% stats
(+5% malus per level below requirement)
```

---

## Equipment-Restrictions

**Absolute Restrictions (CANNOT wear):**
- ❌ **More than 20 Levels below requirement** = Cannot equip at all
- ✅ Any level below that = Can equip with malus

**Beispiel:**
```
Lv1 Player cannot wear Lv50 Epic (49 levels difference > 20 limit)
  → "Level too low to equip this item" message
  → Item grayed out in inventory

Lv35 Player CAN wear Lv50 Epic (15 levels difference < 20 limit)
  → Can equip, but with (15 × 5%) = 75% malus
  → Only 25% of item power available
```

---

## Vertical Slice Scope

Für erste Implementation:
- ✅ **Level-Requirement pro Item** (in Item-Daten)
- ✅ **Malus-Formel** (5% pro Level-Differenz)
- ✅ **UI Display** (in Character/Inventory Screen)
- ✅ **Hard Cap** (>20 Levels unter Requirement = keine Nutzung)
- ⏸ Bonus für Überleveln (optional, später)
- ⏸ Ausnahmen für bestimmte Items (später)
- ⏸ Special-Class-Requirements (z. B. "Nur für Paladine")

---

## Offene Punkte

- **Stat-Typ Unterschiede:** Sollte Armor-Malus anders sein als Damage-Malus? (wahrscheinlich gleich für Einfachheit)
- **Hard-Cap-Wert:** 20 Levels? Oder dynamisch (z. B. 50% Malus Hard-Cap)?
- **Tränke-Malus:** Sollen Potions auch Malus haben? (wahrscheinlich nein, einfach zu verwenden)
- **Enchantment-Scaling:** Sollten verzauberte Stats auch skalieren? (ja, logisch)
- **Über-Level Bonus:** +2% pro Level oder lieber keine Bonus? (später balancen)
