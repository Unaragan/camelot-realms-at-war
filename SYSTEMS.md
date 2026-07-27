# Gameplay-Systeme: Vorausplanung (Skills, Passive Werte, GUI)

Design-Referenz, damit Fähigkeiten, Charakterwerte und HUD von Anfang an daten-getrieben sind – neue Klasse/Fähigkeit später heißt "neue DataTable-Zeile", nicht "neuer Code". Baut auf GAS (Gameplay Ability System) auf, siehe Tech-Stack in README.md.

## Grundprinzip

Alles, was sich zwischen Klassen/Fähigkeiten unterscheidet, liegt in DataTables – nicht in Blueprint-Verzweigungen oder C++-Sonderfällen pro Klasse. Eine neue Fähigkeit anzulegen sollte bedeuten: neue Zeile in der Ability-Tabelle ausfüllen, keine neue Klasse programmieren.

## 1. Passive Werte (GAS Attribute Set)

**Für den Vertical Slice reicht ein schlankes Set:**

| Attribut | Zweck |
|---|---|
| Health | Lebenspunkte |
| Resource | Generischer Ressourcentyp (Mana/Ausdauer/etc. – pro Klasse später reflavored, technisch derselbe Attributtyp) |
| Damage | Basis-Schadenswert |
| Armor | Basis-Rüstung/Schadensreduktion |

Bewusst **nicht** jetzt: Krit-Chance, Ausweichen, Elementarresistenzen, Itemization-Boni – das ist Teil der "Nicht-jetzt: tiefe Itemization" aus der README. GAS-Attribute-Sets sind aber von Natur aus erweiterbar, das lässt sich später ohne Umbau nachrüsten.

**Start-Werte pro Klasse** als eigene DataTable (`FCharacterClassData`, bereits im Art-Stil-Abschnitt der README angedacht): Spalten für Fraktion, Basis-Health, Basis-Resource, Basis-Damage, Basis-Armor. Bewusste Asymmetrie zwischen den Klassen aus CLASSES.md (z. B. Berserker hohe Health/Damage, Wizard niedrige Health/hoher Resource-Pool).

## 2. Fähigkeiten (Skills)

**DataTable-Schema-Vorschlag** (eine Zeile = eine Fähigkeit):

| Spalte | Typ | Zweck |
|---|---|---|
| AbilityID | Name | Eindeutiger Schlüssel |
| DisplayName | FText | Anzeigename (lokalisiert, siehe Lokalisierungs-Regel) |
| Description | FText | Tooltip-Text (lokalisiert) |
| Icon | Soft-Objekt-Referenz | UI-Icon |
| Cooldown | float | Sekunden |
| ResourceCost | float | Kosten in Resource-Attribut |
| CastTime | float | 0 = instant |
| GameplayEffectClass | Klassen-Referenz | Welcher modulare Effekt ausgelöst wird (siehe unten) |
| GameplayTags | Gameplay-Tag-Container | Kategorisierung (siehe Taxonomie unten) |
| AnimationMontage | Soft-Objekt-Referenz | Abspielanimation |

**Modulare GameplayEffects statt Einzel-Assets pro Fähigkeit:** Ein generischer `GE_InstantDamage` mit Set-by-Caller-Magnitude (Zahl wird zur Laufzeit von der Fähigkeit übergeben) deckt viele Schadensfähigkeiten ab, statt für jede Fähigkeit einen eigenen GameplayEffect anzulegen. Genauso `GE_InstantHeal`, `GE_ApplyBuff`, `GE_ApplyDebuff` als wiederverwendbare Bausteine. Hält die Anzahl der Assets klein, während das Klassenroster wächst.

**Gameplay-Tag-Taxonomie (Startvorschlag):**

```
Ability.Damage.Melee
Ability.Damage.Ranged
Ability.Heal.Single
Ability.Heal.Group
Ability.Buff
Ability.Debuff.CC
Class.Albion.Paladin
Class.Midgard.Berserker
State.Stunned
State.Silenced
```

Tags treiben in GAS Aktivierungssperren, Cooldown-Tracking und CC-Zustände – von Anfang an eine konsistente Hierarchie zu nutzen (statt ad-hoc benannter Tags pro Fähigkeit) spart später viel Aufräumarbeit.

## 2b. Fähigkeiten-Umfang & Progression (DAOC-/MMO-Erfahrungswert)

- **Harte Slot-Grenze:** 2 aktive Hotbars à 10 Felder = maximal 20 aktive Fähigkeiten gleichzeitig verfügbar. Das begrenzt bewusst, wie viele Fähigkeiten pro Klasse überhaupt sinnvoll sind – lieber wenige, gut ausbalancierte Fähigkeiten als eine wachsende Fähigkeitenflut.
- **Progression bevorzugt Skalierung bestehender Fähigkeiten** mit Levelanstieg (Schaden/Cooldown/Reichweite verbessern sich) statt ständig neue Fähigkeiten freizuschalten. Technisch: GAS-Modifier-Magnitude über eine Curve-Table, skaliert mit Charakterlevel – keine separate DataTable-Zeile pro Levelstufe.
- **Skill-Tree/Talente:** begrenzte Auswahlpunkte (Spieler wählt zwischen wenigen Spezialisierungs-Optionen bei bestimmten Levelstufen), kein sprawling Talentbaum. Eigene schlanke Talent-Tabelle: eine Zeile pro Wahlpunkt mit 2-3 Optionen, keine tiefe Verzweigung.
- **Crafting-UI:** separat und später (siehe Nicht-jetzt-Liste: Crafting) – entweder eigene Leiste oder direkt aus der Rezeptliste. Keine Festlegung jetzt nötig, nur als bekannter offener Punkt vermerkt.

## 2c. Positionsabhängiger Schaden (Rückenangriff)

Angriffe von hinten verursachen doppelten Schaden – als wiederverwendbare Mechanik, nicht nur für einzelne Fähigkeiten. Technisch: Winkel-Check zwischen der Blickrichtung des Ziels und der Position des Angreifers zum Aktivierungszeitpunkt (z. B. Angreifer innerhalb eines ~120°-Kegels hinter dem Ziel = Rückenangriff). **Serverseitig auswerten**, nicht clientseitig – sonst leicht manipulierbar. Nur der Schadensanteil verdoppelt sich, nicht Heilungsanteile bei Hybrid-Fähigkeiten.

## 2d. Tod & Respawn-Handling

**Grundsatz:** kein neuer eigener Code wo vermeidbar — vorhandene Engine-/Framework-Bausteine wiederverwenden statt selbst zu bauen (siehe CLAUDE.md, "Blueprint-first").

**Zu klären für den Third-Person-Template-Aufbau:** das Template bringt kein fertiges Tod/Respawn-System mit (anders als Lyra). AttributeSet mit `OnOutOfHealth`-artigem Delegate, Death-Ability und Respawn-Timing/Spawnpunkt-Logik müssen manuell auf Basis des selbst gebauten GAS-Grundgerüsts entstehen (siehe README "Architekturwechsel"). Frühere, Lyra-spezifische Implementierungsdetails und Testergebnisse: [Archive.md](Archive.md) — als Referenz, welche Fallstricke (z. B. Ziel-Findung bei Respawn, `RespawnDelaySeconds`-Instanz-Default-Falle) generisch wiederkehren können.

**Bewusst nicht jetzt:** Fraktions-Spawnpunkte, Respawn-Wellen/-Timer-UI, Tod-Statistiken/Killfeed – das ist Battleground-Scope (Task #8), hier geht es nur um funktionierendes Tod/Respawn am aktuellen Testcharakter.

## Referenzimplementierungen (Lyra-Ära, archiviert)

Die früheren Kampfsystem-Prototypen (Ritter-Prototyp vor Lyra, `BP_TestKnight` auf Lyra-Basis, `BP_Paladin` als Lyra-Experience inkl. der Animation-Diagnose, die zum Architekturwechsel führte) sind nach [Archive.md](Archive.md) ausgelagert — nicht mehr direkt anwendbar, da Lyra-spezifisch, aber als Referenz für generische GAS-Lehren (Set-by-Caller-Muster, Rückenangriff-Winkel-Check, Timing-Fallstricke bei BeginPlay vs. Possession) nützlich.

## 3. Quests (Datenschema-Vorschlag)

Analog zum Fähigkeiten-Schema in Abschnitt 2: eine Quest anzulegen soll "neue DataTable-Zeile" heißen, kein neuer Code. Der eigentliche Quest-**Inhalt** (Texte, Story, Umsetzungsstand) lebt in [Docs/Design/Quests.md](Docs/Design/Quests.md) – hier nur das technische Schema, nach dem er später ins Spiel eingepflegt wird.

**DataTable-Schema-Vorschlag** (eine Zeile = eine Quest):

| Spalte | Typ | Zweck |
|---|---|---|
| QuestID | Name | Eindeutiger Schlüssel (z. B. `AEQ-01`, siehe Quests.md-Konvention) |
| DisplayName | FText | Questtitel (lokalisiert) |
| Description | FText | Questlog-Beschreibung (lokalisiert) |
| GiverNPC | Objekt-Referenz | Welcher NPC-Blueprint vergibt die Quest |
| Objectives | Array\<FText\> | Zielschritte (lokalisiert) |
| PrerequisiteQuestID | Name | Ketten-Voraussetzung, leer = keine |
| RequiresGroup | bool | Solo vs. Gruppenpflicht (siehe Albion-Epic-Questline-Stufen mit Gruppenzwang) |
| MinLevel | int | Level-Empfehlung |
| RewardID | Objekt-Referenz | Platzhalter-Referenz, bis ein echtes Itemization-System existiert (Nicht-jetzt-Liste) |
| DialogueOpening / DialogueClosing | FText | Dialogzeilen (lokalisiert) |

**Bewusst noch nicht entschieden:** ob Dialogzeilen direkt in der Quest-DataTable liegen oder in einer separaten Dialogue-Tabelle (bei mehrzeiligen Dialogen mit Verzweigungen sinnvoller) – relevant erst, wenn die ersten Quests aus Quests.md tatsächlich implementiert werden.

**Status:** reines Schema, noch keine Implementierung – kein Quest-System (DataTable, Dialog-UI, Objective-Tracking) existiert bisher im Projekt. Das ist selbst der wichtigste offene Punkt, bevor einzelne Quests aus Quests.md ins Spiel wandern können.

## 4. GUI (HUD)

**Architekturprinzip:** UMG-Widgets binden sich an GAS-Attribute-Delegates (`OnAttributeChanged`), statt den Wert jeden Tick abzufragen – performanter und passt zum Performance-Grundsatz aus der README. MVVM-Pattern (Model-View-ViewModel, in UE5 nativ über UMG Viewmodels unterstützt) entkoppelt UI-Widgets von der Gameplay-Logik – wichtig, damit später der Art-Stil-Wechsel (Platzhalter → finale Art) die UI nicht mit umbauen muss.

**Minimale HUD-Elemente für den Vertical Slice** (Battleground, Task #8):
- Health-/Resource-Balken (eigener Charakter)
- Fähigkeiten-Leiste: 2 Hotbars à 10 Felder, Cooldown-Anzeige liest Icon/Cooldown direkt aus der Ability-DataTable (keine hartcodierte UI pro Fähigkeit)
- Ziel-Anzeige (Health des anvisierten Gegners)
- Fraktions-/Team-Kennzeichnung
- RvR-Ziel-Status (Flaggenpunkt-Fortschritt)

Bewusst **nicht** jetzt: Inventar-UI, Charakterbogen, Crafting-UI – folgt der Nicht-jetzt-Liste.

## Status

🟡 Design-Referenz, noch keine Implementierung. Konkretisierung bei Umsetzung von Task #6 (erste Fähigkeit) und #9 (Toon-Artstyle/UI-Look).
