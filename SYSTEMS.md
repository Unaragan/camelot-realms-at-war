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

## 3. GUI (HUD)

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
