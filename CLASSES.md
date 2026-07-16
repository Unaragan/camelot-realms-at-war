# Klassen-Konzept (Design-Referenz)

Erste Design-Referenz für das Klassenroster, orientiert an DAOCs bewährter Drei-Rollen-Struktur pro Fraktion (Tank/Nahkampf, Heiler/Support, Fernkampf/Zauber) — nicht an den konkreten, teils sehr eigenwilligen DAOC-Klassennamen.

## Rechtlicher Rahmen (kurz, keine Rechtsberatung)

Spielmechaniken und Klassen-**Archetypen** (Tank, Heiler, Fernkämpfer) sind nicht schutzfähig — das ist reines Gameplay-Konzept, wie bei jedem anderen RPG auch. Bei den **Namen** wird unterschieden:

- **Generische Fantasy-/Mythologie-Begriffe** (Wizard, Cleric, Druid, Ranger, Paladin, Champion, Shaman, Berserker, Hunter) werden in Dutzenden Spielen verwendet, sind nicht exklusiv mit DAOC verbunden und damit unbedenklich.
- **Ungewöhnliche, erkennbar für DAOC erfundene Namen/Schreibweisen** (z. B. "Vampiir", "Bainshee", "Animist", "Valewalker", "Mauler", "Runemaster", "Bonedancer", "Spiritmaster") werden hier bewusst **nicht** übernommen — genau wie beim Projektnamen selbst halten wir bewusst Abstand zu allem, was zu eindeutig wiedererkennbar ist.

Die Realm-Namen (Albion, Midgard, Hibernia) sind wie "Camelot" gemeinfreie historische/mythologische Begriffe (Albion = alter Name für Britannien, Midgard = nordische Mythologie, Hibernia = lateinischer Name für Irland) und unbedenklich.

## Roster (Zielbild — nicht alles auf einmal bauen)

Je Fraktion drei Archetypen, passend zur Nicht-jetzt-Grenze ("max. 3 Klassen pro Fraktion"). Baureihenfolge folgt der Roadmap (Task #6: erste Klasse, Task #7: zweite Fraktion/Klasse), nicht diese Tabelle.

### Albion (arthurianisch, vielseitig, schwere Rüstung)

| Klasse | Archetyp | Kurzbeschreibung |
|---|---|---|
| Paladin | Tank/Support-Hybrid | Schwer gepanzert, Buffs für die Gruppe, solide Nahkampf-Verteidigung |
| Cleric | Heiler | Klassischer Gruppenheiler, defensive Unterstützung |
| Wizard | Fernkampf-Zauber | Hoher Einzelschaden aus der Distanz, geringe Eigenverteidigung |

### Midgard (nordisch)

| Klasse | Archetyp | Kurzbeschreibung |
|---|---|---|
| Berserker | Nahkampf-DPS/Tank | Aggressiver Frontkämpfer, hoher Schaden bei Risiko |
| Shaman | Heiler/Support | Gruppenheilung mit nordisch geprägten Buffs/Debuffs |
| Hunter | Fernkampf | Distanzkampf, Mobilität, Einzelzielfokus |

### Hibernia (keltisch)

| Klasse | Archetyp | Kurzbeschreibung |
|---|---|---|
| Champion | Nahkampf-Tank | Robuster Frontkämpfer, keltisch geprägte Fähigkeiten |
| Druid | Heiler | Naturbasierte Heilung/Support, Flächenwirkung |
| Ranger | Fernkampf/Stealth-nah | Distanzkampf mit Mobilitäts- und Tarnungselementen |

## Für den Vertical Slice (Phase 2)

- **Task #6:** eine Klasse für Fraktion 1 (Vorschlag: Paladin oder Wizard — deckt Tank- bzw. Caster-Grundgefühl ab)
- **Task #7:** erste Klasse für Fraktion 2 (Vorschlag: Berserker — maximal unterschiedliches Kampfgefühl zur ersten Klasse, testet die Asymmetrie am deutlichsten)
- Fraktion 3 (Hibernia) und weitere Klassen pro Fraktion kommen nach der Nicht-jetzt-Liste erst, wenn sich der Zwei-Fraktionen-Kampf schon gut anfühlt

## Status

🟡 Design-Referenz, noch keine Implementierung. Feinschliff (konkrete Fähigkeiten, Werte, Cooldowns) folgt bei der Umsetzung von Task #6/#7.
