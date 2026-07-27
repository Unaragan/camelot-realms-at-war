# Skill Tree & Talent Progression-System

> **Status:** Early Design, keine Implementation. Struktur für wie Spieler Fähigkeiten upgraden/spezialisieren.

## Kern-Idee

**"Lean Talent System"** — nicht WoW-artig mit 100 Optionen, sondern **2-3 Spezialisierungs-Pfade pro Klasse** (Defense vs. Offense, oder Heal-AoE vs. Heal-Single), die den Spieler klar unterscheidbar machen.

Siehe CLASSES.md: jede Klasse hat **zwei Talent-Pfade** (defensiv/support vs. offensiv).

## Progression-Mechaniken

### 1. **Talent-Punkte (per Level)**

- Spieler bekommt **1 Talent-Punkt pro Level** (Level 1 → 50 = bis zu 50 Punkte)
- Punkte investieren in **zwei Talent-Bäume** der Klasse
- Maximal **25 Punkte pro Baum** (ausbalanciert)
- Später: **Neuspec/Respeck möglich** (Kosten-Option für Endgame)

### 2. **Zwei Talent-Pfade pro Klasse**

Jede Klasse hat **exakt zwei Tabs**, nicht mehr:

| Klasse | Path A (Defensive) | Path B (Offensive) |
|---|---|---|
| **Paladin** | Holy Defense (Tank-Buffs, Shields) | Crusade (Damage Buffs, Aggro-Debuff) |
| **Cleric** | Divine Heal (AoE Heal, Buffs) | Smite (Heal + Damage Hybrid) |
| **Wizard** | Arcane Control (Crowd Control, Defense) | Inferno (Burst Damage, AoE) |
| **Berserker** | Battle Fury (Damage + Self-Buff) | Unbreakable (Tank-like Defense) |
| **Shaman** | Restore (AoE Heal, Group Support) | Curse (Debuffs, Offensive Buffs) |
| **Hunter** | Precision (Single-Target Damage) | Swiftness (Mobility, Kiting) |
| (etc.) | (etc.) | (etc.) |

## Talent-Baum-Layout (Konzeptuell)

**Nicht linear:** Nicht unbedingt "Baum" sondern eher **3x5 oder 3x7 Grid** mit Abhängigkeiten (Tier-basiert).

```
Tier 1 (Lv 1-5):      [Talent A]  [Talent B]  [Talent C]
                      |          |          |
Tier 2 (Lv 6-15):     [T.D]  [T.E]--[T.F]  [T.G]
                           |       |
Tier 3 (Lv 16-25):    [T.H]  [T.I]  [T.J]  [T.K]--[T.L]
```

- **Tier 1:** Basis-Talents (3 Optionen, wähle 2 aus = 2 Punkte nötig)
- **Tier 2:** Spezialisierungs-Talents (abhängig von Tier 1 Wahl)
- **Tier 3:** Capstone (End-Talents, Finales Ability pro Path)

## Talent-Typen

### A. **Passive Talents** (Stat-Boosts)
- +5% Health
- +10% Damage
- +3 Armor
- +Mana Regeneration
- *Kosten: 1 Punkt*

### B. **Ability Enhancement Talents** (Fähigkeits-Modifikation)
- "Holy Strike deals +20% damage to undead"
- "Heal over Time: extends duration by 2 seconds"
- "Crowd Control: stun chance +25%"
- *Kosten: 1-2 Punkte*

### C. **Capstone Talents** (Eindeutige Abilities)
- "Paladin's Holy Light: instant heal, 30 sec cooldown"
- "Wizard's Inferno: AoE damage burst, high mana cost"
- *Kosten: 2-3 Punkte* (sind die "großen" Fähigkeiten)

## Vertical Slice Scope (einfach halten)

Für die erste Implementierung:
- **3 Klassen** (Paladin, Berserker, Champion)
- **Jede hat 2 Talent-Pfade**
- **Je Pfad ~10-15 Talents** (keine 100er-Bäume)
- **Per-Level: 1 Punkt**
- **UI:** Ein einfaches Tree-View-Widget (Klick = Punkt investieren)

## Später: Spezialisierungs-Items

(Post-Release Idee, nicht für POC)
- **Rune Stones** oder **Talent Runes:** Items, die zusätzliche Talent-Modifier geben (z. B. +1 Punkt in speziellem Talent)
- **Class-specific Runes:** z. B. "Paladin's Rune of Holy Wrath" adds bonus effect to Holy Strike
- Dadurch etwas mehr Komplexität ohne den Baum zu verändern

## Offene Punkte

- **Respeck-Kosten:** Gold? Spezial-Item? Kostenlos in Towns? (später balancen)
- **Tier-Lockout:** Muss man Tier 1 vollständig spielen bevor Tier 2 freischaltet? (wahrscheinlich ja für Einfachheit)
- **Pvp-Balance:** Sollte der Talent-Baum zwischen PvE und PvP unterschiedlich sein? (nein, einfacher für POC)
- **Macro-Support:** Sollte es Save-Builds geben ("Talent Preset 1 / 2")? (später, wenn Zeit)

## UI für Talent-Zuordnung

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

