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
- **Anfänger:** 3-4 Basis-Rezepte (mit Handwerk starten)
- **Leveln:** Alle 5 Level neues Rezept freischalten
- **Max Level (50):** ~10 Rezepte pro Beruf
- **Rezepte sind **geteilt** — jeder kann sie sehen, aber Hauptberuf bekommt Boni**

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

## Material-Quellen

### Farmen:
- **Erz:** Bergbau (Aktivität in der offenen Welt)
- **Holz:** Forstwirtschaft (Bäume fällen)
- **Leder:** Drops von Tieren (Jäger-Aktivität)
- **Stoff:** Drops von Humanoids (Monster/NPCs)
- **Kräuter:** Wild-Sammeln (offene Welt)

### Goldkauf:
- Spieler können Materialien vom NPC-Vendor kaufen (teuer)
- Z. B.: 10 Gold pro Steel Ore vs. 2-3 Gold wenn selbst gefarmt

---

## Vertical Slice Scope

Für erste Implementation (später, nach Character/Chat/Skills):
- ✅ **2 Hauptberufe:** Waffenschmied, Rüstungsschmied
- ✅ **5-6 einfache Rezepte pro Beruf**
- ✅ **Material-Inventory** (separater Tab in Inventory)
- ✅ **Crafting-UI:** Rezept wählen → Craft-Button → Items verschwinden, crafted Item erscheint
- ⏸ Haltbarkeit/Reparatur (später)
- ⏸ Weitere Berufe (später)
- ⏸ Komplexe Rezepte (mehrere Stufen)
- ⏸ Beruf-Quests (Level-up via Story)

---

## Offene Punkte

- **Beruf-Leveln:** Soll XP durchs Craften steigen oder durch NPC-Quests? (wahrscheinlich beides)
- **Item-Bindung:** Sind handgefertigte Items tradeable oder Account-gebunden? (offen)
- **Storage:** Wo lagern Spieler Materialien? (Bank später, für POC: Inventory)
- **Verkaufen:** Können Spieler handgefertigte Items an andere verkaufen? (ja, aber nicht Epic-Drops)
- **Spezialisierungs-Items:** Sollen bestimmte seltene Materialien nur der Hauptberuf craften? (später)
