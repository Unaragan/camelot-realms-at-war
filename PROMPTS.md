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

## Beleuchtung bauen (schwarzer Spiel-Viewport)

> "Baue die Beleuchtung für das aktuelle Level ([Levelname])."

Nötig nach jedem neuen/geänderten Level, wenn Lumen deaktiviert ist (siehe CLAUDE.md) und der Play-Viewport schwarz bleibt.

## Copilot (Content-Generierung)

Für Text-/Dialog-Content, den Copilot direkt im Editor oder Chat erzeugt – siehe [README.md](README.md) → "Werkzeug-Aufteilung: Copilot vs. Claude". Claude Code hat keinen direkten Zugriff auf Copilot (kein MCP, IDE-Tippen ist ohnehin blockiert) – diese Prompts müssen manuell eingefügt werden.

### Beispiel-Questline Albion: Lord Ector → Burgvogt Kay (2026-07-21)

3-teilige Kette, Beispiel-Content passend zu den Quest-Hooks aus [NPC_NAMES.md](NPC_NAMES.md) → "Grundkonflikt-Vorschlag". Eskalation Diplomatie (Ector) → Mobilisierung (Kay), endet mit Übergang Richtung Grenze/Battleground. Ausgabe bewusst auf Englisch angefordert (FText-Quellsprache laut CLAUDE.md).

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

**Ergebnis (Copilot, 2026-07-21):**

> **Quest Title:** The Silent Frontier
>
> **Quest Description:** Several of Lord Ector's border scouts have failed to return from their patrols along the frontier. What first seemed like poor weather or delayed travel now feels far more troubling. Investigate the scouts' last known route and uncover any sign of what befell them.
>
> **Objectives:**
> 1. Travel to the frontier watch road and inspect the scouts' last reported camp.
> 2. Search the surrounding area for traces of the missing patrol.
> 3. Return your findings to Lord Ector.
>
> **Opening Dialogue (Lord Ector):**
> Our border scouts know these lands better than most men know their own hearths, yet several have vanished without word.
> At first I took it for bad weather or a broken supply train. Now I fear something else is at work.
> Ride to their last reported camp and see what can be learned.
> I would rather discover a simple answer than nurture darker suspicions.
>
> **Closing Dialogue (Lord Ector):**
> Tracks ending in open ground... abandoned gear... and no bodies found. That is a hard tale to weigh.
> The frontier has always been dangerous, yet this bears little resemblance to an ordinary ambush.
> If our scouts were taken, then by whom—and why leave so little behind?
> Stay vigilant. I suspect this matter is only beginning.

Trifft den gewünschten Ton gut (bedächtig, kein Bodyfund als billiger Cliffhanger, endet in offener Frage statt Auflösung) – passt direkt als Übergabe an Quest 2 (Beweis-Suche).

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

**Status:** Quest 1 per Copilot generiert und dokumentiert (2026-07-21), Quest 2/3 noch offen. Noch nicht ins Spiel/DataTable übernommen – relevant erst ab Startgebiet-Phase (siehe NPC_NAMES.md-Status).

## Status

🟡 Zuletzt erweitert 2026-07-21 (Copilot-Kategorie ergänzt) – wird bei Bedarf um weitere wiederverwendbare Muster ergänzt (z. B. Battleground-Grayboxing, Vegetation platzieren), nicht rückwirkend für jede Einzelanweisung.
