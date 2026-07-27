# Archiv: überholte Inhalte

Ausgelagert aus SYSTEMS.md/SETUP.md im Zuge des Architekturwechsels (2026-07-26/27, siehe README.md "Architekturwechsel" und CLAUDE.md). Enthält Lyra-spezifische Implementierungsdetails und C++/Lyra-Build-Stolperfallen, die mit dem Wechsel auf das Third Person Template + manuell nachgerüstetes GAS nicht mehr direkt anwendbar sind, aber als Referenz nützlich bleiben könnten (z. B. falls Teile des GAS-Musters 1:1 wiederverwendet werden, oder falls doch einmal wieder ein C++-Modul dazukommt).

**Nicht mehr aktualisieren** – neue Erkenntnisse gehören in SYSTEMS.md/SETUP.md, nicht hierher.

---

## Aus SYSTEMS.md

### 2d. Bekannte Einschränkung: reines Blueprint-Projekt (kein C++-Modul) — historisch, vor Lyra-Umstieg

Galt für den ersten, verworfenen Prototyp (vor Lyra): das Projekt lief als reines Blueprint-Projekt ohne eigenes C++-Modul. Praktische Konsequenz war: `InitAbilityActorInfo` war nicht aufrufbar (nicht BlueprintCallable ohne C++-Modul). Workaround: Ziel-/Eigentümer-Actor über `GetOuterObject → CastToActor` statt `GetAvatarActorFromActorInfo`.

Während der Lyra-Phase überholt (Lyra selbst war ein C++-Projekt). Mit dem Wechsel auf das Third Person Template (Blueprint-Variante, kein `Source/`-Ordner) ist das Projekt wieder ein reines Blueprint-Projekt — diese Einschränkung könnte also erneut relevant werden, falls `InitAbilityActorInfo` o. ä. gebraucht wird.

**Erste konkrete Nutzung der C++-Ausnahmeregel während der Lyra-Phase (2026-07-21):** `RealmTeamStatics` – ein schlanker Blueprint-Funktionsbibliotheks-Wrapper um `ULyraTeamSubsystem::ChangeTeamForActor`. Lyra-spezifisch, entfällt mit dem Wechsel.

### 2e. Tod & Respawn-Handling — Lyra-spezifische Implementierung

**Ursprünglicher Grundsatz (bleibt gültig, siehe SYSTEMS.md):** kein neuer eigener Code wo vermeidbar, vorhandene Engine-/Framework-Bausteine wiederverwenden.

**Lyra-spezifische Bausteine, die genutzt wurden (nicht mehr verfügbar nach dem Wechsel):**
- `LyraHealthSet` mit `OnOutOfHealth`-Delegate
- `ULyraHealthComponent` – orchestrierte die komplette Tod-Sequenz (`StartDeath()`/`FinishDeath()`, State-Tags `Lyra.Death.Dying`/`Lyra.Death.Dead`)
- `GA_Hero_Death` – vorgefertigte GameplayAbility für Ragdoll/Deaktivierung
- `ULyraPlayerSpawningManagerComponent` – Respawn-Timing/Spawnpunkt-Auswahl

**Ergebnis (2026-07-21, mit BP_TestKnight umgesetzt und per PIE verifiziert):**
- HealthComponent war über `LyraCharacterWithAbilities → LyraCharacter` bereits vorhanden, aber nie initialisiert (`ALyraCharacterWithAbilities` setzt das ASC direkt statt über den `PawnExtensionComponent`, wodurch `HealthComponent->InitializeWithAbilitySystem()` nie lief). Behoben durch expliziten Aufruf in `EventBeginPlay`.
- Respawn-System: `OriginalTransform` in `BeginPlay` gecacht, `RespawnDelaySeconds` instanz-editierbar (Default 5s), `OnDeathStarted` stoppt Auto-Attack-Timer und plant Respawn auf dem überlebenden Gegner. Frische Instanz spawnt nach Ablauf des Timers an der Original-Position.
- Ziel-Findung beim Respawn musste manuell nachgezogen werden (`SetOpponentActor` beidseitig setzen), da ein kurzes Überlappungsfenster (Leiche noch nicht zerstört) zur falschen Zielerfassung führte.
- Gefundener Bug: `RespawnDelaySeconds=0` bei beiden platzierten Instanzen, weil der Klassen-Default erst gesetzt wurde, nachdem sie schon platziert waren (UE friert übernommene Werte pro Instanz ein).

**PIE-Testergebnis:** vollständiges Duell bis zum Tod beobachtet, Respawn nach 5s mit voller Health und frisch gewährten Fähigkeiten funktionierte zuverlässig.

**Bekannte Einschränkung:** bei nahezu zeitgleichem beidseitigem Tod hängt jede Seite vom Überleben der anderen ab, um den Respawn zu planen — architekturell nicht abgesichert, aber für das damalige 2-Akteure-Testsetup unkritisch.

### Referenzimplementierung v2: Ritter-Prototyp auf Lyra-Basis (2026-07-21)

Unter `/Game/Characters/TestKnights/` (nicht mehr im Projekt vorhanden):
- **`BP_TestKnight`** – GAS-Testcharakter-Basis mit `LyraAbilitySystemComponent`, `LyraHealthSet`, `LyraCombatSet`. BeginPlay (serverseitig): Health/MaxHealth auf 250, gewährt beide Angriffs-Fähigkeiten, findet automatisch den anderen platzierten Ritter als Ziel.
- **`GA_TestKnight_MeleeBase`** – Basis-Ability (Unterklasse von `LyraGameplayAbility`, ServerOnly) mit `ApplyMeleeAttack` (Schaden + Winkel-Check) und `ApplyMeleeHeal` (Heilung).
- **`GA_Attack1`/`GA_Attack2`** – Attack1 = 25 Schaden, Attack2 = 15 Schaden + 15 Selbstheilung.
- Nutzten Lyras vorhandene modulare SetByCaller-GameplayEffects (`GE_Damage_Basic_SetByCaller`/`GE_Heal_SetByCaller`, basierend auf `LyraDamageExecution`/`LyraHealExecution`).
- Rücken-Check: `Transformation|GetHorizontalDotProductTo`, bei ≤ -0,5 (120°-Rückenkegel) verdoppelt sich nur der Schadensanteil.

**PIE-Testergebnisse** (Level `/ShooterTests/Maps/L_ShooterTest_Basic`): Frontal exakt 25/15 Schaden, im Rückenkegel verdoppelt (50/30), Heilung unverändert bei 15.

### Referenzimplementierung v3: Paladin als echte, spielbare Lyra-Experience (2026-07-22 bis 2026-07-24)

Umbenennung zu `BP_Paladin`, vollständige Einbindung ins Lyra-Experience-System. Unter `/Game/Characters/Paladin/`, Level `/Game/Maps/L_PaladinTest`, Experience `B_Experience_PaladinTest` (alles nicht mehr im Projekt vorhanden).

- **Eigene Experience/PawnData-Kette:** `PawnData_Paladin`, `AbilitySet_Paladin`, `InputData_Paladin`. Zwei Content-Validierungsfehler gefunden: `AbilitySet_Paladin` referenzierte illegal `/ShooterCore/Game/Respawn/GA_SpawnEffect`, `InputData_Paladin` illegal `/ShooterCore/Input/Actions/IA_Melee` – Lyra erlaubt projekteigenem Content keine Querverweise auf GameFeature-Plugin-Content. Ersetzt durch eigene `GA_Paladin_SpawnEffect`/`IA_Paladin_Strike` plus eigenen `IMC_Paladin`.
- **ShooterCore-Plugin-Familie komplett deaktiviert** (`ShooterCore`, `ShooterMaps`, `TopDownArena`, `ShooterExplorer`, `ShooterTests`) – das alte Testlevel `L_ShooterTest_Basic` gehörte zu `ShooterTests` und brachte eine fremde Default-Experience mit.
- **Wichtiger Fund – doppelte GAS-Initialisierung zwischen Duell-Dummy und Spieler-Pawn:** `BP_Paladin`s `BeginPlay` hatte eigene manuelle Init-Logik für die Duell-Dummies, kollidierte mit Lyras automatischer Initialisierung des tatsächlich besessenen Spieler-Pawns über `AbilitySet_Paladin` + `HeroComponent` (Fehler: "Health component ... has already been initialized with an ability system").
  - Naheliegender, aber fehlerhafter erster Versuch: manuelle Logik mit `IsPlayerControlled()` gaten — funktionierte nicht zuverlässig, da Possession bei `BeginPlay` noch nicht abgeschlossen ist.
  - Funktionierender Fix: `DelayUntilNextTick` vor den `IsPlayerControlled()`-Check.
- **Mesh/Animation:** Lyras Standard-Mannequin-Mesh plus `ABP_Mannequin_Base` zugewiesen. **Funktionierte am Ende nicht** (siehe Nachtrag unten und Issue #14) – letztlich einer der Hauptauslöser für den Architekturwechsel.

#### Nachtrag (2026-07-26): Eingefrorene Animation — Diagnose bei `ABP_Mannequin_Base`

Live per MCP diagnostiziert (Symptom: alle Paladin-Instanzen im Standalone-PIE-Fenster in identischer, eingefrorener Referenzpose). Ausführliche Analyse in [GitHub Issue #14](https://github.com/Unaragan/camelot-realms-at-war/issues/14) (mittlerweile geschlossen, überholt durch Architekturwechsel).

- **Diagnostizierte Ursache:** `ABP_Mannequin_Base`s Locomotion-States liefern ihre Pose über `LinkedAnimLayer`-Nodes (Interface `ALI_ItemAnimLayers`), gedacht für ein Waffen-Equip-System (ShooterCore, deaktiviert), das zur Laufzeit per `LinkAnimClassLayers()` verlinkt. Ohne dieses System war `instanceClass` auf allen Nodes `None`, Fallback auf eine komplett leere Selbstimplementierung. Zusätzlich hartcodierte `BS_MM_Rifle_Jog_Leans`-Blend-Space in `Start`/`Cycle`/`Pivot`.
- **Versuchter Fix:** `instanceClass` aller 10 `LinkedAnimLayer`-Nodes auf `ABP_UnarmedAnimLayers` gesetzt, Blend-Space auf `BS_MM_Unarmed_Jog_Walk` umgebogen. Zunächst als "verifiziert" gemeldet (Motion-Blur-Screenshot), hielt aber **nicht** stand: mehrere direkte Nutzer-Tests zeigten weiterhin komplett eingefrorene oder rein gleitende Bewegung ohne Animation.
- **Letztendliche Einschätzung:** Lyras Experience-/PawnData-/LinkedAnimLayer-System ist über MCP-Property-/Log-Checks strukturell schwer zuverlässig zu verifizieren (verteilte Laufzeit-Verdrahtung statt direkt inspizierbarer Zustände) – das war der ausschlaggebende Grund für den Architekturwechsel auf das Third Person Template.
- **Nahkampf-Animation für `GA_Paladin_Strike`:** `AN_Melee` war nur ein `AnimNotify`-Marker, keine Animation. Als Platzhalter wurde `AM_MM_Rifle_Melee` (Gewehrkolben-Schwung) per `PlayMontageAndWait` eingebaut — grober Platzhalter, hinfällig mit dem Wechsel.

### Erste Referenzimplementierung (Ritter-Prototyp, verworfen — vor Lyra-Umstieg)

Erfolgreich umgesetzt und per PIE verifiziert (Stand 2026-07-19), unter `/Game/Knights/` (nicht mehr im Projekt vorhanden):
- `BP_KnightAttributeSet` – Health/MaxHealth je 250
- `GE_MeleeDamageHeal` – wiederverwendbarer GameplayEffect mit zwei Set-by-Caller-Magnitudes ("Damage", "Healing")
- `BP_KnightAttackAbilityBase` (ServerOnly) mit serverseitigem 120°-Rücken-Winkel-Check per Dot-Product
- `GA_KnightAttack1` (25 Schaden), `GA_KnightAttack2` (15 Schaden + 15 Selbstheilung, Heilungsanteil verdoppelt sich bei Rückenangriff bewusst NICHT)
- `BP_Sword` (Platzhalter-Waffe, ChildActorComponent am hand_r-Socket), `BP_Knight` (Character mit ASC, Primitiv-Körper, Team-Farben)

Bestätigte Testresultate: Frontalangriff 1 = −25 HP, Frontalangriff 2 = Ziel −15 HP/Angreifer +15 HP, Rückenangriff 1 = −50 HP (verdoppelt), Rückenangriff 2 = Ziel −30 HP (verdoppelt) + Heilung weiterhin +15 HP (unverändert).

---

## Aus SETUP.md

### Lyra-C++-Build-Stolperfallen (entfallen mit Third-Person-Template, reines Blueprint-Projekt)

| Fehler | Ursache | Lösung |
|---|---|---|
| `error CS0579: Doppeltes Attribut "AssemblyTitleAttribute"/"AssemblyVersionAttribute"` in `Lyra.Automation.AssemblyInfo.cs` beim AutomationTool-Build | Stale generierter .NET-Build-Cache unter `Build/Scripts/obj/` (entsteht v. a. nach Projekt-Verschiebungen) | `Build/Scripts/obj/`, `Build/Scripts/bin/` und `Build/Scripts/uatobj/` löschen (reine generierte Caches), danach Build erneut anstoßen |
| Live Coding: `Could not spawn process ...UnrealBuildAccelerator/x64/UbaCli.exe. Error: 267` bei jedem Modul, "Failed to link patch (0.000s)" | Der Live-Coding-Hot-Patch-Schritt scheiterte konsequent an diesem UBA-Hilfsprogramm (auch mit AV komplett deaktiviert). Der eigentliche Compile/Link-Schritt selbst war davon nicht betroffen | Live Coding deaktivieren (Editor Preferences → General → Live Coding), nach C++-Änderungen Editor komplett schließen/neu starten |

### Alter Projektname/Pfad

Projekt hieß zu Lyra-Zeiten `Camelot_RAW.uproject`, davor kurzzeitig eine zweite Kopie unter `Documents\Unreal Projects\CamelotRAW` (Ursache für "Assets fehlen im Git"-Verwirrung). Aktueller Name/Pfad: `D:\Claude\camelot-realms-at-war\CamelotRAW_TP.uproject`, siehe SETUP.md.
