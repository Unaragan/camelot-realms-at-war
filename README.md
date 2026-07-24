# Camelot: Realms at War

Spiritual Successor zu *Dark Age of Camelot* – ein taktisches Drei-Fraktionen-RvR-Spiel, entwickelt in Unreal Engine 5.

Dieses Repository ist **privat** und dient als Startpunkt/Projektgedächtnis für die Entwicklung. Kein Bezug zu, keine Assets aus dem Originalspiel.

## Vision

Der Kern von DAOC, den dieses Projekt einfangen will: **kleine, taktische Kämpfe zwischen drei asymmetrischen Fraktionen**, getragen von Klassenvielfalt und Gruppenspiel – nicht Open-World-MMO-Umfang, nicht Crafting/Housing (zumindest nicht am Anfang).

## Rahmenbedingungen

- **Team:** Solo-Entwicklung mit KI-Unterstützung (Claude Code/Fable) als Force-Multiplier für Code/Backend/Dokumentation; ggf. später punktuelle Unterstützung für Kunst/Sound (siehe Team & Mitstreiter)
- **UE5-Erfahrung:** Einsteiger – Lernkurve ist Teil des Plans, nicht ignoriert
- **Hintergrund:** IT/Netzwerke/Authentifizierung – Stärke liegt auf der Server-/Backend-Seite, nicht im Client/Rendering
- **Zielumfang (aktuell):** kleiner Multiplayer-Prototyp, kein persistentes Voll-MMO

## Namenswahl

"Camelot" ist als Begriff aus der Artus-Sage gemeinfrei. Geschützt ist die konkrete Marke "Dark Age of Camelot" (EA/Broadsword). Präzedenzfall: Mark Jacobs (Original-DAOC-Creator) nutzte für seinen eigenen Spiritual Successor ebenfalls "Camelot" im Titel (*Camelot Unchained*). Der Name hier bleibt bewusst auf Distanz zur Originalmarke.

## Tech-Stack

- **Engine:** Unreal Engine 5.8 (installiert unter `C:\Program Files\Epic Games\UE_5.8`)
- **Basis/Referenz:** Epics Lyra Starter Game (Team-System, Multiplayer-Grundgerüst, Gameplay Ability System bereits eingerichtet)
- **Kampfsystem:** Gameplay Ability System (GAS) – Klassen, Fähigkeiten, Cooldowns, Buffs/Debuffs, netzwerk-repliziert
- **Sprachen:** C++ für Kernsysteme, Blueprints/DataTables für Content & Balancing
- **Netzwerkmodell (Prototyp):** Listen Server; Dedicated Server erst wenn nötig
- **Auth/Persistenz:** bewusst zurückgestellt bis der Kampf-Loop steht (siehe Nicht-jetzt-Liste). Wenn nötig: separater Web-Service (Login/Token) außerhalb der Engine, UE-Server validiert beim Connect – passt zum eigenen Netzwerk-/Auth-Hintergrund.

## Lokalisierung (Multi-Language von Anfang an: DE, EN, FR, ES)

Bewusste Architekturentscheidung von Tag 1, nicht nachträglich: **jeder spieler-sichtbare Text als `FText`**, nie als rohes `FString`/hartcodierter String – in C++ über `LOCTEXT`/`NSLOCTEXT`, in Blueprints als `Text`-Typ, in DataTables (Klassen-/Item-/Fähigkeitsnamen) als `FText`-Spalten statt `FString`. Größere/wiederkehrende Textblöcke über String Tables.

**Workflow:** UE5s eingebautes Localization Dashboard – Zielsprachen `en` (Quelle), `de`, `fr`, `es` konfigurieren → Gather Text → Export `.po` → Übersetzung → Import → Kompilierung zu `.locres`, Sprache zur Laufzeit umschaltbar.

**Jetzt vs. später:** Infrastruktur (FText-Disziplin, Zielsprachen konfiguriert) von Anfang an. Tatsächliche Übersetzungsinhalte für DE/FR/ES kommen inkrementell, sobald es stabilen Content gibt – kein Blocker für den Vertical Slice.

## Art-Stil: Comic/Toon als bewusste Platzhalter- und Zielstrategie

Grafiken werden zunächst im **Comic-/Toon-Stil** angelegt (Cel-Shading Post-Process + Outline-Effekt) und später nach Grundfunktion ersetzt bzw. verfeinert. Gründe:

- Günstiger zu produzieren/beschaffen als Photorealismus, Marketplace/Fab-Assets kombinieren sich leichter
- Bessere Lesbarkeit im RvR-Chaos (Fraktionsfarben Karminrot/Blaugrün/Waldgrün kommen im flachen Shading klarer raus)
- Deckt sich mit den Performance-Zielen (siehe unten) – flache Materialien sind von Natur aus günstiger

**Technische Trennung für spätere Austauschbarkeit:** Gameplay-Klassen referenzieren Mesh/Material als austauschbare Variable/Data Asset, nicht hart verdrahtet. Standard-Mannequin-Skeleton für Animations-Retargeting, damit spätere hochwertigere Meshes dieselben Animationen nutzen können.

## Performance-Ziele

Ausdrücklicher Designgrundsatz: **Es darf nicht passieren, dass man nur mit High-End-Hardware spielen kann.** Orientierung an DAOC selbst, das von Anfang an für schwache Hardware ausgelegt war (niedrige Polygonzahlen, statisches/gebackenes Licht, einfache Shader, aggressives LOD/Culling) statt nachträglich runterskaliert zu werden.

Konkrete Entscheidungen für UE5:

- **Lumen deaktiviert** – klassisches gebackenes Licht (Lightmass) statt dynamischer globaler Beleuchtung
- **Nanite nicht für Charaktere** (ohnehin kaum für Skeletal Meshes nutzbar), bei Umgebung sparsam
- **Forward-Renderer prüfen** statt Deferred – günstiger bei vielen gleichzeitigen Charakteren
- UE5-Skalierungsstufen (Low–Epic) von Anfang an mittesten, nicht nur auf dem eigenen Entwicklerrechner
- Ziel-Hardware bewusst festlegen (Mittelklasse-GPU, ca. 5 Jahre alt) und regelmäßig dagegen testen

## Server & Test-Hardware

**Test-Hardware bereits vorhanden (kein Neukauf nötig):**
- **HP ZBook** (mobile Workstation, NVIDIA G100/Einstiegsklasse professionelle Grafik) – dient als unteres Performance-Ziel, da mobile Workstation-GPUs für Echtzeit-Rendering/Gaming schwächer sind als vergleichbare Gaming-Laptops
- **Desktop-PC mit AMD Ryzen 9 + NVIDIA RTX 40er-Serie** – dient als High-End-Referenz
- **Altes Notebook mit Linux** – dient als kostenloser LAN-Dedicated-Server-Testrechner (siehe Server-Tabelle unten). Für einen Dedicated Server zählt CPU/RAM mehr als GPU, schwache Hardware genügt, da kein Rendering nötig ist.

Damit ist Task #10 (Performance-Budget) von Anfang an gegen beide Enden des Spektrums testbar, ohne zusätzliche Anschaffung.

**Server-Bedarf entlang der Roadmap:**

| Phase | Bedarf | Kosten |
|---|---|---|
| Phase 0-1 (Lernen/Lyra-Setup) | Kein Server – Tests via "Play in Editor" mit mehreren lokalen Client-Instanzen | 0 € |
| Phase 2, Netzwerk-Grundgerüst (Task #5) | Listen Server + Epic Online Services (EOS, fest in UE5 integriert, kostenlose Free-Tier, übernimmt NAT-Traversal/Sessions) | 0 € |
| LAN-Dedicated-Server-Test (Task #5) | **Vorhandenes altes Linux-Notebook** – UE5 Linux-Dedicated-Server-Build (Cross-Compile-Toolchain nötig), headless betrieben, andere Rechner verbinden per LAN-IP | 0 € |
| Übergang zu echtem Internet-/24-7-Server – erst falls über das Heimnetz hinaus getestet werden soll oder ein Server ohne eigene laufende Hardware gebraucht wird | Kleiner VPS für headless Dedicated-Server-Build (CPU-Kerne wichtiger als GPU). Aktuelles Beispiel: Contabo Cloud VPS 4 (4 vCPU, 8 GB RAM, 100 GB SSD) | ~5,50 €/Monat (24-Monats-Vertragspreis, kürzere Laufzeit teurer; Preise zum Entscheidungszeitpunkt neu prüfen) |
| Falls Projekt wächst – breiterer Alpha/Beta-Test mit mehr gleichzeitigen Spielern | Größerer VPS, z. B. Contabo Cloud VPS 8 (8 vCPU, 24 GB RAM) oder vergleichbar | ~14 €/Monat aufwärts, je nach Spielerzahl |

Hinweis: Hetzner-Preise sind laut Recherche seit 15.06.2026 stark gestiegen (teils 2,5–3x) – Contabo ist aktuell die günstigere, verifizierte Alternative; Anbieter zum jeweiligen Entscheidungszeitpunkt neu vergleichen.

**Betriebssystem:** Linux (nicht Windows Server) – keine zusätzlichen OS-Lizenzkosten, UE5 Dedicated Server unterstützt Linux nativ.

**Vollständige Kosten-Tracking-Tabelle (laufend, geplant, Freeware-Tools):** siehe [COSTS.md](COSTS.md).

## Skalierung: MMO-Realität einordnen

UE5s Standard-Replikation ist für Action-Multiplayer ausgelegt (Dutzende bis ~100 Spieler), nicht für Tausende. Referenzprojekt: *Ashes of Creation* wird mit UE5 gebaut und zielt auf große Belagerungsschlachten (~250–500 Spieler), benötigt dafür aber massiv angepasste Netzwerkschicht (Interest-Management, Server-Meshing, Iris-Replikation) – ein mehrjähriges Engineering-Projekt, kein Solo-Feature.

Realitätscheck zu DAOC selbst: auch die legendären Keep-Sieges waren nie wirklich 1000 gleichzeitig im Nahkampf-Radius – Serverpopulation groß, tatsächliche Kampfgröße pro Zone eher Dutzende bis ~150 pro Seite. Das DAOC-Gefühl ist auch mit deutlich kleineren Zahlen erreichbar. Große Netzwerk-Skalierung ist eine "falls das Projekt wächst und ein Team dazukommt"-Frage, keine Tag-1-Architekturentscheidung – die Netzwerkschicht lässt sich später austauschen, ohne Kampfsystem/Klassen (GAS) neu zu bauen.

## Roadmap

**Phase 0 – UE5-Grundlagen** 🟡 *in Arbeit*
Blueprint-Basics (Epics "Your First Hour"), danach gezielt Multiplayer/Replikation lernen, kleine Wegwerf-Projekte vor dem eigentlichen Projekt.

**Phase 1 – Technische Basis**
Lyra als Ausgangsbasis einrichten, Projektstruktur (C++/Blueprint-Aufteilung) festlegen, Rendering-Pipeline (siehe Performance-Ziele) konfigurieren.

**Phase 2 – Vertical Slice: Battleground zuerst, Startgebiet später**

Priorität liegt auf dem Beweis, dass der Kampf-Kern Spaß macht – nicht auf Spieler-Onboarding, das erst relevant wird, sobald Außenstehende getestet werden.

1. Zwei Spieler verbunden, synchron sichtbar (Netzwerk-Grundgerüst steht)
2. Eine Klasse, Auto-Attack + 1-2 Fähigkeiten via GAS, Health/Tod/Respawn repliziert
3. Zweite Klasse (2 Fraktionen zum Start, reduziert Setup-Aufwand) – testet asymmetrisches Klassengefühl
4. **Battleground-Map**: klein, symmetrisch, ein zentrales Ziel (Flagge/Node), Grayboxing im Toon-Look reicht – Vorbild: DAOCs eigene kleine RvR-Zonen (Thidranki, Braemar), nicht die große Frontier-Welt
5. Playtest mit Freunden, Fähigkeiten nachjustieren
6. Dritte Fraktion/Klasse ergänzen, sobald der Zwei-Fraktionen-Kampf schon überzeugt

**Startgebiet (Tutorial-Zone):** bewusst zurückgestellt bis nach dem Vertical Slice – lohnt sich erst, wenn Playtester/Mitstreiter eingebunden werden, die das Projekt nicht schon "von innen" kennen. Dann pro Fraktion ein kleines Startgebiet (Vorbild: DAOCs Cotswold etc.) mit Übergang ins Battleground.

**Danach:** Entscheidung, ob/wie Richtung größerer Welt oder Persistenz erweitert wird – erst wenn der Kern nachweislich Spaß macht.

## Team & Mitstreiter

Frühere DAOC-Nachfolgeprojekte aus der Community sind wiederholt im Sand verlaufen. Wiederkehrende Ursachen: Vision-Dokumente statt spielbarem Prototyp, reine Freiwilligen-Teams ohne Verbindlichkeit, zu großer Scope von Tag 1, Design-by-Committee, IP-Angst.

**Strategie diesmal: erst zeigen, dann rekrutieren.** Nicht mit einer Idee Leute suchen, sondern mit dem spielbaren Vertical Slice (Phase 2) – das ist der Unterschied zu "noch ein totes Fanprojekt".

- KI-Unterstützung (Claude Code/Fable) federt einen Teil der Systems-/Backend-Programmierung ab – historisch die größte Ausfallursache bei Community-Projekten
- Nicht ersetzbar: 3D-Art/Animation von Grund auf, menschliches Playtesting-Urteil, echte Teammitglieder für parallelisierbare Arbeit
- Wenn Rekrutierung ansteht: DAOC-Community (Subreddit/Discords) für Nostalgie-getriebene Mitstreiter, Unreal-Slackers-Discord/r/unrealengine für Skill, itch.io/IndieDB-Devlogs für organisches Anziehen durch sichtbaren Fortschritt
- Für einzelne Assets eher bezahlte Auftragsarbeit als offene Freiwilligen-Suche erwägen – verbindlicher, kein Team-Management nötig

## Unreal MCP: Claude Code direkt im Editor

Über Epics offizielles Plugin kann Claude Code direkt mit dem Unreal Editor verbunden werden (Actors spawnen, Blueprints/Materialien bearbeiten, GAS-Fähigkeiten konfigurieren) – ohne unzuverlässiges GUI-Klicken über Screenshots. Funktioniert nur in einer echten Terminal-Sitzung, nicht in GUI-Chat-Oberflächen. Vollständige Einrichtung inkl. gelöster Stolperfallen: [SETUP.md](SETUP.md).

## Werkzeug-Aufteilung: Copilot vs. Claude

Für einfache, in sich geschlossene Code-Aufgaben (einzelne C++-Klasse nach bekanntem Muster, DataTable-Struct, Utility-Funktion, Testgerüst) wird **GitHub Copilot** (kostenlos verfügbar) direkt im Editor genutzt – schnell, kein Projektkontext nötig. Für alles, was Projektkontext über mehrere Dateien, Architekturentscheidungen oder Planung braucht, bleibt **Claude Code** der Ansprechpartner.

**Faustregel:** "Erstelle X nach folgendem Muster" → Copilot. "Wie sollten wir X strukturieren" / "was hat das für Auswirkungen auf Y" → Claude.

**Auch für Bild-/Konzept-Art:** Copilot (bzw. dessen Bildgenerierung) für Moodboards/Referenzbilder nutzen, nicht Claudes SVG-Zeichnungen – im direkten Vergleich (Battleground-Moodboards) war Copilot spürbar besser, siehe [Docs/Design/OpenWorld_Frontier_3Realms_Vision.md](Docs/Design/OpenWorld_Frontier_3Realms_Vision.md).

## Referenzen & Recherche

- **Dawn of Light (DOL):** Open-Source-Server-Emulator (GPL) für DAOC – wertvolle Referenz zum *Verstehen* von Kampf-/RvR-Formeln, nicht zum direkten Übernehmen von Code (Lizenz beachten)
- Eigene Spielerfahrung als primäre Design-Referenz für Klassenbalance und RvR-Gefühl
- `/inspect`-Exports (eigene Charakterdaten) als Kalibrierungsreferenz für Itemization-Wertebereiche, nicht zum Import
- **Ashes of Creation** als Referenz für UE5 + Großschlachten-Netzwerkarchitektur (siehe Skalierung)

## Nicht-jetzt-Liste

Bewusst zurückgestellt, um Scope-Explosion zu vermeiden:

- Crafting — für die Release-Version vorgesehen (Materialien per Kauf gegen
  Ingame-Currency oder per Farmen), siehe
  [Docs/Design/OpenWorld_HomeRealms_Vision.md](Docs/Design/OpenWorld_HomeRealms_Vision.md)
  → "Pacing"
- Housing — als Addon nach Release vorgesehen, siehe selbe Quelle
- Offene, persistente Welt
- Login-/Account-Server, Datenbank-Persistenz
- Tiefe Itemization/Loot-Systeme
- Mehr als 3 Klassen pro Fraktion
- Startgebiet/Tutorial-Zone (bis nach dem Vertical Slice) — Konzeptidee für die spätere
  Heimatreich-Open-World bereits skizziert, siehe
  [Docs/Design/OpenWorld_HomeRealms_Vision.md](Docs/Design/OpenWorld_HomeRealms_Vision.md)
- Große Netzwerk-Skalierung (100+ vs. 100+) – erst falls/wenn das Projekt wächst

## Status

🟢 Unreal Engine 5.8 installiert, Testprojekt läuft. Aktuell in Phase 0 (UE5-Grundlagen lernen).
