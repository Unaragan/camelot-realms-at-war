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

### Rezepte lernen:
- **Anfänger:** 3-5 Basis-Rezepte (mit Handwerk starten)
- **Leveln:** Jedes Level 1-2 neues Rezept freischalten
- **Max Level (50):** ~20-25 Rezepte pro Beruf (viel Auswahl!)
- **Rezepte sind **geteilt** — jeder kann sie sehen, aber Hauptberuf bekommt Boni**
- **Beispiel Waffenschmied Lvl 1-50:**
  - Lv 1: Wooden Dagger, Iron Sword
  - Lv 5: Steel Sword, Steel Axe
  - Lv 10: Mithril Longsword, Mithril Battle Axe
  - Lv 20: Dragon Leather Armor Enhancements
  - Lv 30: Rune-touched Greatsword
  - Lv 50: Adamantite Weapons (best crafted)

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

**Erfolgsrate-Verbesserung durch Skill:**
- **Jeder 50 Skill = +2% Erfolgsrate** (max 99%)
- Lv1 Crafter mit Epic: 75% → 77% Erfolg (besser als 0%)
- Lv50 Crafter mit Epic: 75% → 95% Erfolg (viel sicherer)
- **Legendary Crafter (1050 Skill):** 75% + (1050÷50×2%) = 75% + 42% = **99% Erfolgsrate!**

**Beispiel Legendary-Progression mit Risiko:**
```
Day 1: Anfänger versucht 10 Epic-Crafts
  - 75% Erfolgsrate = ~7-8 erfolgreich
  - ~2-3 Fehler = 650 Gold Verlust pro Fehler
  - Netto: 8 erfolgreiche Crafts @ +16 Skill = 128 Skill (aber 1950 Gold Risiko!)

Tag 10: Lv500 Crafter versucht 10 Epic-Crafts
  - 95% Erfolgsrate = ~9-10 erfolgreich
  - ~0-1 Fehler = sicherer
  - Netto: 9 erfolgreiche Crafts @ +16 Skill = 144 Skill (nur ~200 Gold Risiko)

Legendary Crafter (1050+):
  - 99% Erfolgsrate = praktisch risk-free
  - Kann Mass-Production fahren
```

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
