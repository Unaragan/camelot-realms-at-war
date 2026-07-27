# Open-World-Heimatreiche: Level-Gebiete (Design-Idee, nicht final)

> **Status:** Frühe Design-Idee, **nicht** der aktuelle Vertical-Slice-Auftrag — genau wie
> [OpenWorld_Frontier_3Realms_Vision.md](OpenWorld_Frontier_3Realms_Vision.md) steht auch
> dies auf der Nicht-jetzt-Liste ([README.md](../../README.md) → "Nicht-jetzt-Liste":
> "Offene, persistente Welt", "Startgebiet/Tutorial-Zone (bis nach dem Vertical Slice)").
> Festgehalten, damit die Idee nicht verloren geht, bevor entschieden ist, ob/wann sie
> umgesetzt wird.

## Einordnung: Heimatreich vs. Frontier vs. Battleground

Drei separate, unterschiedlich terminierte Features, nicht Stufen derselben Sache:

1. **Battleground(s)** — klein, symmetrisch, aktueller Auftrag (README.md Phase 2).
2. **Frontier** (3 Reiche gemeinsam, Zentralburg) —
   [OpenWorld_Frontier_3Realms_Vision.md](OpenWorld_Frontier_3Realms_Vision.md), späteres
   RvR-Feature.
3. **Heimatreich-Open-World** (dieses Dokument) — pro Reich eine eigene, **PvE-ruhige**
   Levelwelt rund um die Hauptstadt, in der die schon geschriebenen Epic-Questlines
   ([Albion](Albion_Epic_Questline.md)/[Midgard](Midgard_Epic_Questline.md)/
   [Hibernia](Hibernia_Epic_Questline.md), je Lv 1–50, 26 Stufen) tatsächlich einen Ort
   zum Spielen haben. Vergleichbar mit DAOCs eigenen Reichsgebieten (z. B. Albion:
   Camelot + Cotswold, Prydwen Keep, Salisbury Plains, Avalon Marsh, Black Mountains …),
   nicht mit dem Frontier.

Die drei Features verbinden sich am Rand: das äußerste Heimatreich-Gebiet grenzt an die
Gebirgszüge der Frontier-Karte — Leveln führt so organisch in die dort schon designte
RvR-Zone, statt dass beide Kartensysteme unverbunden nebeneinanderstehen.

## Grundidee

- **Hauptstadt zentral** pro Reich (Rückzugsort, Trainer, Auktionshaus/Handel, Questgeber-
  Hub, Startpunkt nach Charaktererstellung).
- **Mindestens 7 Regionen** ringförmig/sektorartig um die Hauptstadt verteilt, je einer
  eigenen Levelspanne zugeordnet.
- Regionen sind **nicht rein geografisch beliebig**, sondern an die bereits
  ausformulierten Quest-Meilensteine aus [Quests.md](Quests.md) angelehnt — so hat jedes
  Gebiet von Anfang an passenden Content, statt einer leeren Karte, die erst noch befüllt
  werden muss.

## Regionsvorschlag (7 Level-Bänder, je Reich identisch strukturiert)

Levelspannen an den bestehenden AEQ/MEQ/HEQ-Meilensteinen und den beiden BG-Debüts
(Lv 20, Lv 30 — siehe [Quests.md](Quests.md) Instanzen-Übersicht) ausgerichtet. Namen
bewusst **nicht** identisch mit echten DAOC-Zonennamen (siehe CLAUDE.md → "Kein
Original-DAOC-Content"), aber wo sinnvoll an bereits etablierte eigene Lore-Begriffe aus
den Epic-Questlines angeknüpft (z. B. "Hollow", "Ironbrood", "Rootbound/Withered").

| # | Lv-Band | Albion | Midgard | Hibernia | Bezug zu bestehendem Content |
|---|---|---|---|---|---|
| Hauptstadt | – | **Aldenbury** | **Skaldheim** | **Dun Kerath** | Start nach Charaktererstellung |
| 1 | 1–9 | Ashford Vale | Vinterdal | Glenmara | AEQ/MEQ/HEQ -01 bis -06 |
| 2 | 9–16 | Redmoor | Wolfsmark | Witherwood Edge | führt zur 1. Gruppen-Instanz (Osric/Erik/Eamon); Wolfsmark ↔ "Wolves Among Wolves" (MEQ-02), Witherwood Edge ↔ "The Withering Circle"/Eamon the Withered |
| 3 | 16–23 | Thornfield | Ashenfjord | Cairnholt | nach Instanz #1, Übergang zum BG-Debüt Lv 20 |
| 4 | 23–30 | Graywick Downs | Stormcrag Heights | Sceal Ridge | BG-Debüt #2 (Lv 30), Instanz #2 (Leofric/Ingvar/Tadhg) |
| 5 | 30–39 | Hollowmere | Ironbrood Hold | Rootbound Hollow | Instanz #3; direkter Bezug zu "Into the Hollow"/"Into the Ironbrood's Hold" (MEQ-21)/"Into the Rootbound Hollow" |
| 6 | 39–47 | Cinderreach | Grimfrost Barrens | Brambleward March | Eskalation Richtung Finale |
| 7 | 47–50 | Ravensmoor March | Ravensfjord March | Duskthorn Reach | letzte Solo-Quests, grenzt an die Frontier-Gebirgszüge |

Jedes Reich behält seine bereits etablierte Reichsidentität aus der Frontier-Vision:
Albion (Ritterburgen, offene Felder, Nebel), Midgard (Fjorde, Schnee, Felsklippen),
Hibernia (riesige Eichen, Dolmen, mystische Wälder).

## Layout-Alternative: Nabe-und-Speichen statt reiner Ringe

Strikt konzentrische Ringe wirken schnell wie gleich große "Tortenstücke". Bessere Lesart:

- **Hauptstraßen** strahlen von der Hauptstadt zu jeder der 7 Regionen (Speichen).
- **Unerschlossene Wildnis/Nebenpfade** zwischen den Speichen — Raum für optionale
  Erkundung, Geheimnisse, spätere Housing-/Crafting-Gebiete (beide selbst Nicht-jetzt,
  aber Fläche dafür freihalten schadet nicht).
- **Regionsgrößen dürfen asymmetrisch sein**: Region 1 klein und sicher (Tutorial-Gefühl),
  Region 7 groß und gefährlich (letzter Levelabschnitt vor der Frontier) — wirkt
  natürlicher als sieben gleich große Kuchenstücke.

## Kartenform: länglich statt kreisförmig (Empfehlung)

Offene Frage vom Nutzer: kreisförmige Welt (Hauptstadt geometrisch zentral, Regionen
gleichmäßig ringförmig drumherum) oder eher länglich, wie ein echtes Land (z. B. England)?

**Empfehlung: länglich, als "Spine"-Form statt echtem Kreis.** Gründe:

- **Passt zum Content:** Die Epic-Questlines (AEQ/MEQ/HEQ) sind strikt lineare
  26-Stufen-Geschichten, kein verzweigtes "geh in beliebige Richtung"-Design. Eine
  längliche Karte mit der Hauptstadt am ruhigen Ende und Region 7 am gefährlichen,
  Frontier-zugewandten Ende bildet diese lineare Erzählstruktur direkt im Raum ab —
  bei einem echten Kreis könnten Spieler rein geografisch aus mehreren Richtungen
  gleichzeitig "Endgame-nahe" Gebiete erreichen, was der linearen Story widerspricht.
- **Wirkt weniger künstlich:** Ein perfekter Kreis mit exakt 7 gleich großen
  Tortenstücken liest sich schnell als Spielbrett statt als Ort. Ein längliches,
  unregelmäßiges Territorium (wie reale Länder) erlaubt Buchten, Halbinseln, engere und
  weitere Abschnitte — deckt sich mit der bereits vorgeschlagenen
  [Nabe-und-Speichen-Idee](#layout-alternative-nabe-und-speichen-statt-reiner-ringe) oben.
- **Unterscheidet die drei Reiche stärker:** Bei drei Kreisen sehen sich Albion, Midgard
  und Hibernia auf der Übersichtskarte zwangsläufig ähnlich (nur Textur/Farbe anders).
  Länglich erlaubt reichseigene Silhouetten, die zur Identität passen — z. B. Midgard als
  gestreckte Fjordküste, Hibernia als verschlungene Waldfläche, Albion als sanft
  gewellter Landstreifen.
- **Bleibt an den Frontier-Übergang anschlussfähig:** Region 7 (Bastions-Vorland/
  Ravensmoor March/Ravensfjord March/Duskthorn Reach) liegt dann konsequent am äußersten
  Ende des Streifens, direkt an den Gebirgszügen der Frontier-Karte — genau der
  Übergang, der oben schon als Ziel beschrieben ist.

**Praktisch heißt das:** Hauptstadt bleibt "zentral" im Sinne von *zentraler
Ausgangspunkt der Progression* (näher am sicheren Ende als am gefährlichen), nicht
geometrisch mittig im Territorium. Die 7 Regionen reihen sich entlang der Länge
auf, mit Seitenästen/Nebenwegen quer dazu (Nabe-und-Speichen bleibt für die lokale
Erschließung *innerhalb* der länglichen Form gültig, nur nicht mehr radial-symmetrisch
um einen Mittelpunkt).

## BG-Eingänge in den Regionen

Die Portale zu den bestehenden Battlegrounds (siehe
[OpenWorld_Frontier_3Realms_Vision.md](OpenWorld_Frontier_3Realms_Vision.md) →
"Battlegrounds (Plural)") liegen konsequent in der Region mit passendem Levelband, nicht
irgendwo verstreut:

- **Lv 20 "Grenzland-Scharmützel"** → Region 3 (Thornfield/Ashenfjord/Cairnholt)
- **Lv 30 "Umkämpftes Hochland"** → Region 4 (Graywick Downs/Stormcrag Heights/Sceal
  Ridge) — der BG-Name ist hier sogar identisch mit dem Arbeitstitel des Levelbands, passt
  also schon jetzt zusammen
- **Lv 50 "Bastion der Kill-Zone"** → Region 7 (Ravensmoor March/Ravensfjord March/
  Duskthorn Reach), zugleich der Übergang zur Frontier-Zentralburg

## Geteilte Instanz-Konzepte jenseits der Haupt-Questline (DF- und POC-Vorbild)

Zusätzlich zu den 4 Haupt-Instanzen pro Reich (siehe [Quests.md](Quests.md)) zwei weitere,
spätere Instanz-Ideen, angelehnt an DAOCs Darkness Falls (DF) bzw. an "Passage of
Conflict" (POC, Eden-Freeshard-Begriff) — beide unter neuen, eigenen Namen (kein
Original-DAOC-Content):

| | **"Emberdeep"** (DF-Vorbild) | **"The Cinder Gate"** (POC-Vorbild) |
|---|---|---|
| Mindestlevel | ~30 | 50 |
| Zugang | Eingang in **Region 4** jedes Reichs (Graywick Downs/Stormcrag Heights/Sceal Ridge) | Nur über die Frontier erreichbar, an RvR-Teilnahme/-Erfolg gekoppelt |
| Content-Typ | Gemischt PvE/PvP, geteilte Zone | Zweistufig — s. u. |
| Bewohner | Noch offen | "Anhänger der Hölle"/Dämonen |
| Reichs-Zugang | Alle 3 Reiche, unabhängig voneinander, **immer offen** | **Immer offen**, kein Population-/Keep-Gating (s. u.) |

### The Cinder Gate: zweistufiger Aufbau (Eden-Vorbild, Nutzer 2026-07-23)

Analog zu Edens POC-Umsetzung zwei verschachtelte Instanzen statt einer:

1. **Erste Instanz — reichseigen.** Für jedes Reich eine eigene Variante (3 unabhängige
   Versionen, eigenes Layout/Thema pro Reich möglich), normale **Gruppengröße** (5
   Spieler), reines PvE. Führt am Ende zum Eingang der zweiten Instanz. Mit einer
   einzelnen Gruppe zu bewältigen.
2. **Zweite Instanz — gemeinsame Boss-Instanz.** Für alle 3 Reiche **identisch**,
   erfordert **BG-Formation** (größere, RvR-fähige Gruppe statt einzelner 5er-Gruppe).
   Hier treffen die Reiche aufeinander — reguläres RvR, kein gemeinsamer Kampf gegen die
   Dämonen (siehe Klarstellung unten). Bossmechanik BG-artig (mehrstufige Ziele/Wellen
   statt Tank&Spank).

Damit ist der Ablauf klar gestaffelt: kleine Gruppe → reichseigene Vorinstanz → BG-Gruppe
→ gemeinsame Endinstanz mit RvR gegen die anderen Reiche.

**Ergänzung (Nutzer, 2026-07-23):** Da die große Frontier-Zone ohnehin für alle 3 Reiche
zugänglich ist, sind auch **alle drei Eingänge zur ersten Instanz für jedes Reich nutzbar**
— nicht auf den Eingang des eigenen Reichs beschränkt. Die "reichseigene" Vorinstanz ist
also eher **thematisch** je Reich unterschiedlich (3 Varianten), nicht
zugangs-beschränkt nach Spieler-Reich. Praktisch heißt das: eine Albion-Gruppe könnte
z. B. auch durch den Midgard- oder Hibernia-Eingang gehen, wenn sie sich dorthin
durchkämpft. Das macht die drei Eingangspunkte selbst zu zusätzlichen
umkämpften Orten innerhalb der Frontier — passt zum "erzwungener Kontakt"-Prinzip aus
[OpenWorld_Frontier_3Realms_Vision.md](OpenWorld_Frontier_3Realms_Vision.md) (gemeinsame/
geteilte Zwischenziele statt streng reichseigener Korridore).

**Narrative Klammer (Vorschlag):** Statt eines gemeinsamen Portals bekommt jedes Reich
**seinen eigenen, unabhängig entdeckten Zugang** zu Emberdeep — das löst die Frage "warum
ist der Zugang in allen drei Reichen verfügbar" ohne dass die Reiche sich dafür
abstimmen müssten. Idee: **derselbe unterirdische Riss** reagiert auf den eskalierenden
Krieg zwischen den Reichen (Kampf/Blutvergießen schwächt ein altes Siegel) und bricht ab
Lv~30 zeitgleich, aber an drei unabhängigen Stellen in den Grenzländern aller drei Reiche
auf — jedes Reich hält es zunächst für einen eigenen, lokalen Fund. Bei Lv 50 bricht das
Siegel an seiner eigentlichen Quelle vollständig auf — direkt unter/bei der
Zentralburg der Frontier (siehe
[OpenWorld_Frontier_3Realms_Vision.md](OpenWorld_Frontier_3Realms_Vision.md)) —, das ist
The Cinder Gate. Damit hängen beide Instanzen an **einem** Bedrohungs-Thread
("der endlose Krieg reißt etwas Altes und Hungriges auf"), ohne die bestehenden
Realm-eigenen Bösewichte der Haupt-Questlines (Osric/Erik/Eamon, Hollow Sentinel/Iron
Wolf/Bramble Warden, Sir Alaric/Ragnar Half-Sworn/Fintan the Rootbound) zu verändern —
ein zusätzlicher, späterer Endgame-Thread, kein Ersatz.

**Klarstellung (Nutzer, 2026-07-23):** Die zweite Instanz von The Cinder Gate ist explizit
**auf RvR ausgelegt** — treffen BG-Gruppen verschiedener Reiche aufeinander, kämpfen sie
gegeneinander (kein gemeinsamer Kampf gegen die Dämonen). Die Dämonen/Bossmechanik läuft
parallel dazu, ersetzt das RvR aber nicht.

**Entscheidung (Nutzer, 2026-07-23): Zugang zu beiden — Emberdeep (ab Lv 30) und The
Cinder Gate (Lv 50) — ist immer offen für alle 3 Reiche**, **nicht** an Keep-Kontrolle
oder Populationsstärke gekoppelt. Begründung aus DAOC-Erfahrung: Wenn Zugang (wie bei
DAOCs echtem Darkness Falls) daran hängt, welches Reich mehr Keeps erobert hat, bekommt
praktisch immer das ohnehin überpopulierte/dominante Reich den Zugang — verstärkt
bestehende Ungleichgewichte statt sie auszugleichen, hat auf Live-DAOC zu Frust geführt.
Der Eden-Freeshard hat das für POC korrigiert, indem der Zugang durchgehend für alle
offen ist (inkl. des zweistufigen Instanz-Aufbaus oben) — dieses Projekt übernimmt den
Eden-Ansatz für beide Zonen. Wichtig: das ist ein **anderer Mechanismus** als die
Populations-Ungleichgewicht-Idee aus der Frontier-Vision (dort bekommt das
**unterlegene** Reich einen Vorteil, verstärkt also nicht den Vorsprung des führenden
Reichs) — kein Widerspruch, nur zwei getrennte Systeme, die beide denselben Fehler
vermeiden sollen.
- Technisch: Emberdeep als echte geteilte Zone (alle Reiche gleichzeitig drin) setzt
  vermutlich mehr Netzwerk-Robustheit voraus als das aktuelle Listen-Server-Modell
  (README.md) hergibt — eher ein Punkt für die Dedicated-Server-Phase.

## Moodboard-Referenzen pro Heimatreich

Copilot-Konzeptbilder, gleicher Bildstil-Ansatz wie die BG-/Frontier-Moodboards in
[OpenWorld_Frontier_3Realms_Vision.md](OpenWorld_Frontier_3Realms_Vision.md). Prompts
hier archiviert, damit sie nicht nur im Chat-Verlauf existieren (siehe dortiger
Praxis-Hinweis zu KI-generiertem Text in Bildern — ohne Text generieren, danach selbst
beschriften).

**Albion** — bereits generiert:
[`References/homerealm_albion_moodref.jpg`](References/homerealm_albion_moodref.jpg) —
trifft die Regionenfolge sehr genau: grüne Felder um Aldenbury (Ashford Vale) → rötliches
Heideland (Redmoor) → dorniges Gestrüpp mit Wachturm (Thornfield) → windgepeitschte
Hochebene mit Lager/Banner (Graywick Downs) → nebliger Hain mit knorrigen Bäumen
(Hollowmere) → verbranntes Kriegsgebiet mit Glutresten (Cinderreach) → toter Rabenmarsch
(Ravensmoor March), gerahmt von Gebirge, das nach Süden schroffer/schneebedeckter wird —
passender Übergang zur Frontier.

Ursprünglicher Prompt:

```text
Aerial oblique fantasy map illustration, painterly digital art style, muted
color palette matched to an existing concept-art series, light fog for depth.
Elongated home territory of a knightly kingdom, stretching north to south.
In the north, a walled capital city with tall stone towers and banners amid
gentle open farmland. A dirt-and-stone road winds south through a sequence of
distinct micro-regions: green farmland near the capital, a reddish heather
moor, a thorny scrubland, wind-swept gray downs, a misty ancient hollow with
twisted old trees and sparse forest, a cinder-scorched war-torn stretch, and
finally a raven-haunted march of bare trees at the southern edge. A modest
river winds alongside the road, widening toward the south. Small
thatched-roof villages, watchtowers and a couple of simple palisade camps dot
the road at intervals — home territory, not a battlefield, so no large
fortresses except the capital. Low mountain ridges line the eastern and
western borders, rising into a taller mountain range at the very southern
edge where the territory meets a larger contested frontier zone (visible only
as distant hazy peaks at the map edge). Small compass rose bottom-right
corner. Clean fantasy-map label style, no readable body text needed. Wide 3:2
aspect ratio, top-down strategic game map look, same visual family as the
existing battleground concept series.
```

**Feedback (Nutzer, 2026-07-23) zum Albion-Ergebnis:** Als erste Iteration akzeptiert,
aber für alle künftigen Moodboards (Midgard/Hibernia unten, spätere Überarbeitungen)
gilt: **mehr Wege/Nebenpfade, mehr Flüsse/Nebenflüsse und generell mehr visuelle
Vielfalt** ("mehr fürs Auge") statt nur eines einzelnen Hauptwegs/-flusses — bereits in
den folgenden Prompts berücksichtigt.

**Midgard** — bereits generiert:
[`References/homerealm_midgard_moodref.jpg`](References/homerealm_midgard_moodref.jpg) —
Skaldheim am Fjordkopf mit Langhaus/Wachtürmen und Fischerbooten → Kiefernwald mit Lager
(Wolfsmark) → zwei parallele Stationen auf gleicher Höhe: befestigtes Lager links
(Stormcrag Heights) und dunkler Höhleneingang rechts (Ironbrood Hold) → Frostbarrens mit
Eisschollen und gestrandetem Wrackschiff ganz unten (Ravensfjord March). Deutlich mehr
Nebenpfade/-flüsse als beim ersten Albion-Bild — Feedback umgesetzt.

Prompt:

```text
Aerial oblique fantasy map illustration, painterly digital art style, muted
color palette matched to an existing concept-art series, light fog for depth.
Elongated home territory of a Norse-inspired kingdom, stretching from a fjord
in the north to snowy mountains in the south. A wooden hall-capital with tall
watchtowers sits at the head of the fjord, surrounded by small
longhouse villages, fishing boats and a few standing rune-stones. A main
river/fjord arm winds south, fed by two or three smaller tributary streams
that join it at different points, crossed by a couple of simple wooden
bridges and a ford. Alongside the main road, one or two smaller side paths
branch off toward outlying villages and camps, not just a single route.
The road passes through a sequence of distinct micro-regions: a gentle
snowy valley near the capital, a pine-forested wolf territory with a
timber lodge/camp, a burned fjord-side settlement turned ash-gray, wind-
and storm-battered rocky highland cliffs with a fortified camp, a dark
cavern/hold entrance carved into a rock face, a frost-blasted barren
wasteland with scattered ice floes, and finally a foggy dead fjord march
with a wrecked longship half-buried in frost at the southern edge. Snow-
covered pine forest patches recur at several points, not just one. Low
rocky ridges line the eastern and western borders, rising into a taller,
snow-capped mountain range at the very southern edge where the territory
meets a larger contested frontier zone (visible only as distant hazy
peaks). Small compass rose bottom-right corner. Clean fantasy-map label
style, no readable body text needed. Wide 3:2 aspect ratio, top-down
strategic game map look, same visual family as the existing concept series.
```

**Hibernia** — bereits generiert:
[`References/homerealm_hibernia_moodref.jpg`](References/homerealm_hibernia_moodref.jpg)
— Dun Kerath mit Steinkreis unter der großen Eiche oben → absterbende bleiche Bäume links
(Witherwood Edge) → Grabhügel/Dolmen im Zentrum (Cairnholt) → hochaufragende Menhire
rechts (Sceal Ridge) → Wurzeltunnel durch knorrige Eichen unten links (Rootbound Hollow)
→ dornig-dunkles Dickicht unten an den Nebelbergen (Brambleward March/Duskthorn Reach).
Will-o'-Wisp-Lichter, mehrere Brücken/Bäche/Wasserfälle.

Prompt:

```text
Aerial oblique fantasy map illustration, painterly digital art style, muted
color palette matched to an existing concept-art series, light fog for depth.
Elongated home territory of a Celtic-inspired realm, stretching through
ancient oak forest from a hillfort capital in the north to misty mountains
in the south. The stone ringfort capital sits atop a low hill ringed by
giant ancient oaks, with a small village and a stone circle nearby. A
winding river with two or three smaller joining streams crosses the
territory, with stepping-stone fords and a rope-and-wood bridge at
different points, not just one crossing. Alongside the main forest path,
a couple of narrower side trails branch off toward hidden clearings and
small wattle-and-daub villages. The path winds through a sequence of
distinct micro-regions: a bright wildflower glen with standing stones near
the capital, a withering forest edge with sickly twisted pale trees, a
hilltop dotted with burial cairns and dolmens, a rocky ridge lined with
ancient carved story-stones, a deep hollow where massive gnarled oak roots
form natural tunnels and archways, a bramble-choked thorny wilderness, and
finally a dusk-lit thorny reach at the forest's edge, mist drifting in from
the south. Giant ancient oaks and dolmens/standing stones recur at several
points across the map, not just one location; faint will-o'-wisp lights in
the deeper forest sections. Low misty hills line the eastern and western
borders, rising into a taller, fog-shrouded mountain range at the very
southern edge where the territory meets a larger contested frontier zone
(visible only as distant hazy peaks). Small compass rose bottom-right
corner. Clean fantasy-map label style, no readable body text needed. Wide
3:2 aspect ratio, top-down strategic game map look, same visual family as
the existing concept series.
```

## Settlement & POI Visual References

Zusätzlich zu den großflächigen Realm-Moodboards: **Architectural Style Guides** für einzelne Siedlungen, Dörfer und Material-Lieferanten-POIs.

**Albion** — Zivilisierte Stone + Timber-Architektur:
- Zentralisierte Dörfer mit Steinmauern/Turmhäusern (rechteckig, ordentlich)
- Material-Vendors: Steinerne Zunftshäuser mit roten Ziegeldächern
- Beispiel-POI: **Erzwerk** (Lv30-39 Zone) = befestigte Berganlage mit Schachteingang, Holzgerüsten, sauberen Arbeitsbereichen
- Visual: Europäische mittelalterliche Architektur (Late-Gothic, ordentlich)

**Midgard** — Nordic/Viking Palisaden-Lager:
- Holz-Palisaden-Walls, Langhaus-Zentren mit Holzkonstruktionen
- Material-Vendors: Werkstätten mit freien Feuerstellen, rustikal
- Beispiel-POI: **Stall/Pelzmarkt** = offenes Handelslager mit Vieh-Pferchen, Rauchzeichen
- Visual: Viking-Siedlungen, natürlich gewachsen, verwittertes Holz, Rauch

**Hibernia** — Druiden/Natur-Integration:
- Runde Hütten (Roundhouses), Steinkreise, natürliche Integration in Wälder
- Material-Vendors: Kräuter-Gärten, Alchemisten-Grotteneingang mit Moosüberwuchs
- Beispiel-POI: **Holzfäller-Zunft** = Waldlichtung mit gestapeltem Holz, Naturschutz-Aspekt (respektvoller Abbau)
- Visual: Keltische Architektur, mystisch, von Natur "umgeben" (nicht "erbaut")

---

## Pacing: Monatelange Spielerbindung übers Leveln

Frage vom Nutzer (2026-07-23): Reicht der Platz auf den Karten, um Spieler über Monate zu
fesseln — Hauptziel bleiben die großen Schlachten, aber auch das Leveln soll ausreichend
lange dauern (nicht in 2 Tagen durch).

**Einschätzung:** Kartengröße ist dafür **nicht** der entscheidende Faktor — 7 Regionen
pro Reich sind reichlich Raum. Die 26 linearen Story-Stufen je Reich (AEQ/MEQ/HEQ) sind
vom Umfang her eher wie die Hauptstory eines Solo-RPGs; ein motivierter Spieler kann das
an einem langen Wochenende durchspielen, unabhängig von der Kartengröße, solange
Quest-XP die einzige Levelquelle ist. Die eigentliche Stellschraube ist die
**XP-Kurve/Grind-Dichte** (SYSTEMS.md, noch nicht ausgearbeitet) — im echten DAOC waren
Quests nur ein Bruchteil der nötigen XP, der Großteil kam aus Mob-Grinden, das war der
eigentliche Zeitfresser über Wochen/Monate. Zusätzliches Risiko: da RvR das erklärte
Hauptziel ist, werden engagierte Spieler erfahrungsgemäß zu den BG-Eingängen (Lv 20/30/50)
**rushen** statt durch alle Regionen zu bummeln — bekanntes MMO-Muster, kein
Kartengrößen-Problem.

**Entscheidungen (Nutzer, 2026-07-23):**

- **XP-Kurve steigt an** — pro Level wird mehr XP benötigt als im Level davor (Standard-
  eskalierende Kurve statt linear/flach). Genaue Werte erst mit SYSTEMS.md/Zahlendesign.
- **Crafting kommt für die Release-Version** (aktuell weiterhin Nicht-jetzt für den
  Vertical Slice, siehe README.md). Zwei Materialquellen vorgesehen: **Kauf gegen
  Ingame-Currency** oder **Farmen/Sammeln** — beides als spätere Zeitbindungs-/
  Wirtschafts-Mechanik geplant, nicht nur einer der beiden Wege.
- **Housing-Zone kommt als Addon** nach Release (nicht Teil des Hauptspiels beim Launch).

Damit ist die eigentliche Monate-Bindung planerisch klar verortet: nicht die
Heimatreich-Kartengröße, sondern XP-Kurve (früh im Systemdesign) plus Crafting/Housing
(nach Release) — dieses Dokument bleibt für die reine Geografie/Regionsstruktur
zuständig, die Zahlen-/Wirtschaftsseite gehört in SYSTEMS.md, sobald sie dran ist.

## Werkzeug-Kandidat: UE5.8 "Mesh Terrain" (Nutzer-Fund, 2026-07-23)

Video-Hinweis vom Nutzer: ["NEW Mesh Terrain is Just Insane! (FULL Tutorial) | Unreal
Engine 5.8"](https://www.youtube.com/watch?v=1mZkBLuvTCs) (Kanal Proj Prod). Kein
Volltranskript ausgewertet, nur Videobeschreibung/Kapitelliste — Einschätzung entsprechend
mit Vorbehalt.

**Was es ist:** Neues UE5.8-System zur Terrain-Erstellung, echtes Mesh statt klassischer
Heightmap-Landscape. Laut Kapitelliste enthalten: boolesche Modifikatoren (Höhlen/
Overhangs), Spline-Modifikator (Seen/Flussufer), Textur-Patch-/Remesh-/Noise-/
Sculpt-Modifikatoren, mehrschichtiges Material-Painting, Mesh-Partitionierung/
World-Partition-Integration — laut verlinktem Talk explizit für "große komplexe Welten"
gebaut.

**Warum relevant für dieses Dokument:**
- Boolesche Höhlen-Operationen passen direkt zu **Ironbrood Hold** (Höhleneingang) und
  **Rootbound Hollow** (Wurzeltunnel) — damit könnten das echte begehbare Höhlen werden
  statt aufgesetzter Deko-Meshes.
- Spline-basierte Flüsse/Seen passen zum Feedback "mehr Flüsse" aus den
  Moodboard-Prompts oben.
- Für-große-Welten-Auslegung passt zur länglichen Mehrfach-Regionen-Struktur dieses
  Dokuments.

**Offene Prüffrage vor jeder Festlegung:** Mesh-Terrain-Systeme dieser Art laufen in der
Praxis oft am besten mit **Nanite fürs Terrain-Mesh** und Höhlen-Innenräume werden in
solchen Tutorials häufig mit **Lumen** ausgeleuchtet (gebackenes Licht ist bei
prozedural veränderbarer Höhlengeometrie schwer zu pflegen). [CLAUDE.md](../../CLAUDE.md)
verbietet Lumen fürs POC vollständig und Nanite explizit nur für Charaktere — Nanite
speziell fürs Terrain wäre also vermutlich nicht automatisch ausgeschlossen, aber die
Lumen-Frage bei Höhlen ist ungeklärt und wurde nicht am Volltranskript verifiziert. Vor
Einsatz: im Editor testen, ob Mesh Terrain mit Lightmass/ohne Lumen sinnvoll nutzbar ist.

**Einordnung:** Werkzeug-Kandidat für die spätere Open-World-Phase (Heimatreiche/
Frontier), nicht für den aktuellen Battleground-Vertical-Slice. Tatsächliche Erprobung
gehört in die Terminal-Session mit Unreal-MCP-Zugriff (siehe CLAUDE.md → "zwei getrennte
Arbeitsumgebungen").

## Offene Fragen

- Wie viele Regionen brauchen einen eigenen Gruppen-Content-Hub (Instanz-Eingang, Rastplatz)
  vs. reine Solo-Quest-Fläche? (Ansatz oben: Instanz-Regionen sind 2, 4, 5 — Osric/Erik/
  Eamon, Leofric/Ingvar/Tadhg, Hollow Sentinel/Iron Wolf/Bramble Warden.)
- Reisesystem zwischen Hauptstadt und weit entfernten Regionen (z. B. Region 6/7) —
  Pferde/Portale/schnelles Reisen, oder bewusst Fußweg als Zeitsenke wie im klassischen
  DAOC?
- Wie hart ist die Levelgrenze zwischen Bändern (harte Mob-Level-Wand vs. weicher
  Übergang)? Hängt vom noch nicht existierenden Level-/Progressionssystem ab (siehe
  [SYSTEMS.md](../../SYSTEMS.md)).
- Übergang Region 7 → Frontier-Zone: eigener Ladebereich/Portal, oder nahtlos begehbar?
  Beeinflusst, ob die Frontier-Karte technisch ein eigenes Level bleibt oder ins
  Heimatreich-Level hineinwächst.
- Kartenmaßstab/Laufzeiten — analog zur offenen Frage in der Frontier-Vision, noch nicht
  festgelegt.
