# Camelot: Realms at War

Spiritual Successor zu *Dark Age of Camelot* – ein taktisches Drei-Fraktionen-RvR-Spiel, entwickelt in Unreal Engine 5.

Dieses Repository ist **privat** und dient als Startpunkt/Projektgedächtnis für die Entwicklung. Kein Bezug zu, keine Assets aus dem Originalspiel.

## Vision

Der Kern von DAOC, den dieses Projekt einfangen will: **kleine, taktische Kämpfe zwischen drei asymmetrischen Fraktionen**, getragen von Klassenvielfalt und Gruppenspiel – nicht Open-World-MMO-Umfang, nicht Crafting/Housing (zumindest nicht am Anfang).

## Rahmenbedingungen

- **Team:** Solo-Entwicklung (ggf. später punktuelle Unterstützung für Kunst/Sound)
- **UE5-Erfahrung:** Einsteiger – Lernkurve ist Teil des Plans, nicht ignoriert
- **Hintergrund:** IT/Netzwerke/Authentifizierung – Stärke liegt auf der Server-/Backend-Seite, nicht im Client/Rendering
- **Zielumfang (aktuell):** kleiner Multiplayer-Prototyp, kein persistentes Voll-MMO

## Namenswahl

"Camelot" ist als Begriff aus der Artus-Sage gemeinfrei. Geschützt ist die konkrete Marke "Dark Age of Camelot" (EA/Broadsword). Präzedenzfall: Mark Jacobs (Original-DAOC-Creator) nutzte für seinen eigenen Spiritual Successor ebenfalls "Camelot" im Titel (*Camelot Unchained*). Der Name hier bleibt bewusst auf Distanz zur Originalmarke.

## Tech-Stack (Stand: Planung)

- **Engine:** Unreal Engine 5.x
- **Basis/Referenz:** Epics Lyra Starter Game (Team-System, Multiplayer-Grundgerüst, Gameplay Ability System bereits eingerichtet)
- **Kampfsystem:** Gameplay Ability System (GAS) – Klassen, Fähigkeiten, Cooldowns, Buffs/Debuffs, netzwerk-repliziert
- **Sprachen:** C++ für Kernsysteme, Blueprints/DataTables für Content & Balancing
- **Netzwerkmodell (Prototyp):** Listen Server; Dedicated Server erst wenn nötig
- **Auth/Persistenz:** bewusst zurückgestellt bis der Kampf-Loop steht (siehe Nicht-jetzt-Liste). Wenn nötig: separater Web-Service (Login/Token) außerhalb der Engine, UE-Server validiert beim Connect – passt zum eigenen Netzwerk-/Auth-Hintergrund.

## Roadmap

**Phase 0 – UE5-Grundlagen**
Blueprint-Basics, danach gezielt Multiplayer/Replikation lernen, kleine Wegwerf-Projekte vor dem eigentlichen Projekt.

**Phase 1 – Technische Basis**
Engine-Version fixieren, Lyra als Ausgangsbasis einrichten, Projektstruktur (C++/Blueprint-Aufteilung) festlegen.

**Phase 2 – Vertical Slice**
1. Zwei Spieler verbunden, synchron sichtbar (Netzwerk-Grundgerüst steht)
2. Eine Klasse, Auto-Attack + 1-2 Fähigkeiten via GAS, Health/Tod/Respawn repliziert
3. Zweite & dritte Klasse (Fraktions-Archetypen) – testet asymmetrisches Klassengefühl
4. Kleine Arena-Map mit RvR-Ziel (z. B. Flaggenpunkt)
5. Playtest mit Freunden, Fähigkeiten nachjustieren

**Danach:** Entscheidung, ob/wie Richtung größerer Welt oder Persistenz erweitert wird – erst wenn der Kern nachweislich Spaß macht.

## Referenzen & Recherche

- **Dawn of Light (DOL):** Open-Source-Server-Emulator (GPL) für DAOC – wertvolle Referenz zum *Verstehen* von Kampf-/RvR-Formeln, nicht zum direkten Übernehmen von Code (Lizenz beachten)
- Eigene Spielerfahrung als primäre Design-Referenz für Klassenbalance und RvR-Gefühl
- `/inspect`-Exports (eigene Charakterdaten) als Kalibrierungsreferenz für Itemization-Wertebereiche, nicht zum Import

## Nicht-jetzt-Liste

Bewusst zurückgestellt, um Scope-Explosion zu vermeiden:

- Crafting
- Housing
- Offene, persistente Welt
- Login-/Account-Server, Datenbank-Persistenz
- Tiefe Itemization/Loot-Systeme
- Mehr als 3 Klassen pro Fraktion

## Status

🟡 Planungsphase – noch kein Code.
