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

Resultat: Knight's Steel Longsword (Uncommon)
  - Damage: +10% vs. gefundene Steel Sword
  - Haltbarkeit: Vollständig
```

### Haltbarkeit & Reparatur:
- Handgefertigte Items: Full Durability am Start
- Reparatur: Handwerker können Items wieder herstellen (kostet 50% der Original-Materialien)
- Gefundene Items können **nicht** repariert werden (abgelaufen nach ~50 Kämpfen)

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

## Offene Punkte

- **Beruf-Leveln:** Soll XP durchs Craften steigen oder durch NPC-Quests? (wahrscheinlich beides)
- **Item-Bindung:** Sind handgefertigte Items tradeable oder Account-gebunden? (offen)
- **Storage:** Wo lagern Spieler Materialien? (Bank später, für POC: Inventory)
- **Verkaufen:** Können Spieler handgefertigte Items an andere verkaufen? (ja, aber nicht Epic-Drops)
- **Spezialisierungs-Items:** Sollen bestimmte seltene Materialien nur der Hauptberuf craften? (später)
