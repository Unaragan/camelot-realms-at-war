# Crafting & Professions System

> **Status:** Design-Konzept, keine Implementation. Berufe, Item-Qualität, Herstellung.

## Kern-Idee

**1 Hauptberuf pro Charakter** — spezialisiert, aber nicht ausschließlich (kannst du dennoch andere Rezepte sehen/erlernen, nur passive Boni für Hauptberuf).

**Item-Qualität-Hierarchie:**
```
Gefundene Items (Loot)
    ↓ (schlechter)
Hergestellte Items (Crafted)
    ↓ (besser)
Boss-Drops (Epic/Unique)
```

---

## Hauptberufe (One per Character)

### 1. **Waffenschmied** (Weaponsmith)
- **Stellt her:** Melee-Waffen (Schwerter, Äxte, Maces), Zweihand-Waffen
- **Materialien:** Erz, Holz (für Griffe), Leder (für Wicklungen)
- **Spezialisierung:** Waffen bekommen +10% Damage-Bonus (vs. gefundene)

### 2. **Rüstungsschmied** (Armorsmith)
- **Stellt her:** Schwere Rüstung (Plate, Breastplate, Gorget)
- **Materialien:** Erz (Haupt), Leder (für Gelenke)
- **Spezialisierung:** Rüstung +5% Armor-Wert (vs. gefundene)

### 3. **Lederer** (Leatherworker)
- **Stellt her:** Leichte/Mittlere Rüstung (Tunic, Jerkin, Studded Armor)
- **Materialien:** Leder (Haupt), Faden, Schnallen
- **Spezialisierung:** Leichte Rüstung +8% Armor + Movement Speed +5%

### 4. **Schneider** (Tailor)
- **Stellt her:** Stoff-Rüstung (Roben, Tuniken, Jacken)
- **Materialien:** Stoff, Faden, Schnallen
- **Spezialisierung:** Stoff-Rüstung +7% Mana-Pool

### 5. **Juwelier** (Jeweler)
- **Stellt her:** Accessoires (Ringe, Amulette, Verschlüsse)
- **Materialien:** Edelsteine, Erz, Leder (für Halterungen)
- **Spezialisierung:** +10% zusätzliche Effekte (z. B. Ring gibt +2% kritisch)

### 6. **Alchemist**
- **Stellt her:** Tränke, Buffs (Health Potions, Mana Potions, Buff-Flasks)
- **Materialien:** Kräuter, Reagenzien (Pilze, Mineralien)
- **Spezialisierung:** Tränke +15% stärker (längere Duration oder höhere Heilung)

---

## Item-Qualität-Tiers

| Tier | Quelle | Beispiel | Stat-Wert |
|---|---|---|---|
| **Common** | Gefundene Drops (Normalfeinde) | Linen Tunic | Basis |
| **Uncommon** | Crafted (Standard-Rezept) | Knight's Steel Plate (crafted) | Basis + 8-10% |
| **Rare** | Schwerer zu craften, bessere Materialien | **Rune-touched Armor (crafted)** | Basis + 15% |
| **Epic** | Boss-Drops nur | Adamantite Breastplate (boss loot) | Basis + 25% |
| **Legendary** | Raid-Boss / Unique | (später, vielleicht Quest-Reward) | Basis + 40% |

---

## Crafting-Mechanik

### Rezepte lernen & Level-Requirements:
- **Anfänger:** 3-5 Basis-Rezepte (mit Handwerk starten, Lv 1+)
- **Leveln:** Jedes Level 1-2 neues Rezept freischalten
- **Max Level (50):** ~20-25 Rezepte pro Beruf (viel Auswahl!)
- **Rezepte sind **geteilt** — jeder kann sie sehen, aber Hauptberuf bekommt Boni**

**Level-Requirements pro Rarity:**
| Rarity | Min. Charakter-Level | Erfolgsrate bei Min-Level |
|---|---|---|
| **Common** | 1+ | 100% |
| **Uncommon** | 10+ | 98% |
| **Rare** | 25+ | 90% |
| **Epic** | 40+ | 75% |

- ❌ **Lv 5 Crafter kann NICHT Epic craften** (Level 40+ erforderlich!)
- ❌ **Lv 15 versucht Epic** → 100% zerstört (zu unerfahren)
- ✅ **Lv 40+ kann Epic versuchen** → 75-99% Erfolg (basierend auf Skill)

**Beispiel Waffenschmied Lvl 1-50 (Rezepte-Progression):**
  - Lv 1: Wooden Dagger (Common), Iron Sword (Common)
  - Lv 5: Leather Grip (Sub, Uncommon), Oak Hilt (Sub, Common)
  - Lv 10: Steel Sword (Uncommon), Steel Axe (Uncommon)
  - Lv 15: Steel Blade (Sub, Uncommon)
  - Lv 20: Mithril Longsword (Rare), Mithril Battle Axe (Rare)
  - Lv 25: Mithril Fittings (Sub, Rare)
  - Lv 30: Rune-touched Greatsword (Rare)
  - Lv 40: Adamantite Sword (Epic), Adamantite Axe (Epic)
  - Lv 45: Dragon Ore Blade (Sub, Epic, rare material)
  - Lv 50: Adamantite Greatsword (Epic, max crafted)

### Beispiel-Crafting (Waffenschmied):
```
Rezept: Knight's Steel Longsword
Materialien:
  - 5x Steel Ore
  - 2x Oak Wood
  - 1x Leather Grip
  
Handwerksstufe erforderlich: 20+
Crafting-Zeit: 30 Sekunden
Cooldown: 5 Min (für diese Waffe)
Erfolgsrate: 98% (Uncommon)

Resultat: Knight's Steel Longsword (Uncommon)
  - Damage: +10% vs. gefundene Steel Sword
  - Haltbarkeit: Vollständig

FEHLER (2% Chance): Materialien gehen verloren
  - Einfache Materialien (Ore, Holz) zerstört
  - Sub-Komponenten (Leather Grip) zerstört
  - Spieler verliert alles → muss neuen Craft versuchen
```

### Crafting Failure & Risiko-System

**Erfolgsrate nach Item-Rarity:**

| Rarity | Farbe | Erfolgsrate | Bei Fehler |
|---|---|---|---|
| **Common** | ⚪ Grau | 100% | Niemals Fehler |
| **Uncommon** | 🟢 Grün | 98% | 2% Materialien zerstört |
| **Rare** | 🔵 Blau | 90% | 10% Materialien + Sub-Komponenten zerstört |
| **Epic** | 🟠 Orange | 75% | 25% Alle Materialien + Sub-Komponenten zerstört |

**Beispiel Epic-Fehler:**
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

**Erfolgs-Feedback:**
```
✅ SUCCESS: Adamantite Greatsword craftet! (+16 Skill)

❌ FAILURE: Crafting failed! Sub-components destroyed.
   Lost Materials: 15x Adamantite Ore, Steel Blade, Leather Grip, Steel Pommel
   Value Lost: ~650 Gold
   Retry in: 60 Min
```

### Haltbarkeit & Reparatur:
- Handgefertigte Items: Full Durability am Start
- Reparatur: Handwerker können Items wieder herstellen (kostet 50% der Original-Materialien)
- Gefundene Items können **nicht** repariert werden (abgelaufen nach ~50 Kämpfen)

---

## Vertikales Crafting (Sub-Komponenten)

**Komplexe Items brauchen Komponenten von mehreren Berufen** — schafft Interdependenz & Economy.

### Beispiele:

**Knight's Steel Plate (Rüstungsschmied)**
```
Benötigte Komponenten:
  - Steel Plate (Armorsmith craftet) = 10x Steel Ore
  - Leather Undergarment (Leatherworker craftet) = 5x Leder
  - Steel Fittings (Jeweler craftet) = 2x Steel Ore + Schnallen
  
Finales Item: Knight's Steel Plate (Uncommon, +10% Armor)
  - Stärker weil gut zusammengestellt
  - Braucht 3 verschiedene Handwerker!
```

**Greatsword (Waffenschmied)**
```
Benötigte Komponenten:
  - Steel Blade (Weaponsmith craftet) = 8x Steel Ore
  - Leather Grip (Leatherworker craftet) = 3x Leder
  - Steel Pommel/Guard (Jeweler craftet) = 2x Steel Ore
  
Finales Item: Knight's Greatsword (Uncommon, +10% Damage)
```

**Mithril Robe (Tailor)**
```
Benötigte Komponenten:
  - Mithril Cloth (Tailor selbst craftet) = 5x Mithril Cloth
  - Mithril Bindings (Jeweler craftet) = 2x Mithril Ore + Schnallen
  - Enchanted Threads (Alchemist craftet) = 2x Mana Crystal
  
Finales Item: Mithril Robe (Uncommon, +7% Mana Pool)
```

### Economy-Flow:

```
Spieler verdient Gold
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
Spieler kombiniert alles zu Final-Item (besser als nur Rohmaterialien)
```

### Vorteile:

- ✅ **Berufe sind interdependent** — Alchemist braucht Leatherworker, etc.
- ✅ **AH wird lebendiger** — Sub-Komponenten werden gekauft/verkauft
- ✅ **Spezialisierte Crafter verdienen** — "Ich mache nur Leather Grips" ist legit
- ✅ **Progression:** Simple Items (nur Rohmaterialien) → Komplexe Items (mehrere Komponenten)

### Vertical Slice:

- ✅ Einfache Sub-Komponenten: Leather Grip, Steel Fittings (nur 1-2 Levels)
- ⏸ Tiefe Craft-Chains (später, wenn System stabil)
- ⏸ Komponenten-Qualität (später: "Good Grip" vs. "Flawed Grip")

---

## Material-Quellen (Kein Farming-RPG!)

**Philosophie:** Crafting ist ein **Progression-System**, nicht ein **Farming-Grind-System**. Materialien sollten leicht verfügbar sein via Gold, nicht via stundenlange Farming-Sessions.

### Primär: NPC-Vendors (spezialisierte Werkstätten)

Jeder Realm hat spezialisierte **Material-Werkstätten** mit NPCs:

- **Erzwerk (Ore Merchant):** Verkauft Erz (Bronze, Steel, Mithril, Adamantite)
- **Holzfäller-Zunft (Lumber Vendor):** Verkauft Holz
- **Lederwerk (Leather Merchant):** Verkauft Leder
- **Schneider-Zunft (Cloth Vendor):** Verkauft Stoffe, Faden
- **Alchemist-Laden (Herb Vendor):** Verkauft Kräuter, Reagenzien

**Preise:**
- Bronze Ore: 1 Gold pro Stack (Lv 1-9)
- Steel Ore: 3 Gold pro Stack (Lv 10-29)
- Mithril Ore: 8 Gold pro Stack (Lv 30-49)
- Adamantite Ore: 20 Gold pro Stack (Lv 50)

**Verfügbarkeit:**
- Material-Kauf sollte so einfach sein wie Potions kaufen
- Kein Respawn-Timer, immer verfügbar
- "Play the game" → verdiene Gold → kaufe Materialien → craft → bessere Items

### Sekundär: Loot-Drops (optionale Ergänzung)

Seltene Materialien können auch als **Boss-Drops** oder **spezielle Mob-Drops** vorkommen:
- **Seltene Erze:** Dragon Ore, Obsidian (nur von Bosses)
- **Kraftkräuter:** Mandrake Root (nur von Dungeon-Mobs)
- Diese ermöglichen **spezielle Rezepte** (noch bessere Crafts)

### Kein stündliches Grinding:
- ❌ Nicht wie WoW: "Gehe 2 Stunden Ore farmen"
- ✅ Stattdessen: "Quest spielen → Gold verdienen → Materialien kaufen → Crafting genießen"

---

## Vertical Slice Scope

Für erste Implementation (später, nach Character/Chat/Skills):
- ✅ **2-3 Hauptberufe:** Waffenschmied, Rüstungsschmied, Alchemist
- ✅ **~15-20 Rezepte pro Beruf** (Progression durch Levels, nicht 5-6!)
- ✅ **Material-Vendor NPCs** (spezialisierte Werkstätten, simpel: einfach nur anklicken & kaufen)
- ✅ **Material-Inventory** (separater Tab in Inventory)
- ✅ **Crafting-UI:** Rezept wählen → Materialien-Check → Craft-Button → Items verschwinden, crafted Item erscheint
- ✅ **Gold als Materialien-Quelle:** Spieler verdienen Gold durchs Spielen → kaufen Materialien
- ⏸ Seltene Boss-Drop Materialien (später)
- ⏸ Haltbarkeit/Reparatur (später)
- ⏸ Weitere Berufe (später)
- ⏸ Beruf-Leveln via XP (später, vorerst nur Rezepte per Charakter-Level freischalten)

---

## Skill-Progression (Legendary Crafting)

**Skill-Punkte pro Craft (abhängig von Item-Qualität):**

| Item-Typ | Common | Uncommon | Rare | Epic |
|---|---|---|---|---|
| **Simple Items** (kein Sub-Crafting nötig) | +1 Skill | +2 Skill | +4 Skill | +8 Skill |
| **Complex Items** (mit Sub-Komponenten) | +2 Skill | +4 Skill | +8 Skill | +16 Skill |

**Beispiele:**
```
Alchemist craftet Common Health Potion:     +1 Skill
Alchemist craftet Epic Mana Flask:          +8 Skill (simple)

Waffenschmied craftet Uncommon Sword:       +2 Skill (keine Sub-Komponenten)
Waffenschmied craftet Epic Greatsword:      +16 Skill (mit Grip + Pommel)
```

**Path to Legendary (1050 Skill):**
- Nur Epic-Crafting gibt genug Skill-Punkte um 1000+ zu erreichen
- Sub-Komponenten allein (Rare max +8) = bottleneck bei ~900 Skill
- **Spieler muss sich spezialisieren:** "Ich craften nur Epic-Waffen"

**Cooldown pro Craft:**
- Common: 5 Min
- Uncommon: 10 Min
- Rare: 20 Min
- Epic: **60 Min** (sehr zeitaufwendig, aber viel Skill!)

**Erfolgsrate-Formel:**
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

**Beispiele:**

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

**Progression-Realität:**
- **Lv 1-9:** Nur Common craften (100% Erfolg)
- **Lv 10-24:** Uncommon craften (90-98% Erfolg)
- **Lv 25-39:** Rare craften (80-90% Erfolg)
- **Lv 40+:** Epic craften (75%+ bis 99%)
- **Lv 50 + Skill 1050:** Praktisch 99% = can farm Epic reliably

**Risiko-Reward:**
- ✅ Anfänger: hohe Fehlerchance = teuer, aber machbar
- ✅ Fortgeschrittene: bessere Chancen = weniger Risiko
- ✅ Legendary: fast garantiert = kann profitabel farmen

---

## Offene Punkte

- **Beruf-Leveln:** Soll XP durchs Craften steigen oder durch NPC-Quests? (wahrscheinlich beides)
- **Item-Bindung:** Sind handgefertigte Items tradeable oder Account-gebunden? (offen)
- **Storage:** Wo lagern Spieler Materialien? (Bank später, für POC: Inventory)
- **Verkaufen:** Können Spieler handgefertigte Items an andere verkaufen? (ja, aber nicht Epic-Drops)
- **Spezialisierungs-Items:** Sollen bestimmte seltene Materialien nur der Hauptberuf craften? (später)
