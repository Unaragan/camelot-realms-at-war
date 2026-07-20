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
>
> **Ergänzung (Nutzer, 2026-07-21):** (1) Battlegrounds sollen langfristig — wie in
> DAOC — **mehrere, level-gestaffelte und unterschiedliche** Karten sein, nicht nur die
> eine kleine Vertical-Slice-Map. (2) Diese große Frontier-Zone soll sich zwar wie in
> DAOC über alle drei Reiche erstrecken, aber **anders als im klassischen DAOC-Frontier**
> soll man sich in den Gebieten zwangsläufig über den Weg laufen — siehe
> [Frontier-Design: erzwungener Kontakt](#frontier-design-erzwungener-kontakt-statt-getrennter-zonen).

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

## Layout-Verfeinerung v2 (Copilot-Feedback zum Photobash, 2026-07-21)

Nach dem ersten Moodboard hat der Nutzer mit Copilot ein weiteres "Photobash"-Beispiel
erzeugt; Copilot selbst schlug für eine "finale Produktionsvorlage" diese Verbesserungen
vor. Layout-seitig sind das sinnvolle Verfeinerungen des Konzepts oben:

- **Nur 3 eindeutig erkennbare Reichs-Keeps** — Lesbarkeit geht vor Detailfülle, jeder
  Keep muss auf einen Blick seinem Reich zuordenbar sein (siehe Reichsidentität unten).
- **Zentralburg ca. 30–40 % kleiner** als im ersten Moodboard — wirkt sonst zu dominant
  im Verhältnis zu den Reichs-Keeps und den Zwischenzielen.
- **Sichtbare äußere Eroberungspunkte** als konkrete Typen statt generischer
  "Zwischenziele": Türme, Dörfer, Minen, Schreine — jeder Typ kann eine eigene
  Gameplay-Belohnung tragen (z. B. Mine = Ressourcen, Schrein = Buff, Turm = Sichtlinie/
  Rally-Punkt, Dorf = Versorgung).
- **Deutlichere Reichsidentität pro Biom**, statt nur unterschiedlicher Fahnenfarben:
  - **Albion** → Ritterburgen, offene Felder, Nebel
  - **Midgard** → Fjorde, Schnee, Felsklippen
  - **Hibernia** → riesige Eichen, Dolmen, mystische Wälder
- **Große offene PvP-Schlachtfelder zwischen den Keep-Routen** — ergänzt/konkretisiert
  den [erzwungenen Kontakt](#frontier-design-erzwungener-kontakt-statt-getrennter-zonen):
  nicht nur schmale Nadelöhre, sondern auch echte offene Flächen zum Feldschlacht-Kampf.
- **Natürliche Chokepoints an Flüssen und Gebirgspässen** — deckt sich mit dem
  bestehenden Gebirgs-/Fluss-Konzept, hier nochmal explizit als Gameplay-Funktion
  (Flaschenhals, kein bloßes Terrain-Deko).
- **Belagerungsstraßen mit sichtbaren Marschrouten** — Wege sollen als klare,
  lesbare Vormarsch-Linien gestaltet sein (Truppenbewegung visuell nachvollziehbar),
  nicht nur als generische Verbindungspfade.
- **Wetterzonen pro Reich** — passend zur Biom-Identität (z. B. Nebel über Albion,
  Schneesturm über Midgard, dunstige Wälder über Hibernia); zusätzliches Mittel zur
  Reichs-Unterscheidbarkeit aus der Luft.

## Rendering-Hinweis: POC fest Toon/Flat, finale Artdirection bewusst offen

Copilot schlug für den finalen Look zusätzlich **"UE5.8-Look mit Lumen, Nanite,
Volumetric Fog und realistischer Beleuchtung"** vor. Klarstellung des Nutzers
(2026-07-21): Für den **POC/Vertical Slice bleibt es bei Toon/Flat** mit gebackenem
Licht (Lightmass) — daran ändert sich nichts, siehe [CLAUDE.md](../../CLAUDE.md). Für
die **finale Produktversion** ist ein realistischerer Look (Lumen/Nanite/Volumetric Fog)
dagegen bewusst **nicht ausgeschlossen** — das ist eine offene, spätere Design-/
Technik-Entscheidung, kein Widerspruch mehr, den es aufzulösen gilt.

Praktisch heißt das für jetzt:

- **POC/Vertical Slice:** striktes Toon/Flat, gebackenes Licht, Mittelklasse-Hardware —
  unverändert nicht verhandelbar (Performance-Ziel, RvR-Lesbarkeit, günstigere
  Produktion laut README.md).
- **Finale Version:** offen — die photorealistischen Copilot-Bilder sind dafür ein
  gültiger Stimmungs-/Ziel-Look-Kandidat, nicht nur Kompositions-/Layout-Referenz.
  Sollte diese Entscheidung getroffen werden, betrifft sie: Landscape-Rendering-Pipeline
  (Lumen vs. Lightmass), ob Nanite auch für Charaktere infrage kommt, Ziel-Hardware-
  Anforderungen (steigen bei realistischem Look spürbar), und ob Mesh/Material-Austausch
  (siehe CLAUDE.md, Platzhalter-Toon-Art muss ersetzbar sein) für einen Stilwechsel
  reicht oder größere Rework nötig wird.
- Diese Entscheidung sollte **nicht vor dem Vertical Slice** getroffen werden — Scope-
  Disziplin laut README.md gilt weiter, das ist nur die Vormerkung, dass die Tür offen
  bleibt.

## Frontier-Design: erzwungener Kontakt statt getrennter Zonen

DAOCs klassischer Frontier ist real pro Reich in eigene Grenzgebiete unterteilt —
Realm-vs-Realm-Kontakt entsteht meist nur an wenigen Vorstoß-/Grenzpunkten, große Teile
der eigenen Seite sind PvE-ruhig. Für dieses Projekt ausdrücklich **anders gewünscht**:
die drei Reichs-Sektoren dieser Frontier-Zone sollen **kein** rein getrenntes
Hinterland haben, sondern so gestaltet sein, dass Spieler aus verschiedenen Reichen sich
auch abseits der Zentralburg zwangsläufig begegnen — z. B. gemeinsame Zwischenziele
(Belagerungslager/Außenposten aus dem Layout-Konzept), Ressourcenpunkte oder
Durchgangs-Pässe, die nicht eindeutig einem Reich zugeordnet sind, statt strikt
reichseigener Korridore. Die Gebirgszüge trennen also nicht drei komplett isolierte
Wege zur Burg, sondern erzeugen eher Nadelöhre/geteilte Übergänge, an denen Kontakt
wahrscheinlich statt vermeidbar ist.

**Konsequenz fürs Layout:** Bei Umsetzung prüfen, ob z. B. Flussüberquerungen,
Passstraßen durch die Gebirgszüge oder einzelne Zwischenziele bewusst
**reich-neutral/geteilt** liegen (nicht klar im Sektor eines einzelnen Reichs), damit
zwei oder drei Reiche denselben Punkt anlaufen müssen.

## Battlegrounds (Plural): level-gestaffelt und unterschiedlich

Über den einen Vertical-Slice-BG hinaus ist langfristig eine **Serie** von Battlegrounds
geplant, analog zu DAOCs mehreren BGs für verschiedene Level-Bänder (z. B. Thidranki,
Braemar, Molvik — jede mit eigenem Layout/Charakter statt einer Kopie mit anderem
Level-Cap). Für dieses Projekt heißt das:

- Jedes künftige BG braucht ein **eigenes Layout-Konzept**, nicht nur eine Reskin-Kopie
  des ersten.
- Level-Gating/Bracket-Zuordnung (welches BG ab welchem Level) ist noch offen — erst
  relevant, sobald es überhaupt ein Level-/Progressionssystem gibt (siehe
  [SYSTEMS.md](../../SYSTEMS.md)).
- Reihenfolge bleibt roadmap-konform: erst der eine kleine 2-Fraktionen-BG fertig und
  spielbar, dann Entscheidung über weitere BGs bzw. die Open-World-Frontier.

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
