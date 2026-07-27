# Rüstungs- & Waffen-Naming-Konvention

Kurz, klar, realm-spezifisch. Keine ultra-langen Namen — Recognition ist wichtiger als Fantasy-Detailfülle.

## Material-Tiers (Universal, alle Reiche gleich)

Progression von einfach → episch. **Format: `[Material]-[Tier]`** oder Tier-Name allein.

| Tier | Material | Beispiel | Level |
|---|---|---|---|
| 1 (Starter) | Linen, Cloth, Ragged Leather | Linen Tunic, Ragged Hide | 1-9 |
| 2 (Early) | Wool, Hardened Leather | Wool Coat, Leather Jerkin | 10-19 |
| 3 (Mid) | Linen-Reinforced, Studded Leather, Bronze | Studded Jerkin, Bronze Plate | 20-29 |
| 4 (High) | Steel, Dragon Leather | Steel Breastplate, Dragon Leather | 30-39 |
| 5 (Late) | Mithril, Enchanted Leather | Mithril Plate, Enchanted Hide | 40-49 |
| 6 (Endgame) | Adamantite, Rune-Touched | Adamantite Armor, Rune Leather | 50 |

## Realm-spezifische Präfixe

Jedes Reich hat seinen eigenen **Klasse/Handwerk-Präfix**, damit Items reich-typisch wirken:

### **Albion** — Ritterlich, heilig, ordentlich
- **Präfixe:** Knight's, Paladin's, Holy, Royal, Crusader's, Templar's
- **Beispiele:**
  - Knight's Steel Plate
  - Holy Mithril Breastplate
  - Crusader's Adamantite Armor
  - Royal Sword (Waffe)

### **Midgard** — Nordisch, wild, runisch
- **Präfixe:** Northman's, Raider's, Berserker's, Rune-, Frostbite
- **Beispiele:**
  - Northman's Studded Leather
  - Berserker's Steel Axe
  - Rune-Touched Plate
  - Frostbite Mithril Armor

### **Hibernia** — Keltisch, mystisch, natürlich
- **Präfixe:** Druid's, Fae-, Wildheart, Stone-, Treebark
- **Beispiele:**
  - Druid's Enchanted Leather
  - Fae-Warded Plate
  - Wildheart Dragon Leather
  - Treebark Armor

## Rüstungs-Typen (nach Körperteil/Gewicht)

**Format:** `[Realm-Präfix] [Material-Tier] [Type]`

### Leichte Rüstung (Stoff/Leder)
- Tunic, Coat, Jerkin, Vest, Doublet, Robe
- Bracers, Greaves, Boots
- **Beispiel:** Knight's Wool Tunic, Druid's Enchanted Vest

### Mittlere Rüstung (Studded Leather/Bronze)
- Leather Jerkin, Studded Armor, Brigandine
- Pauldrons, Gauntlets, Leg Armor
- **Beispiel:** Berserker's Studded Jerkin, Fae-Warded Pauldrons

### Schwere Rüstung (Plate)
- Breastplate, Full Plate, Cuirass, Hauberk
- Gorget, Spaulders, Tassets, Sabatons
- **Beispiel:** Knight's Steel Breastplate, Northman's Adamantite Plate

## Waffen-Naming

**Format:** `[Realm-Präfix] [Material-Tier] [Weapon-Type]`

### Nahkampf
- **Einhand:** Sword, Axe, Mace, Falchion, Cleaver
- **Zweihand:** Greatsword, Battle Axe, Warhammer, Pike, Halberd
- **Spezial:** Dagger, Short Sword, Hand Axe

### Fernkampf
- **Bogen:** Shortbow, Longbow, Recurve Bow, Compound Bow
- **Armbrust:** Light Crossbow, Heavy Crossbow, Repeating Crossbow
- **Wurfwaffen:** Throwing Knife, Spear, Javelin

### Magische Fokusobjekte (Caster)
- **Stäbe:** Staff, Quarterstaff, Mage Staff, Runestave
- **Zepter:** Scepter, Focus Rod, Wand, Crystal Rod
- **Schilde (Magier):** Buckler, Talisman

### Beispiele
- Knight's Steel Longsword
- Northman's Adamantite Battle Axe
- Druid's Fae-Warded Staff
- Raider's Mithril Dagger
- Berserker's Rune-Touched Greatsword

## Inventar-Listen-Display

Wie Items in UI angezeigt werden (gekürzte Versionen):

```
Helm-Slot:      [Knight's Steel Helm]
Chest-Slot:     [Royal Breastplate]
Legs-Slot:      [Steel Greaves]
Hands-Slot:     [Knight's Gauntlets]
Feet-Slot:      [Steel Sabatons]
Main-Hand:      [Knight's Longsword]
Off-Hand:       [Royal Shield]
```

Keine Stufen-Nummern im Namen — die stehen im Tooltip/Properties (Level 34, Armor: 45, etc.).

## Offene Punkte

- **Spezial-Items:** Sollten seltene/legendäre Items andere Naming-Patterns haben? (z. B. "Sword of xyz" statt "Knight's Sword"?) → offen für später
- **Farb-Varianten:** Sollten Material-Tier auch Farb-Bezeichnungen bekommen? (z. B. "Steel-Blue" vs. "Steel-Red") → wahrscheinlich nur in Mesh/Material, nicht im Namen
- **Unique-Items:** Wie werden Named-Items (Boss-Drops, Quest-Rewards) benannt? → später als eigene Kategorie
