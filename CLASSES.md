# Klassen-Konzept (Design-Referenz)

Erste Design-Referenz für das Klassenroster, orientiert an DAOCs bewährter Drei-Rollen-Struktur pro Fraktion (Tank/Nahkampf, Heiler/Support, Fernkampf/Zauber) — nicht an den konkreten, teils sehr eigenwilligen DAOC-Klassennamen.

## Rechtlicher Rahmen (kurz, keine Rechtsberatung)

Spielmechaniken und Klassen-**Archetypen** (Tank, Heiler, Fernkämpfer) sind nicht schutzfähig — das ist reines Gameplay-Konzept, wie bei jedem anderen RPG auch. Bei den **Namen** wird unterschieden:

- **Generische Fantasy-/Mythologie-Begriffe** (Wizard, Cleric, Druid, Ranger, Paladin, Champion, Shaman, Berserker, Hunter, Rogue, Bard, Minstrel, Skald, Raider, Duelist) werden in Dutzenden Spielen verwendet bzw. sind echte historische/mythologische Begriffe (Skald = historischer nordischer Kriegerdichter, Bard = historisch-mythologisch keltisch), nicht exklusiv mit DAOC verbunden und damit unbedenklich.
- **Ungewöhnliche, erkennbar für DAOC erfundene Namen/Schreibweisen** (z. B. "Vampiir", "Bainshee", "Animist", "Valewalker", "Mauler", "Runemaster", "Bonedancer", "Spiritmaster") werden hier bewusst **nicht** übernommen — genau wie beim Projektnamen selbst halten wir bewusst Abstand zu allem, was zu eindeutig wiedererkennbar ist.

Die Realm-Namen (Albion, Midgard, Hibernia) sind wie "Camelot" gemeinfreie historische/mythologische Begriffe (Albion = alter Name für Britannien, Midgard = nordische Mythologie, Hibernia = lateinischer Name für Irland) und unbedenklich.

## Roster: Vertical Slice vs. Endversion

**Vertical Slice (jetzt):** drei Archetypen pro Fraktion, passend zur Nicht-jetzt-Grenze ("max. 3 Klassen pro Fraktion"). Baureihenfolge folgt der Roadmap (Task #6: erste Klasse, Task #7: zweite Fraktion/Klasse).

**Endversion (Zielbild, nicht jetzt bauen):** fünf Klassen pro Fraktion — die drei bestehenden plus zwei weitere Archetypen (Nahkampf-Burst/Stealth, Support/Buffs), die die Rolle des Rückenangriff-Mechanik (SYSTEMS.md) und Gruppenkontrolle stärker bedienen.

### Albion (arthurianisch, vielseitig, schwere Rüstung)

| Klasse | Archetyp | Kurzbeschreibung | Phase |
|---|---|---|---|
| Paladin | Tank/Support-Hybrid | Schwer gepanzert, Buffs für die Gruppe, solide Nahkampf-Verteidigung | Vertical Slice |
| Cleric | Heiler | Klassischer Gruppenheiler, defensive Unterstützung | Vertical Slice |
| Wizard | Fernkampf-Zauber | Hoher Einzelschaden aus der Distanz, geringe Eigenverteidigung | Vertical Slice |
| Rogue | Nahkampf-Burst/Stealth | Hohe Einzelziel-Burst, Mobilität, profitiert stark vom Rückenangriff | Endversion |
| Minstrel | Support/Buffs | Gruppen-Buffs, Debuffs/Kontrolle, mittelalterlich-englische Musiker-Tradition | Endversion |

### Midgard (nordisch)

| Klasse | Archetyp | Kurzbeschreibung | Phase |
|---|---|---|---|
| Berserker | Nahkampf-DPS/Tank | Aggressiver Frontkämpfer, hoher Schaden bei Risiko | Vertical Slice |
| Shaman | Heiler/Support | Gruppenheilung mit nordisch geprägten Buffs/Debuffs | Vertical Slice |
| Hunter | Fernkampf | Distanzkampf, Mobilität, Einzelzielfokus | Vertical Slice |
| Raider | Nahkampf-Burst/Mobilität | Wikingerhafter Schnellangreifer, profitiert vom Rückenangriff | Endversion |
| Skald | Support/Buffs | Historischer nordischer Kriegerdichter, Gruppen-Buffs/Kontrolle | Endversion |

### Hibernia (keltisch)

| Klasse | Archetyp | Kurzbeschreibung | Phase |
|---|---|---|---|
| Champion | Nahkampf-Tank | Robuster Frontkämpfer, keltisch geprägte Fähigkeiten | Vertical Slice |
| Druid | Heiler | Naturbasierte Heilung/Support, Flächenwirkung | Vertical Slice |
| Ranger | Fernkampf/Stealth-nah | Distanzkampf mit Mobilitäts- und Tarnungselementen | Vertical Slice |
| Duelist | Nahkampf-Burst/Beweglichkeit | Schneller Einzelkämpfer, profitiert vom Rückenangriff | Endversion |
| Bard | Support/Buffs | Historisch-mythologisch keltischer Begriff, Gruppen-Buffs/Kontrolle | Endversion |

## Spezialisierungs-Pfade (Talent-Wahl pro Archetyp)

Jeder Archetyp bekommt zwei Talent-Pfade – einen defensiv/support-orientierten, einen offensiv/schadensorientierten. Passt zum "schlanke Talent-Wahlpunkte"-Prinzip aus SYSTEMS.md (2-3 Optionen, keine tiefe Verzweigung).

| Archetyp | Spec A (defensiv/support) | Spec B (offensiv) |
|---|---|---|
| Tank (Paladin/Berserker/Champion) | Def-Tank: hohe Verteidigung, Aggro-Bindung, Gruppenschutz | 2H-Schaden: offensiv, hoher Einzelschaden, weniger Verteidigung |
| Heiler (Cleric/Shaman/Druid) | Gruppenheilung: AoE-Heal, Buffs | Einzelheilung + Schaden: starke Einzelzielheilung, offensive Hybrid-Fähigkeiten |
| Caster (Wizard) | Flächenschaden: mehrere Ziele gleichzeitig, schwächer pro Ziel | Einzelziel-Burst: hoher Schaden auf ein Ziel |
| Fernkämpfer (Hunter/Ranger) | Kontrolle: Fesseln/Verlangsamen, Gruppenkontrolle | Präzision: hoher Einzelschaden, Mobilität |
| Nahkampf-Burst (Rogue/Raider/Duelist, Endversion) | Stealth/Vorbereitung: aus Tarnung heraus, verlässlicher Rückenangriff | Offene Klinge: höheres Grundtempo, weniger auf Rückenangriff angewiesen |
| Support (Minstrel/Skald/Bard, Endversion) | Gruppen-Buffs: Stat-Boosts, Ausdauer/Ressourcen-Unterstützung | Kontrolle: Debuffs, Crowd-Control, Gegner schwächen |

Technisch: ein Wahlpunkt pro Archetyp/Levelstufe in der Talent-Tabelle aus SYSTEMS.md, keine tiefere Verzweigung als diese zwei Optionen.

## Für den Vertical Slice (Phase 2)

- **Task #6:** eine Klasse für Fraktion 1 (Vorschlag: Paladin oder Wizard — deckt Tank- bzw. Caster-Grundgefühl ab)
- **Task #7:** erste Klasse für Fraktion 2 (Vorschlag: Berserker — maximal unterschiedliches Kampfgefühl zur ersten Klasse, testet die Asymmetrie am deutlichsten)
- Fraktion 3 (Hibernia) und weitere Klassen pro Fraktion kommen nach der Nicht-jetzt-Liste erst, wenn sich der Zwei-Fraktionen-Kampf schon gut anfühlt

## Status

🟡 Design-Referenz, noch keine Implementierung. Feinschliff (konkrete Fähigkeiten, Werte, Cooldowns) folgt bei der Umsetzung von Task #6/#7. 5-Klassen-Zielbild pro Fraktion (2026-07-21) ist reine Vormerkung für die Endversion, ändert nichts an der aktuellen Nicht-jetzt-Grenze.
