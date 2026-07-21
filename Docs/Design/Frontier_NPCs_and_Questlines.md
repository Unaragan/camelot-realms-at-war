# Frontier-NPCs & Questline-Backlog (Design-Vorlage)

> **Einordnung:** wie [OpenWorld_Frontier_3Realms_Vision.md](OpenWorld_Frontier_3Realms_Vision.md), zu dem dieses Dokument gehört — Vorausplanung für die spätere Open-World-Frontier-/Startgebiet-Phase, **kein** Ersatz oder Vorgriff auf den aktuellen Battleground-Vertical-Slice. Zweck: Content-Backlog, der sich unabhängig vom Editor abarbeiten lässt (z. B. während Build-/Compile-Wartezeiten) — Copilot-Prompts vorbereiten und Ergebnisse hier sammeln, siehe [PROMPTS.md](../../PROMPTS.md) für das etablierte Muster.

## 1. Eroberungspunkt-Typen (Grundlage: BG-Referenzbilder)

Aus den vier Moodboards in [References/](References/) und der Typisierung in der Vision-Datei (Abschnitt "Layout-Verfeinerung v2"):

| Typ | Beleg im Bildmaterial | Regionaler Bonus bei Eroberung |
|---|---|---|
| **Wachturm** | "Guard Tower"/"Watch Tower"-Beschriftungen (Albion/Midgard) im ersten Moodboard | Sichtlinie/Rally-Punkt |
| **Dorf/Versorgungslager** | "Supply Village" (Albion), "Forge Camp" (Hibernia) im ersten Moodboard | Versorgung/Nachschub |
| **Mine** | aus der Vision-Datei übernommener Punkttyp, im Bildmaterial noch nicht separat beschriftet | Ressourcen |
| **Schrein/Hain** | bewaldeter Hügel mit Feuerstellen nahe Hibernia im ersten Moodboard, passt zu "Dolmen/mystische Wälder"-Reichsidentität | Buff |
| **Belagerungslager (neutral, bannerlos)** | in Lvl-30- und Lvl-50-Bild durchgängig ein zusätzliches, **unbeschriftetes** Lager ohne Fraktionsbanner neben den drei Reichslagern | siehe Abschnitt 3 — kein regionaler Realm-Bonus, sondern Zentralburg-Wirkung |

Die drei Level-gestaffelten Karten (Lvl 20/30/50) zeigen dieselbe Grundstruktur in wachsender Komplexität — Lvl 20 nur die drei Reichslager + ein einfaches Zentralziel, Lvl 30 zusätzlich das neutrale Lager, Lvl 50 mehrere kleinere Zwischenlager verteilt entlang der Anfahrtswege. Für den NPC-Bedarf reicht die Betrachtung der Punkttypen selbst, unabhängig davon, wie viele Kopien pro Karte existieren.

## 2. NPCs pro Punkt-Typ

Zwei konkrete Punkte pro Reich (passend zur jeweiligen Biom-/Charakteridentität aus der Vision-Datei), plus der eine neutrale Belagerungslager-Punkt. Namen aus den **generischen** Pools in [NPC_NAMES.md](../../NPC_NAMES.md) — bewusst *nicht* aus dem für die Reichsführung reservierten Mythologie-Pool (Ector/Kay, Skadi/Vidar, Aengus/Aoife bleiben unangetastet).

### Albion (Ritterburgen, offene Felder, Nebel)

| Punkt | Titel + Name | Charakter |
|---|---|---|
| Wachturm | Wachhauptmann Baldwin | Stoisch, diszipliniert, meldet jede Bewegung im Nebel pflichtbewusst weiter |
| Dorf/Versorgungslager | Vorsteherin Eleanor | Pragmatische Quartiermeisterin, hält die Nachschublinie zur Grenze am Laufen |

### Midgard (Fjorde, Schnee, Felsklippen)

| Punkt | Titel + Name | Charakter |
|---|---|---|
| Wachturm | Wachhauptmann Gunnar | Direkt, ehrbewusst, sieht den Wachdienst selbst als Bewährungsprobe |
| Mine | Minenaufseher Ulf | Grob, misstrauisch, wacht eifersüchtig über das Erz, das den Krieg finanziert |

### Hibernia (Eichen, Dolmen, mystische Wälder)

| Punkt | Titel + Name | Charakter |
|---|---|---|
| Schrein/Hain | Schreinhüterin Niav | Mystisch, spricht in Naturmetaphern, hütet dieselben Wardsteine, um die sich Rí Aengus sorgt (siehe NPC_NAMES.md) |
| Dorf/Schmiedelager | Vorsteher Cormac | Bodenständiger Schmied, rüstet Hibernias Scharmützler mit dem aus, was der Grenzwald hergibt |

### Neutral

| Punkt | Titel + Name | Charakter |
|---|---|---|
| Belagerungslager (bannerlos) | *Der namenlose Lagerhauptmann* | Bewusst unbenannt/anonym — passend zum bannerlosen Lager im Bildmaterial. Söldnerführer ohne erkennbare Reichstreue, hilft (oder schadet), wem gerade nützt |

## 3. Zentralburg-Schwächung vs. regionale Boni (Mechanik-Zuordnung)

Zwei getrennte Mechanik-Spuren, um die offene Frage aus der Vision-Datei ("Neutrale Zusatzpunkte") konkret zu verankern:

- **Regionale Punkte (Wachturm/Dorf/Mine/Schrein):** Eroberung gibt dem erobernden Reich einen lokalen Vorteil auf dem Weg zur Zentralburg (Sichtlinie, Versorgung, Ressourcen, Buff — siehe Tabelle oben). Wirkt nur für das erobernde Reich, hat keinen Effekt auf die Burg selbst.
- **Neutrales Belagerungslager:** einziger Punkt mit Wirkung auf die Zentralburg selbst — genau der in der Vision-Datei offen gelassene Doppel-Effekt:
  - **Schwächung:** reduzierte Mauer-/Tor-HP, kürzere Zwinger-Verteidigungsdauer, deaktivierte Falle/Geschütz — sinnvoll, wenn ein Reich die Burg aktiv bestürmt.
  - **Verstärkung des unterlegenen Reichs:** anheuerbare NPC-Söldner am Lager selbst — sinnvoll bei ungleicher Spielerzahl.
  - **Vorschlag zur Auflösung der offenen Frage:** beide Effekte gleichzeitig an denselben Eroberungsakt koppeln, nicht wählbar — das erobernde Reich schwächt automatisch die Burg UND kann am selben Punkt Söldner anheuern. Vermeidet eine zusätzliche Entscheidungs-UI, ein einzelner Eroberungsakt hat zwei sofort spürbare Konsequenzen. (Bleibt Vorschlag, keine endgültige Balance-Entscheidung.)

## 4. Quest-Backlog (für Wartezeiten)

### Wiederverwendbare Copilot-Prompt-Vorlage

> "You are writing content for 'Camelot: Realms at War', a toon-styled 3-faction RvR fantasy game (spiritual successor to Dark Age of Camelot, but with no DAOC-specific names/lore reused). Write ONE self-contained quest for the [Reich] faction, given by [Titel + Name] ([Charakterbeschreibung]) stationed at a [Punkt-Typ] near the frontier. Quest premise: [Kurzprämisse]. Please generate, in English: quest title, a 2-3 sentence quest description, 3 short objective steps, 3-4 lines of opening dialogue, 3-4 lines of closing dialogue. Tone: [Ton-Hinweis]. No mention of Dark Age of Camelot or DAOC-specific proper nouns."

**Platzhalter:** `[Reich]`, `[Titel + Name]`, `[Charakterbeschreibung]` und `[Ton-Hinweis]` aus Abschnitt 2, `[Punkt-Typ]` aus Abschnitt 1, `[Kurzprämisse]` aus der Backlog-Tabelle unten.

### Backlog

| # | NPC | Punkt | Kurzprämisse | Status |
|---|---|---|---|---|
| 1 | Wachhauptmann Baldwin | Albion, Wachturm | Das Signalfeuer des Turms ist erloschen — Spieler soll die Ursache klären und es wieder entzünden | offen |
| 2 | Vorsteherin Eleanor | Albion, Dorf | Versorgungswagen zur Grenze werden überfallen — Spieler soll Route sichern/Täter aufspüren | offen |
| 3 | Wachhauptmann Gunnar | Midgard, Wachturm | Gunnar verlangt einen Bewährungsbeweis, bevor er den Spieler zur Wache zulässt (Echo von Jarl Skadis Prüfungs-Ethos) | offen |
| 4 | Minenaufseher Ulf | Midgard, Mine | Erzlieferungen verschwinden auf dem Weg zu den Schmieden — Sabotage-/Diebstahlverdacht | offen |
| 5 | Schreinhüterin Niav | Hibernia, Schrein | Die Wardsteine am Hain verblassen — direkte Fortsetzung von Rí Aengus' Sorge aus NPC_NAMES.md | **ausformuliert, siehe unten** |
| 6 | Vorsteher Cormac | Hibernia, Dorf/Schmiede | Braucht seltene Materialien aus dem umkämpften Grenzgebiet, um weiter Waffen zu schmieden | offen |
| 7 | Der namenlose Lagerhauptmann | Neutral, Belagerungslager | Bietet Hilfe gegen Bezahlung an, ohne Treue zu erkennen zu geben — Spieler erfährt die Zentralburg-Konsequenz (Abschnitt 3) erst als Folge, nicht als Ansage der Figur selbst | offen |

### Ausformuliertes Beispiel: #5, Schreinhüterin Niav

> "You are writing content for 'Camelot: Realms at War', a toon-styled 3-faction RvR fantasy game (spiritual successor to Dark Age of Camelot, but with no DAOC-specific names/lore reused). Write ONE self-contained quest for the Hibernia faction, given by 'Shrine-Keeper Niav' (mystical, speaks in nature metaphors, tends an ancient warding-stone shrine in a grove near the frontier). Quest premise: the warding stones around the shrine have begun to dim, and Niav fears the same weakening that troubles Hibernia's ruler is spreading here too — she asks the player to investigate the cause near the frontier's edge.
>
> Please generate, in English: quest title, a 2-3 sentence quest description, 3 short objective steps, 3-4 lines of opening dialogue, 3-4 lines of closing dialogue. Tone: mystical, reverent toward nature, quietly worried rather than alarmed. No mention of Dark Age of Camelot or DAOC-specific proper nouns."

## Status

🟡 Neu angelegt (2026-07-21) — Punkt-Typen/NPCs/Mechanik-Zuordnung sind Design-Vorschlag, Backlog-Einträge #1–4/#6/#7 noch nicht bei Copilot generiert. Relevant erst ab Open-World-Frontier-/Startgebiet-Phase, ändert nichts am aktuellen Battleground-Fokus.
