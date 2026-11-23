# Crafting and Professions System

> **Status:** Design concept, not implementation. Occupations, item quality, manufacturing.

## Core idea

**1 main occupation per character** - specialized, but not exclusively (you can still see/learn other recipes, only passive bonuses for main job).

**Item Quality Hierarchy:**
```
Gefundene Items (Loot)
    ↓ (schlechter)
Hergestellte Items (Crafted)
    ↓ (besser)
Boss-Drops (Epic/Unique)
```

---

## Main occupations (one per character)

### 1. **Gunsmiths** (Weaponsmith)
- **Manufactured:** Melee weapons (swords, axes, maces), two-handed weapons
- **Materials:** Ore, wood (for handles), leather (for windings)
- **Specialisation:** Weapons get +10% damage bonus (vs. found)

### 2. **Armsmith** (Armorsmith)
- **Manufactured:** Heavy Armor (Plate, Breastplate, Gorget)
- **Materials:** Ore (main), leather (for joints)
- **Specialisation:** Armor +5% Armor value (vs. found)

### 3. **Leather** (Leatherworker)
- **Manufactured:** Light/Medium Armor (Tunic, Jerkin, Studded Armor)
- **Materials:** Leather (main), thread, buckles
- **Specialisation:** Light armor +8% Armor + Movement Speed +5%

### 4. **Cutters** (tailor)
- **Manufactured:** Fabric armor (robes, tunics, jackets)
- **Materials:** Substance, thread, buckles
- **Specialisation:** Fabric armor +7% mana pool

### 5. **Jewellery** (Jeweler)
- **Manufactured:** Accessories (rings, amulets, caps)
- **Materials:** Precious stones, ore, leather (for brackets)
- **Specialisation:** +10% additional effects (e.g. ring gives +2% critical)

### 6. **Alchemist**
- **Manufactured:** Potions, buffs (Health Potions, Mana Potions, Buff-Flasks)
- **Materials:** Herbs, reagents (mushrooms, minerals)
- **Specialisation:** Drinks +15% stronger (longer duration or higher healing)

---

## Item quality tiers

| Animals | Source | Example | Stat value | Min. Level |
|---|---|---|---|---|
| **Common Commons** | Found drops | Linen tunic | Base base | 1+ |
| **Uncommon** | Crafted | Knight's Steel Plate | Base + 8-10% | 10+ |
| **Rare** | Crafted (better) | Rune-touched armor | Base + 15% | 25+ |
| **Epic** | Crafted (rare) OR Boss Drops | Adamantite Breastplate | Base + 25% | 40+ |
| **Legendary** | **Crafted (only experts!)** | Eternal Adamantite Greatsword | Base + 40% | **48-50** |

**Legendary Crafting:**
- ⚠️ **Only Level 48-50 Crafters can make Legendary**
- Requires super rare materials (Boss-Drops only)
- Highest success rate requirement
- Only for Legendary Skill Crafter (1050+) realistic chances

---

## Crafting mechanics

### Learning Recipes & Level Requirements:
- **Beginners:** 3-5 basic recipes (start with craft, Lv 1+)
- **Levels:** Unlock each Level 1-2 new recipe
- **Max Level (50):** ~20-25 recipes per profession (lots of choice!)
- **Recipes are: **Shared** - anyone can see them, but main profession gets bonuses**

**Level requirements per Rarity:**
| Rarity | Min. Character Level | Success rate at min-level | Colour |
|---|---|---|---|
| **Common Commons** | 1+ | 100% | ⚪ Grey |
| **Uncommon** | 10+ | 98% | 😆 Green |
| **Rare** | 25+ | 90% | 🔵 Blue |
| **Epic** | 40+ | 75% | 😆 Orange |
| **Legendary** | **48-50** | **50%** | 🔴 Red |

- ❌ **Lv 5 Crafter Can't Craft Epic** (Level 40+ required!)
- ❌ **Lv 15 tries Epic** 100% destroyed (too inexperienced)
- ✅ **Lv 40+ can try Epic** 75-99% Success (based on Skill)

**Example of weaponsmith Lvl 1-50 (recipe progression):**
  - Lv 1: Wooden Dagger (Common), Iron Sword (Common)
  - Lv 5: Leather Grip (Sub, Uncommon), Oak Hilt (Sub, Common)
  - Lv 10: Steel Sword (Uncommon), Steel Axe (Uncommon)
  - Lv 15: Steel Blade (Sub, Uncommon)
  - Lv 20: Mithril Longsword (Rare), Mithril Battle Axe (Rare)
  - Lv 25: Mithril Fittings (Sub, Rare)
  - Lv 30: Rune-touched Greatsword (Rare)
  - Lv 40: Adamantite Sword (Epic), Adamantite Axe (Epic)
  - Lv 45: Dragon Ore Blade (Sub, Epic, rare material)
  - Lv 48: **Eternal Adamantite Longsword (Legendary)** ← Only available here!
  - Lv 50: **Eternal Adamantite Greatsword (Legendary)** ← The True Endgame

### Example crafting (weaponsmith):
```
Rezept: Knight's Steel Longsword
Materialien:
  - 5x Steel Ore
  - 2x Oak Wood
  - 1x Leather Grip
  
Handwerksstufe erforderlich: 20+
Crafting-Zeit: 30 Sekunden
Cooldown: 5 minutes for this weapon
Erfolgsrate: 98% (Uncommon)

Resultat: Knight's Steel Longsword (Uncommon)
  - Damage: +10% vs. gefundene Steel Sword
  - Haltbarkeit: Vollständig

FEHLER (2% Chance): Materialien gehen verloren
  - Einfache Materialien (Ore, Holz) zerstört
  - Sub-Komponenten (Leather Grip) zerstört
  - The player loses the materials and must try crafting again
```

### Crafting Failure & Risk System

**Success rate according to Item-Rarity:**

| Rarity | Colour | Success rate | In case of errors |
|---|---|---|---|
| **Common Commons** | ⚪ Grey | 100% | Never make mistakes |
| **Uncommon** | 😆 Green | 98% | 2% materials destroyed |
| **Rare** | 🔵 Blue | 90% | 10% materials + sub-components destroyed |
| **Epic** | 😆 Orange | 75% | 25% All materials + sub-components destroyed |

**Example of Epic error:**
```
Waffenschmied versucht: Adamantite Greatsword (Epic, 60 Min Cooldown)
Materialien:
  - 15x Adamantite Ore (= 300 Gold vom Vendor)
  - 8x Oak Wood (= 20 Gold)
  - Steel Blade Sub-Komponente (= 150 Gold crafted)
  - Leather Grip Sub-Komponente (= 80 Gold crafted)
  - Steel Pommel Sub-Komponente (= 100 Gold crafted)
  
Total Material-Wert: 650 Gold

Crafting startet... 25% Fehlerchance...
FEHLER! ❌ (würfelglück Pech)
  
Resultat: ALLES ZERSTÖRT
  - Adamantite Ore: weg
  - Sub-Komponenten: weg
  - Verlust: 650 Gold
  - Nächster Versuch in 60 Min möglich
```

**Success feedback:**
```
✅ SUCCESS: Adamantite Greatsword craftet! (+16 Skill)

❌ FAILURE: Crafting failed! Sub-components destroyed.
   Lost Materials: 15x Adamantite Ore, Steel Blade, Leather Grip, Steel Pommel
   Value Lost: ~650 Gold
   Retry in: 60 Min
```

### Durability & Repair:
- Handcrafted Items: Full Durability at the Start
- Repair: craftsmen can restore items (costs 50% of the original materials)
- Finding items can **not** be repaired (expired after ~50 fights)

---

## Vertical crafting (sub-components)

**Complex items need components from multiple professions** — creates interdependence & economy.

### Examples:

**Knight's Steel Plate (Armsmith)**
```
Benötigte Komponenten:
  - Steel Plate (Armorsmith craftet) = 10x Steel Ore
  - Leather Undergarment (Leatherworker craftet) = 5x Leder
  - Steel Fittings (Jeweler craftet) = 2x Steel Ore + Schnallen
  
Finales Item: Knight's Steel Plate (Uncommon, +10% Armor)
  - Stärker weil gut zusammengestellt
  - Braucht 3 verschiedene Handwerker!
```

**Greatsword (weaponsmith)**
```
Benötigte Komponenten:
  - Steel Blade (Weaponsmith craftet) = 8x Steel Ore
  - Leather Grip (Leatherworker craftet) = 3x Leder
  - Steel Pommel/Guard (Jeweler craftet) = 2x Steel Ore
  
Finales Item: Knight's Greatsword (Uncommon, +10% Damage)
```

**Mithril Robe (tailor)**
```
Benötigte Komponenten:
  - Mithril Cloth (Tailor selbst craftet) = 5x Mithril Cloth
  - Mithril Bindings (Jeweler craftet) = 2x Mithril Ore + Schnallen
  - Enchanted Threads (Alchemist craftet) = 2x Mana Crystal
  
Finales Item: Mithril Robe (Uncommon, +7% Mana Pool)
```

### Economy flow:

```
The player earns gold
        ↓
Kauft Rohmaterialien (Steel Ore, Leder, etc.) vom NPC-Vendor
        ↓
Verkauft an Spezialisten im AH:
  - Weaponsmith: "Ich brauche Steel Blades" → kauft von Crafter
  - Leatherworker: "Ich brauche Leather Grips" → kauft von Crafter
  - Jeweler: "Ich brauche Steel Fittings" → kauft von Crafter
        ↓
Jeder spezialisierter Crafter kann diese Sub-Items im AH verkaufen
        ↓
The player assembles the final item, which is worth more than the raw materials
```

### Advantages:

- ✅ **Professions are interdependent** — Alchemist needs Leatherworker, etc.
- ✅ **AH becomes more alive** — Sub-components are bought/sold
- ✅ **Specialist Crafters Earn** — "I just do Leather Grips" is legit
- ✅ **Progression:** Simple Items (Raw Materials Only) → Complex Items (Multiple Components)

### Vertical slice:

- Simple sub-components: Leather Grip, Steel Fittings (only 1-2 levels)
- ⏸ Deep craft chains (later, if system stable)
- ⏸ Component quality (later: "Good Grip" vs. "Flawed Grip")

---

## Material Sources (No Farming RPG!)

**Philosophy:** Crafting is a **Progression system**, not a **Farming grind system**Materials should be readily available through gold, not through hour-long farming sessions.

### Primary: NPC vendors (specialised workshops)

Each realm has specialized **Material workshops** with NPCs:

- **Ore (Ore Merchant):** Sold Ore (Bronze, Steel, Mithril, Adamantite)
- **Woodcutter guild (Lumber Vendor):** Sold wood
- **Leather Works (Leather Merchant):** Sold leather
- **Schneider guild (Cloth Vendor):** Sold fabrics, thread
- **Alchemist shops (Herb Vendor):** Sold herbs, reagents

**Prices:**
- Bronze Ore: 1 gold per stack (Lv 1-9)
- Steel Ore: 3 gold per stack (Lv 10-29)
- Mithril Ore: 8 gold per stack (Lv 30-49)
- Adamantite Ore: 20 gold per stack (Lv 50)

**Availability:**
- Purchasing material should be as easy as buying Potions
- No respawn timer, always available
- "Play the game" → verdiene Gold → kaufe Materialien → craft → bessere Items

### Secondary: Loot-Drops (optional addition)

Rare materials can also be **Boss drops** or **Special Mob Drops** where:
- **Rare ores:** Dragon Ore, Obsidian (only from Bosses)
- **Power herbs:** Mandrake Root (from dungeon mobs only)
- They shall enable: **Special recipes** (even better crafts)

### No hourly grinding:
- ❌ Not like WoW: "Go 2 hours ore farming"
- ✅ Instead: "Play Quest → Earn Gold → Buy Materials → Enjoy Crafting"

---

## Vertical slice scope

For first implementation (later, after Character/Chat/Skills):
- ✅ **2-3 main occupations:** Gunsmith, armorer, alchemist
- ✅ **~15-20 recipes per profession** (Progression through levels, not 5-6!)
- ✅ **Material vendor NPCs** (specialized workshops, simple: just click & buy)
- ✅ **Material inventory** (separate tab in inventory)
- ✅ **Crafting UI:** Choose recipe → Materials Check → Craft Button → Items disappear, crafted item appears
- ✅ **Gold as a source of materials:** Players Earn Gold by Playing → Buying Materials
- Rare Boss-Drop Materials (later)
- ⏸ Durability/repair (later)
- ⏸ Other professions (later)
- ⏸ Professional levels via XP (later, for the time being only unlock recipes via character level)

---

## Skill progression (Legendary Crafting)

**Skill points per craft (depending on item quality):**

| Item type | Common Commons | Uncommon | Rare | Epic |
|---|---|---|---|---|
| **Simple items** (no sub-crafting required) | +1 Skill | +2 Skill | +4 Skill | +8 skill |
| **Complex Items** (with subcomponents) | +2 Skill | +4 Skill | +8 skill | +16 Skill |

**Examples:**
```
Alchemist craftet Common Health Potion:     +1 Skill
Alchemist craftet Epic Mana Flask:          +8 Skill (simple)

Waffenschmied craftet Uncommon Sword:       +2 Skill (keine Sub-Komponenten)
Waffenschmied craftet Epic Greatsword:      +16 Skill (mit Grip + Pommel)
```

**Path to Legendary (1050 Skill):**
- Only Epic-Crafting Gives Enough Skill Points to Reach 1000+
- Sub-components alone (Rare max +8) = bottleneck at ~900 Skill
- **Players must specialize:** "I'm just crafting epic weapons"

**Cooldown per Craft:**
- Common: 5 min
- Uncommon: 10 minutes
- Rare: 20 min
- Epic: **60 min.** (Very time-consuming, but a lot of skill!)

**Success rate formula:**
```
Basis-Erfolgsrate (nach Rarity) + Skill-Bonus
Basis:
  - Common: 100%
  - Uncommon: 98%
  - Rare: 90%
  - Epic: 75%

Skill-Bonus:
  - Jeder 50 Skill = +2% (max +42% bei 1050 Skill)

Level-Penalty (wenn unter Min-Level):
  - Jedes Level unter Min-Requirement = -10% Erfolgsrate
  - Wenn Erfolgsrate < 0% nach Berechnung = 0% (100% Fehler)
```

**Examples:**

```
Scenario 1: Lv 35 Crafter, Skill 100, versucht Epic (benötigt Lv 40)
  - Basis Epic: 75%
  - Skill-Bonus: 100÷50×2% = +4%
  - Level-Penalty: 5 Levels zu niedrig = -50%
  - Final: 75% + 4% - 50% = 29% Erfolgsrate
  - ⚠️ Sehr riskant!

Scenario 2: Lv 40 Crafter, Skill 500, versucht Epic (genau Min-Level)
  - Basis Epic: 75%
  - Skill-Bonus: 500÷50×2% = +20%
  - Level-Penalty: 0 (auf Min-Level)
  - Final: 75% + 20% = 95% Erfolgsrate
  - ✅ Sicher genug zum Craften

Scenario 3: Lv 50 Legendary, Skill 1050, versucht Epic
  - Basis Epic: 75%
  - Skill-Bonus: 1050÷50×2% = +42%
  - Level-Penalty: 0 (Lv 50 > Lv 40 requirement)
  - Final: 75% + 42% = 99% Erfolgsrate
  - ✅ Praktisch risk-free!

Scenario 4: Lv 1 Crafter, Skill 0, versucht Epic (benötigt Lv 40)
  - Basis Epic: 75%
  - Skill-Bonus: 0%
  - Level-Penalty: 39 Levels zu niedrig = -390% (aber min. 0%)
  - Final: 0% (100% FEHLER — alles zerstört!)
  - ❌ Keine Chance, auch zu jung
```

**Skill Bonus for Legendary:**
- Each 50 Skill = +2% (same as Epic)
- Lv 48-50 with skill 0: 50% success rate (very risky)
- Lv 50 with Skill 1050: 50% + 42% = **92% success rate** (acceptable)

**Progression Reality:**
- **Lv 1-9:** Only common crafting (100% success)
- **Lv 10-24:** Uncommon craften (90-98% success)
- **Lv 25-39:** Rare craften (80-90% success)
- **Lv 40-47:** Epic craften (75%+ to 99%)
- **Lv 48-50 + Skill 1050** Legendary craften (92%+ risk, true endgame!)

**Risk Reward:**
- ✅ Beginners: high chance of error = expensive, but feasible
- ✅ Advanced: better opportunities = less risk
- ✅ Legendary: almost guaranteed = can farm profitably

---

## Open points

- **Occupational levels:** Should XP go through crafting or through NPC quests? (probably both)
- **Item binding:** Are handcrafted items tradeable or account-bound? (open)
- **Storage:** Where do players store materials? (Bank later, for POC: Inventory)
- **Sell:** Can Players Sell Handcrafted Items to Others? (Yes, but Not Epic Drops)
- **Specialization items:** Should certain rare materials only craft the main profession? (later)
