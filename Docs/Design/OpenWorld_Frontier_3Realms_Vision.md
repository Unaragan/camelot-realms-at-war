# Open-World-Frontier-Vision: 3 Reiche (Design-Idee, nicht final)

> **Status:** Frühe Design-Idee, **nicht** der aktuelle Vertical-Slice-Auftrag — siehe
> [Einordnung](#einordnung-open-world-frontier-vs-battleground) unten. Festgehalten,
> damit die Idee nicht verloren geht, bevor entschieden ist, ob/wann sie umgesetzt wird.
>
> **Wichtige Klarstellung (Nutzer, 2026-07-21):** Das hier ist **kein** größerer Ersatz
> für den kleinen Vertical-Slice-Battleground. Es ist die Design-Idee für die spätere,
> **separate** normale Open World der drei Reiche, die es im fertigen Spiel neben dem/den
> Battleground(s) ohnehin geben soll — vergleichbar mit DAOCs Trennung zwischen kleinen
> RvR-Zonen (Thidranki, Braemar) und den großen persistenten Frontier-Zonen
> (Emain Macha, Odin's Gate, etc.). Der kleine 2-Fraktionen-BG aus der Roadmap bleibt
> unangetastet und wird zuerst gebaut.

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

## Einordnung: Open World Frontier vs. Battleground

[README.md](../../README.md) Phase 2 beschreibt den **ersten Battleground** bewusst
anders — klein, symmetrisch, ein zentrales Ziel (Flagge/Node), Grayboxing reicht, Vorbild
DAOCs kleine RvR-Zonen (Thidranki, Braemar), zwei Fraktionen zum Start, dritte
(Hibernia) kommt erst später ([CLASSES.md](../../CLASSES.md) Phase-2-Abschnitt). Dieser
kleine BG ist und bleibt der aktuelle Task — daran ändert dieses Dokument nichts.

Diese Vision hier gehört zu einer anderen, späteren Kategorie: der **normalen offenen
Welt der drei Reiche**, die README.md unter "Danach: Entscheidung, ob/wie Richtung
größerer Welt erweitert wird" erwähnt. Offene Welt, Gebirge, Flüsse, volle
Burg-Belagerungsmechanik (Zwinger etc.), alle drei Reiche gleichzeitig — das ist
konzeptionell näher an DAOCs großen Frontier-Zonen als an Thidranki/Braemar, und damit
ein eigenständiges späteres Feature, kein Ersatz für Roadmap-Punkt 4.

**Empfehlung:** aktuellen Vertical-Slice-Scope (kleiner symmetrischer 2-Fraktionen-BG)
zuerst fertigstellen und den Kampf-Kern beweisen. Diese Datei als Referenz für die
spätere Open-World-Frontier-Phase behalten.

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
