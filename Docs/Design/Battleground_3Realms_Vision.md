# Battleground-Vision: 3-Reiche-Frontier (Design-Idee, nicht final)

> **Status:** Frühe Design-Idee für eine spätere Ausbaustufe. **Nicht** der aktuelle
> Vertical-Slice-Auftrag — siehe [Konflikt mit der Roadmap](#konflikt-mit-der-aktuellen-roadmap-bewusst-offen-dokumentiert)
> unten. Festgehalten, damit die Idee nicht verloren geht, bevor entschieden ist, ob/wann
> sie umgesetzt wird.

## Ausgangspunkt

Zwei Konzeptbilder als Diskussionsgrundlage:

1. Schematische Top-Down-Karte (von Claude als SVG erzeugt) — Reichs-Sektoren, Gebirge als
   Grenzen, Flüsse, Zentralburg mit Wassergraben/Zwinger/drei Brücken.
2. Stimmungsbild (vom Nutzer mit Copilot erzeugt), siehe
   [`References/battleground_moodref_3realms.jpg`](References/battleground_moodref_3realms.jpg) —
   drei Reichsburgen an den Rändern, zentrale "Relic Castle" mit Ringmauer/Wassergraben,
   zwei Brücken, dazwischen Belagerungslager, Wachtürme und kleinere Außenposten als
   Zwischenziele, Nebel/Wald für Tiefenwirkung.

Beide zeigen dieselbe Grundidee: **drei asymmetrische Reichs-Spawns, dazwischen Gelände
mit taktischen Zwischenzielen, in der Mitte eine belagerbare Burg mit Wassergraben und
Zwinger als Kern-Ziel.**

## Layout-Konzept

- **3 Reichs-Spawnpunkte** an den Kartenrändern (Albion, Midgard, Hibernia), je mit
  kleiner Portalfeste/Burg als Rückzugs-/Respawn-Punkt.
- **Gebirgszüge** entlang der drei Sektorgrenzen zwischen den Reichen — natürliche
  Trennung, verhindert direkte Sichtlinien zwischen den Spawns, zwingt den Weg über die
  Mitte.
- **Flüsse**, je einer pro Reichs-Sektor, münden Richtung Zentralburg — visuelle
  Orientierung, potenziell Bewegungs-Hindernis/-Verlangsamung.
- **Zwischenziele pro Anfahrtsweg** (aus dem Moodboard übernommen): Belagerungslager,
  Wachturm, kleiner Außenposten — capturable Punkte, die z. B. Vorteile beim Sturm auf
  die Zentralburg geben (Rally-Punkt, Ressourcen, Sichtlinie). Ersetzt die reinen
  Dekor-Bezeichnungen aus dem Moodboard durch klar spielmechanisch verankerte Stationen.
- **Zentralburg ("Central Relic Castle")**:
  - Wassergraben (äußerster Ring)
  - Äußere Wehrmauer mit Türmen
  - **Zwinger** (Kill-Zone-Ring zwischen äußerer und innerer Mauer) — Angreifer, die die
    äußere Mauer durchbrechen, stehen im Feuer der inneren Mauer, bevor sie das
    eigentliche Tor erreichen
  - Innere Mauer, Bergfried/Donjon im Zentrum als Reliktort
  - Brücken/Tore als einzige Zugänge über den Graben, ein Zugang je Reich (im Moodboard
    nur 2 sichtbare Brücken für 3 Reiche — bei Umsetzung klären, ob 3 symmetrische
    Zugänge oder bewusst asymmetrisch/2 Brücken plus Fußweg)

## Konflikt mit der aktuellen Roadmap (bewusst offen dokumentiert)

[README.md](../../README.md) Phase 2 sagt für den **ersten** Battleground etwas anderes:

- **Klein, symmetrisch, ein zentrales Ziel** (Flagge/Node), Grayboxing reicht — Vorbild
  DAOCs kleine RvR-Zonen (Thidranki, Braemar), **nicht** die große Frontier-Welt.
- **Zwei Fraktionen zum Start**, die dritte (Hibernia) kommt erst, sobald sich der
  Zwei-Fraktionen-Kampf schon gut anfühlt ([CLASSES.md](../../CLASSES.md) Phase-2-Abschnitt).

Diese Vision hier ist das **Gegenteil in Umfang**: offene Welt, Gebirge, Flüsse, volle
Burg-Belagerungsmechanik (Zwinger etc.), alle drei Reiche gleichzeitig. Das ist deutlich
näher an DAOCs großen Frontier-Zonen als an Thidranki/Braemar — passt eher zu **"Danach:
Entscheidung, ob/wie Richtung größerer Welt erweitert wird"** (README.md, nach dem
Vertical Slice) als zum aktuellen Task.

**Empfehlung, wenn/wann diese Idee weiterverfolgt wird:** aktuellen Vertical-Slice-Scope
(kleine symmetrische 2-Fraktionen-Node-Map) zuerst fertigstellen. Diese Datei als
Referenz für die **spätere** 3-Reiche-Ausbaustufe behalten, nicht als Ersatz für Task
Roadmap-Punkt 4 verwenden.

## Offene Fragen

- Zielgröße (Spielerzahl pro Seite) für diese große Version — bestimmt Kartenradius und
  Wegzeiten.
- 3 vs. 2 Brücken in die Zwinger-Zone — beeinflusst Balance (dritter Zugang = dritte
  Front, die verteidigt werden muss).
- Wie viele Zwischenziele pro Anfahrt sind spielmechanisch sinnvoll, ohne das Ziel
  ("Burg stürmen") zu verwässern?
- Nanite/Lumen-Verbot (siehe [CLAUDE.md](../../CLAUDE.md)) bedeutet: Terrain-Detail
  (Gebirge, Wald) muss mit gebackenem Licht und klassischem Landscape-Sculpting
  funktionieren, nicht mit Nanite-Landscape-Displacement — bei Umsetzung early prototypen,
  ob die Toon-Optik bei dieser Kartengröße trägt.
