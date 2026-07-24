# Prompt-Vorlagen

Wiederverwendbare Prompts – zwei Kategorien: **Terminal-Claude-Code** (MCP-verbunden mit dem Unreal Editor, für Editor-Aktionen) und **Copilot** (Content-Generierung wie Quest-/Dialogtexte, kein Editor-Zugriff nötig). Nicht jede Kleinanweisung – nur Muster, die wiederholt gebraucht werden, damit sie nicht bei jeder Nutzung neu erfunden werden müssen.

## Terminal-Claude-Code (Unreal-MCP)

## Kampf-Charakter mit GAS-Fähigkeiten (Lyra-Basis)

Verwendet für: erste Ritter-Testcharaktere (POC, verworfen), Neuaufbau nach Lyra-Umstieg (Task #6), Vorlage für Task #7 (weitere Klassen).

> "Wir bauen auf der Lyra-Basis. Erstelle zwei kämpfende [Rollen]-Testcharaktere als Blueprint-Unterklassen von Lyras bestehenden GAS-/Charakter-Klassen (kein neuer C++-Code) – nutze wo möglich Lyras vorhandenes Ability-System-Framework statt eigener Attribute-Sets von Grund auf. Je [X] Health. Zwei Fähigkeiten: Angriff 1 fügt dem Ziel [X] Schaden zu; Angriff 2 fügt [X] Schaden zu und heilt den Angreifer um [X] Punkte. Beide nutzen einen modularen, wiederverwendbaren GameplayEffect mit Set-by-Caller-Magnitude statt eigener Effekte pro Fähigkeit. Zusätzlich: serverseitiger Winkel-Check zwischen Blickrichtung des Ziels und Position des Angreifers – liegt der Angreifer innerhalb eines ca. 120°-Kegels hinter dem Ziel, wird nur der Schadensanteil verdoppelt (Heilung bleibt unverändert). Platziere beide [Rollen] so, dass sie sich gegenseitig angreifen können, und teste per PIE."

**Anpassbare Platzhalter:** `[Rollen]` (z. B. Ritter/Paladin/Berserker aus CLASSES.md), `[X]` Health/Schaden/Heilung-Werte aus SYSTEMS.md.

## Tod & Respawn (Lyra-Basis)

Verwendet für: Task #6, Tod/Respawn-Handling für die TestKnight-Charaktere. Design-Hintergrund: [SYSTEMS.md](SYSTEMS.md) → "2e. Tod & Respawn-Handling".

> "Prüfe zuerst, ob `BP_TestKnight` bereits eine `ULyraHealthComponent` besitzt. Falls nicht, ergänze sie – Lyras `LyraHealthSet` löst bereits ein `OnOutOfHealth`-Delegate aus, sobald Health auf 0 fällt, das übernimmt die komplette Tod-Sequenz (State-Tags, `GA_Hero_Death`-Ability für Ragdoll/Deaktivierung) automatisch, kein neuer Code nötig. Richte danach Respawn ein: [X] Sekunden Verzögerung nach dem Tod, Respawn an der ursprünglich platzierten Position (kein Team-Spawnsystem, das kommt erst mit der Battleground-Map), volle Health, keine übrig gebliebenen State-Tags/Cooldowns. Prüfe, ob die Gegner-Ziel-Findung aus `BeginPlay` beim Respawn erneut ausgelöst werden muss. Teste per PIE: Ritter im Duell bis zum Tod kämpfen lassen, Tod-Sequenz (Ragdoll/Deaktivierung) und Respawn nach Ablauf des Timers beobachten."

**Anpassbare Platzhalter:** `[X]` Respawn-Delay in Sekunden (Vorschlag: 5).

## Umbenennung TestKnight → Paladin (Task #6 Abschluss)

Verwendet für: Task #6 finalisieren. Mapping-Tabelle: [CLASSES.md](CLASSES.md) → "TestKnight → Paladin: Umbenennungs-Mapping".

> "Benenne die TestKnight-Prototyp-Assets unter `/Game/Characters/TestKnights/` gemäß Mapping-Tabelle in CLASSES.md zur finalen Paladin-Klasse um: `BP_TestKnight` → `BP_Paladin`, `GA_TestKnight_MeleeBase` → `GA_Paladin_MeleeBase`, `GA_Attack1` → `GA_Paladin_Strike`, `GA_Attack2` → `GA_Paladin_LayOnHands`, `GE_Init_TestKnightHealth` → `GE_Init_PaladinHealth`. Verschiebe die Assets nach `/Game/Characters/Paladin/`. Werte (250 Health, 25/15 Schaden) unverändert lassen – reine Umbenennung, keine Balance-Änderung. Weise beiden platzierten Instanzen zusätzlich Albion als Team über Lyras vorhandenes Team-System zu (Team-Farbe sichtbar). Prüfe nach der Umbenennung alle internen Referenzen (Blueprint-Reparent, Asset-Referenzen in BeginPlay/Grant-Ability-Logik) und teste per PIE erneut das komplette Duell inkl. Tod/Respawn, um sicherzustellen, dass nichts durch die Umbenennung gebrochen ist."

## Startup-Map setzen (statt Lyras Standard-Frontend) — historisch, gelöst seit ShooterCore-Deaktivierung

**Status (2026-07-22): erledigt.** Seit die ShooterCore-Plugin-Familie komplett deaktiviert wurde (siehe SETUP.md) und `/Game/Maps/L_PaladinTest` als eigenes Testlevel existiert, zeigen `GameDefaultMap`/`EditorStartupMap` in `Config/DefaultEngine.ini` korrekt darauf. Dieser Prompt bleibt nur als Referenz für das damalige Symptom/die Lösung stehen.

Verwendet für (historisch): Play startete standardmäßig Lyras eigenes Frontend/Default-Game statt unserer Testkarte.

> "The editor is opening Lyra's default showcase hub level (L_DefaultEditorOverview) on startup instead of our test level. Fix both settings: (1) Project Settings → Maps & Modes → set 'Editor Startup Map' and 'Game Default Map' to `/ShooterTests/Maps/L_ShooterTest_Basic`. (2) Editor Preferences → General → Loading & Saving → 'Load Level at Startup' → set to 'Editor Startup Map' (not 'Last Opened Level' or similar) so it actually respects setting (1). Confirm by fully closing and reopening the editor — it should open directly into `L_ShooterTest_Basic` with both Paladin instances, not the Lyra showcase hub."

**Hinweis:** `[Levelpfad]` ggf. anpassen, falls ein anderer Testlevel als `L_ShooterTest_Basic` aktuell in Benutzung ist (siehe SYSTEMS.md → Referenzimplementierung). Beide Einstellungen (Project Settings *und* Editor Preferences) sind nötig — Erkenntnis vom 2026-07-22: Project Settings allein reichte nicht, Lyras eigene "Default Editor Overview"-Hub-Map öffnete sich trotzdem, mit einem eingeblendeten Hinweis im Level selbst auf genau diese zwei Stellen.

## Albion-Team + Farbe zuweisen (Task #6 Abschluss)

Verwendet für: letzter offener Punkt aus der TestKnight→Paladin-Umbenennung. Voraussetzung: `RealmTeamStatics` (C++-Wrapper um `ULyraTeamSubsystem::ChangeTeamForActor`) ist kompiliert, siehe [SYSTEMS.md](SYSTEMS.md) → Abschnitt 2d.

> "Verdrahte die Albion-Team-Zuweisung in `BP_Paladin`s `BeginPlay`: nach einem `Switch Has Authority`-Node ausschließlich im Authority-Zweig `AssignTeam(Actor=Self, TeamId=0)` aus `RealmTeamStatics` aufrufen — zwingend, da `ChangeTeamForActor` selbst keine Authority prüft, sonst würden auch Clients `SetGenericTeamId` lokal aufrufen. Danach eine einfache sichtbare Material-Einfärbung für Team 0/Albion ergänzen (Karminrot laut README-Fraktionsfarben) — per dynamischer Material-Instance, ausgelöst entweder über `OnTeamIndexChangedDelegate` oder direkt im Anschluss an den `AssignTeam`-Aufruf. Teste per PIE: Team-Zugehörigkeit ist sichtbar (Farbe bzw. Print-Ausgabe), und bestätige, dass der Aufruf nur serverseitig passiert."

## Beleuchtung bauen (schwarzer Spiel-Viewport)

> "Baue die Beleuchtung für das aktuelle Level ([Levelname])."

Nötig nach jedem neuen/geänderten Level, wenn Lumen deaktiviert ist (siehe CLAUDE.md) und der Play-Viewport schwarz bleibt.

## Copilot (Content-Generierung)

Für Text-/Dialog-Content, den Copilot direkt im Editor oder Chat erzeugt – siehe [README.md](README.md) → "Werkzeug-Aufteilung: Copilot vs. Claude". Claude Code hat keinen direkten Zugriff auf Copilot (kein MCP, IDE-Tippen ist ohnehin blockiert) – diese Prompts müssen manuell eingefügt werden.

**Wichtig:** Diese Datei enthält nur die **Anfrage-Vorlagen** (Prompts), nicht die generierten Ergebnisse. Fertiger Quest-Content plus Umsetzungsstand im Spiel lebt in [Docs/Design/Quests.md](Docs/Design/Quests.md) – dort auch der Master-Index aller Quest-IDs (AEQ, FNQ).

### Beispiel-Questline Albion: Lord Ector → Burgvogt Kay (AEQ-01 bis AEQ-03, 2026-07-21)

3-teilige Kette, Beispiel-Content passend zu den Quest-Hooks aus [NPC_NAMES.md](NPC_NAMES.md) → "Grundkonflikt-Vorschlag". Eskalation Diplomatie (Ector) → Mobilisierung (Kay), endet mit Übergang Richtung Grenze/Battleground. Ausgabe bewusst auf Englisch angefordert (FText-Quellsprache laut CLAUDE.md). Ergebnisse: siehe [Quests.md](Docs/Design/Quests.md) → AEQ-01/02/03.

**Quest 1 – Vermisste Grenzkundschafter:**

> "You are writing content for 'Camelot: Realms at War', a toon-styled 3-faction RvR fantasy game (spiritual successor to Dark Age of Camelot, but with no DAOC-specific names/lore reused — only generic medieval-English/Arthurian-inspired flavor). Write the FIRST quest of a 3-part questline for the Albion faction, given by the castle lord 'Lord Ector' (dutiful, patient, traditionalist, protective of his people).
>
> Quest premise: several border scouts near the frontier with the rival realms have gone missing; Ector asks the player to investigate.
>
> Please generate, in English (the game's source language for localization):
> - Quest title
> - 2-3 sentence quest description (as shown in a quest log)
> - 3 short objective steps
> - Opening dialogue from Ector when offering the quest (3-4 lines)
> - Closing dialogue from Ector when the player returns with partial findings (3-4 lines), ending on a note of ambiguous unease rather than resolution — this quest is not the outcome, it's the entry point to a longer 3-part questline.
>
> Keep the tone grounded/medieval, not high-fantasy melodrama. No mention of Dark Age of Camelot or DAOC-specific proper nouns."

**Quest 2 – Beweise für einen gezielten Übergriff:**

> "Continuing the same questline for 'Camelot: Realms at War' (Albion faction, Lord Ector as quest giver, toon-styled 3-faction RvR fantasy game, generic medieval-English/Arthurian flavor, no DAOC-specific names). Write the SECOND quest of the 3-part chain, following directly from a quest where the player investigated missing border scouts.
>
> Quest premise: while searching, the player found physical evidence suggesting the scouts' disappearance was not an accident but a deliberate incursion by a rival realm (generic signs — a broken banner, foreign tracks, a discarded weapon of foreign make; keep the responsible realm a to-be-revealed mystery for now, don't lock in Midgard or Hibernia specifics yet). The player must bring this evidence back to Lord Ector, who grows concerned and decides the matter needs his military commander's attention.
>
> Please generate, in English:
> - Quest title
> - 2-3 sentence quest description
> - 3 short objective steps (e.g., gather/confirm evidence, return to Ector, be sent onward)
> - Dialogue from Ector reacting to the evidence (4-5 lines, shift from calm to genuine concern)
> - A short closing line where Ector says he's sending the player to his military commander, 'Burgvogt Kay', to decide next steps — this is the handoff into quest 3."

**Quest 3 – Mobilisierung / Grenzpatrouille:**

> "Continuing the same questline for 'Camelot: Realms at War' (Albion faction, toon-styled 3-faction RvR fantasy game, generic medieval-English/Arthurian flavor, no DAOC-specific names). Write the THIRD and final quest of the 3-part chain. The quest giver is now 'Burgvogt Kay', Albion's military commander — more impatient and action-oriented than Lord Ector, eager to respond decisively.
>
> Quest premise: with Ector's evidence in hand, Kay is done waiting — he wants to test the player's combat readiness and then send them out on Albion's first real patrol to the frontier, directly leading into the game's frontier/battleground content.
>
> Please generate, in English:
> - Quest title
> - 2-3 sentence quest description
> - 3 short objective steps (e.g., defeat a few training opponents to prove readiness, then join a border patrol)
> - Dialogue from Kay offering the quest (blunt, impatient, 3-4 lines)
> - A closing line from Kay right before the player heads to the frontier/battleground, giving the moment a sense of stakes rising — this line should work as a narrative bridge into actual RvR combat content."

## Status

🟡 Zuletzt erweitert 2026-07-21 (Copilot-Kategorie ergänzt) – wird bei Bedarf um weitere wiederverwendbare Muster ergänzt (z. B. Battleground-Grayboxing, Vegetation platzieren), nicht rückwirkend für jede Einzelanweisung.
