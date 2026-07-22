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

## 2d. Bekannte Einschränkung: reines Blueprint-Projekt (kein C++-Modul) — **historisch, überholt seit Lyra-Umstieg**

Galt für den ersten, verworfenen Prototyp (vor Lyra): das Projekt lief als reines Blueprint-Projekt ohne eigenes C++-Modul – abweichend vom Tech-Stack-Grundsatz "C++ für Kernsysteme" in der README/CLAUDE.md. Praktische Konsequenz war: `InitAbilityActorInfo` war nicht aufrufbar (nicht BlueprintCallable ohne C++-Modul). Workaround: Ziel-/Eigentümer-Actor über `GetOuterObject → CastToActor` statt `GetAvatarActorFromActorInfo`.

**Seit dem Lyra-Umstieg überholt:** Lyra selbst *ist* ein C++-Projekt (`Source/`-Ordner, `LyraGame`-Modul), die Einschränkung besteht nicht mehr. Die "Zu entscheiden, sobald mehr Klassen dazukommen"-Frage von hier ist damit ebenfalls beantwortet, siehe unten.

**Erste konkrete Nutzung der C++-Ausnahmeregel (2026-07-21):** `RealmTeamStatics` – ein schlanker Blueprint-Funktionsbibliotheks-Wrapper um `ULyraTeamSubsystem::ChangeTeamForActor`, nötig für die Albion-Team-/Farbzuweisung des Paladins, da diese Engine-Funktion nicht anders aus Blueprint erreichbar ist. Passt genau zur "Ausnahmefall, wenn in Blueprint wirklich nicht machbar"-Klausel in CLAUDE.md ("Blueprint-first"). Bestätigt: der Blueprint-first-Grundsatz bleibt die Regel, gelegentliche kleine C++-Wrapper um nicht-Blueprint-exponierte Lyra-Engine-Funktionen sind der vorgesehene Ausnahmefall, kein Kurswechsel.

**Wichtiger Fund dabei:** `ChangeTeamForActor` prüft selbst **keine** Authority (`LyraTeamSubsystem.cpp:134`) – der Header-Kommentar "Authority only" ist nur Dokumentation, nicht erzwungen. Beim Verdrahten in Blueprint (z. B. `AssignTeam(Actor, 0)` in `BeginPlay`) daher **zwingend ein `Switch Has Authority`-Node davorschalten**, sonst rufen auch Clients `SetGenericTeamId` lokal auf (Netzwerk-Desync). Relevant für jede künftige Klasse, die Team-Zuweisung braucht (Task #7: Midgard-Team für den Berserker).

## 2e. Tod & Respawn-Handling

**Grundsatz:** kein neuer eigener Code — Lyra liefert Tod/Respawn bereits vollständig fertig gebaut, nur verdrahten/konfigurieren (siehe CLAUDE.md, "Blueprint-first").

**Bereits vorhandene Lyra-Bausteine (wiederverwenden statt neu bauen):**
- `LyraHealthSet` hat ein `OnOutOfHealth`-Delegate, das feuert, sobald Health auf 0 fällt (unser `GE_Damage_Basic_SetByCaller` löst das automatisch mit aus, kein Zusatzcode nötig).
- `ULyraHealthComponent` (Actor-Component) hört auf dieses Delegate und orchestriert die komplette Tod-Sequenz: `StartDeath()` → State-Tag `Lyra.Death.Dying`, `FinishDeath()` → `Lyra.Death.Dead`, inkl. `OnDeathStarted`/`OnDeathFinished`-Delegates für Folgelogik (Ragdoll, Input/Kollision deaktivieren).
- `GA_Hero_Death` – vorgefertigte GameplayAbility, wird über den Death-State-Tag automatisch ausgelöst, übernimmt Ragdoll-Umschaltung und Deaktivierung.
- `ULyraPlayerSpawningManagerComponent` (auf dem GameState) – steuert Respawn-Timing und Spawnpunkt-Auswahl nach Pawn-Tod.

**Zu prüfen/verdrahten für `BP_TestKnight`:**
- Ob bereits eine `ULyraHealthComponent` vorhanden ist – die v2-Implementierung setzt Health/MaxHealth aktuell manuell in `BeginPlay` statt über Lyras reguläre PawnData-Pipeline, die Component muss ggf. nachträglich ergänzt werden.
- Respawn-Delay: Vorschlag 5 Sekunden (MMO-üblich), konfigurierbar.
- Respawn-Position für den reinen 2-Ritter-PIE-Test: an der ursprünglich platzierten Position, kein Team-/Fraktions-Spawnsystem nötig – das kommt erst mit der echten Battleground-Map (Task #8), die dann pro Fraktion eigene Spawnpunkte braucht.
- Reset beim Respawn: volle Health, keine übrig gebliebenen State-Tags/Cooldowns; prüfen ob die Ziel-Findungs-Logik aus `BeginPlay` beim Respawn erneut laufen muss (abhängig davon, ob Lyra den Pawn neu spawnt oder denselben Actor reaktiviert).

**Bewusst nicht jetzt:** Fraktions-Spawnpunkte, Respawn-Wellen/-Timer-UI, Tod-Statistiken/Killfeed – das ist Battleground-Scope (Task #8), hier geht es nur um funktionierendes Tod/Respawn am aktuellen Testcharakter.

**Ergebnis (2026-07-21, umgesetzt und per PIE verifiziert):**

- **HealthComponent bereits vorhanden, aber nie initialisiert:** `BP_TestKnight` erbt `ULyraHealthComponent` über `LyraCharacterWithAbilities → LyraCharacter` (dort als C++-Default-Subobject angelegt) – keine neue Komponente nötig. Wichtiger Fund: `ALyraCharacterWithAbilities` setzt das ASC direkt statt über den `PawnExtensionComponent` (Lyras normaler Initialisierungspfad, der `HealthComponent->InitializeWithAbilitySystem()` auslöst) – ohne diesen Aufruf bindet `OnOutOfHealth` nie, Tod würde nie ausgelöst. Behoben durch expliziten `InitializeWithAbilitySystem()`-Aufruf in `EventBeginPlay` plus Gewähren von `GA_Hero_Death` (identisches Muster wie bei echten Lyra-Helden – Ragdoll/State-Tags/Deaktivierung laufen danach automatisch über Lyras vorhandene Death-Ability).
- **Respawn-System** (in `BP_TestKnight`): `OriginalTransform` wird in `BeginPlay` gecacht, `RespawnDelaySeconds` ist instanz-editierbar (Default 5s). `OnDeathStarted` (HealthComponent-Delegate) stoppt den eigenen Auto-Attack-Timer und ruft `ScheduleRespawn` auf dem noch lebenden Gegner auf. Der Überlebende spawnt nach Ablauf des Timers eine **frische** `BP_TestKnight`-Instanz an der Original-Position (volle Health + frische Fähigkeiten/Tags, da komplett neue ASC-Instanz) – ein Reset des toten Akteurs selbst ist nicht möglich, da Lyras `OnDeathFinished` ihn ohnehin per `SetLifeSpan(0.1f)` zerstört.
- **Ziel-Findung beim Respawn:** musste manuell nachgezogen werden. Der frische Ritter sucht zwar in seinem eigenen `BeginPlay` selbst per `GetAllActorsOfClass` einen Gegner, konnte aber in einem kurzen Überlappungsfenster (Leiche noch nicht zerstört) die falsche, gleich darauf verschwindende Instanz erwischen. Fix: Der überlebende Ritter setzt nach dem Spawn explizit beide Seiten der Beziehung (`SetOpponentActor` auf sich selbst und auf den Neuling).
- **Gefundener/behobener Bug:** Beide platzierten Ritter hatten `RespawnDelaySeconds=0`, weil der Klassen-Default erst gesetzt wurde, nachdem sie schon in der Ebene platziert waren (UE friert einmal übernommene Werte pro Instanz ein) – Respawn-Timer löste nie aus. Direkt an beiden Instanzen auf 5.0 korrigiert.

**PIE-Testergebnis:** Vollständiges Duell bis zum Tod beobachtet – `GA_Hero_Death` aktiviert (Kamera-Modus, Death-GameplayCue, Verzögerung), Akteur wird zerstört, nach 5s spawnt ein neuer Ritter exakt an der Originalposition mit vollen 250 Health und frisch gewährten Fähigkeiten, der Überlebende kämpft nahtlos weiter gegen ihn.

**Bekannte Einschränkung:** Bei nahezu zeitgleichem beidseitigem Tod hängt jede Seite vom Überleben der anderen ab, um den Respawn zu planen – im Test kam das einmal vor und hat sich selbst korrigiert (eine Seite überlebte knapp), ein garantiert zeitgleicher Doppel-KO ist architekturell aber nicht abgesichert. Für dieses Test-Setup unkritisch, relevant erst bei echten Mehrspieler-Gefechten mit mehr als zwei Beteiligten – dann vermutlich ohnehin durch das noch zu bauende Battleground-Respawn-System (Fraktions-Spawnpunkte statt Gegner-referenziertes Scheduling) abgelöst.

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
