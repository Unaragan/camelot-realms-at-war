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

## 2d. Bekannte Einschränkung: reines Blueprint-Projekt (kein C++-Modul)

Das Projekt läuft aktuell als reines Blueprint-Projekt ohne eigenes C++-Modul – abweichend vom Tech-Stack-Grundsatz "C++ für Kernsysteme" in der README/CLAUDE.md. Praktische Konsequenz: **`InitAbilityActorInfo` ist in reinen Blueprint-Projekten nicht aufrufbar** (nicht BlueprintCallable in dieser Engine-Version ohne C++-Modul).

**Funktionierender Workaround** (verifiziert per PIE-Test): Ziel-/Eigentümer-Actor über `GetOuterObject → CastToActor` ermitteln statt über `GetAvatarActorFromActorInfo`. Funktioniert einwandfrei mit `TryActivateAbilityByClass`.

**Zu entscheiden, sobald mehr Klassen dazukommen (Task #7):** entweder weiter mit diesem Blueprint-Workaround arbeiten, oder an dem Punkt ein C++-Modul einführen für sauberere GAS-Integration. Keine Eile – der Workaround funktioniert nachweislich.

## Referenzimplementierung v2: Ritter-Prototyp auf Lyra-Basis (2026-07-21)

Neuaufbau des Kampfsystem-Prototyps nach dem Umstieg auf Lyra – konsequent als Blueprint-Unterklassen von Lyras bestehenden C++-Klassen, kein neuer C++-Code (siehe CLAUDE.md, "Blueprint-first"). Unter `/Game/Characters/TestKnights/`:

- **`BP_TestKnight`** – eigenständige GAS-Testcharakter-Basis, Unterklasse mit fertigem `LyraAbilitySystemComponent`, `LyraHealthSet`, `LyraCombatSet` (Lyras eigene Attribute-Set-Klassen, kein eigenes Set von Grund auf). BeginPlay (serverseitig): setzt Health/MaxHealth auf 250, gewährt beide Angriffs-Fähigkeiten, findet automatisch den jeweils anderen platzierten Ritter als Ziel.
- **`GA_TestKnight_MeleeBase`** – gemeinsame Basis-Ability (Unterklasse von `LyraGameplayAbility`, ServerOnly) mit zwei wiederverwendbaren Funktionen: `ApplyMeleeAttack` (Schaden mit Winkel-Check) und `ApplyMeleeHeal` (Heilung, ohne Winkel-Bezug).
- **`GA_Attack1`/`GA_Attack2`** – Attack1 = 25 Schaden, Attack2 = 15 Schaden + 15 Selbstheilung.
- **Wichtiger Fund:** Beide nutzen Lyras **bereits vorhandene** modulare SetByCaller-GameplayEffects (`GE_Damage_Basic_SetByCaller`/`GE_Heal_SetByCaller`, basierend auf `LyraDamageExecution`/`LyraHealExecution`) – kein neuer Effekt nötig, Lyra bringt genau das Set-by-Caller-Muster aus Abschnitt 2 schon fertig mit.
- **`GE_Init_TestKnightHealth`** – nach Lyras eigenem Muster (MaxHealth-Override + Heal-Execution) für die 250-Health-Initialisierung.
- **Rücken-Check:** `Transformation|GetHorizontalDotProductTo` zwischen Ziel-Blickrichtung und Angreifer-Position, serverseitig via `HasAuthority` + ServerOnly-Ability; bei ≤ -0,5 (= 120°-Rückenkegel) verdoppelt sich nur der Schadensanteil, Heilung bleibt unverändert.

**PIE-Testergebnisse** (Level `/ShooterTests/Maps/L_ShooterTest_Basic`, zwei platzierte `BP_TestKnight`-Instanzen): Frontal exakt 25/15 Schaden pro Treffer, kein Multiplikator. Angreifer im 120°-Rückenkegel: Schaden verdoppelt (50/30), Heilung blieb unverändert bei 15. Deckt sich vollständig mit den Ergebnissen der ersten (verworfenen) Implementierung.

**Namensgebung bewusst neutral** ("TestKnight") – noch keine Umsetzung als konkrete CLASSES.md-Klasse (z. B. Paladin), das bleibt ein separater Schritt.

## Erste Referenzimplementierung (Ritter-Prototyp, verworfen — vor Lyra-Umstieg, nur zur Historie)

Erfolgreich umgesetzt und per PIE verifiziert (Stand 2026-07-19), unter `/Game/Knights/`:
- `BP_KnightAttributeSet` – Health/MaxHealth je 250
- `GE_MeleeDamageHeal` – ein wiederverwendbarer GameplayEffect mit zwei Set-by-Caller-Magnitudes ("Damage", "Healing") – genau das modulare Muster aus Abschnitt 2
- `BP_KnightAttackAbilityBase` (ServerOnly) mit serverseitigem 120°-Rücken-Winkel-Check per Dot-Product (siehe 2c)
- `GA_KnightAttack1` (25 Schaden), `GA_KnightAttack2` (15 Schaden + 15 Selbstheilung – Heilungsanteil verdoppelt sich bei Rückenangriff bewusst NICHT)
- `BP_Sword` (Platzhalter-Waffe, ChildActorComponent am hand_r-Socket), `BP_Knight` (Character mit ASC, Primitiv-Körper, Team-Farben)

Bestätigte Testresultate: Frontalangriff 1 = −25 HP, Frontalangriff 2 = Ziel −15 HP/Angreifer +15 HP, Rückenangriff 1 = −50 HP (verdoppelt), Rückenangriff 2 = Ziel −30 HP (verdoppelt) + Heilung weiterhin +15 HP (unverändert). Noch offen: Tod/Respawn-Handling, Netzwerk-Replikation über echte Client-Server-Verbindung (nicht nur Einzel-PIE) – siehe Task #5/#6.

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
