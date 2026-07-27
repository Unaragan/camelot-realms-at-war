# Camelot: Realms at War — Projektleitfaden

Spiritual Successor zu Dark Age of Camelot (UE5.8), Drei-Fraktionen-RvR. Details/Begründungen: [README.md](README.md). Kosten: [COSTS.md](COSTS.md). Klassen-Design: [CLASSES.md](CLASSES.md). Character-Struktur pro Reich: [Docs/Design/Character_Structure_Realms.md](Docs/Design/Character_Structure_Realms.md). Rüstungs- & Waffen-Naming: [Docs/Design/Armor_Weapons_Naming.md](Docs/Design/Armor_Weapons_Naming.md). GUI/UI-Design: [Docs/Design/GUI_UI_Design.md](Docs/Design/GUI_UI_Design.md). Skill Tree & Talent-Progression: [Docs/Design/SkillTree_Progression.md](Docs/Design/SkillTree_Progression.md). Chat-System: [Docs/Design/Chat_System.md](Docs/Design/Chat_System.md). Crafting & Professions: [Docs/Design/Crafting_Professions.md](Docs/Design/Crafting_Professions.md). Material-Lieferanten (POIs): [Docs/Design/Material_Suppliers_POI.md](Docs/Design/Material_Suppliers_POI.md). Auktionshaus (Realm-Marktplatz): [Docs/Design/Auction_House.md](Docs/Design/Auction_House.md). Skill-/Stat-/GUI-Schemas: [SYSTEMS.md](SYSTEMS.md). Überholte/archivierte Inhalte (v. a. Lyra-Implementierungsdetails vor dem Architekturwechsel): [Archive.md](Archive.md). Unreal-MCP-Setup: [SETUP.md](SETUP.md). Wiederverwendbare Terminal-Prompts: [PROMPTS.md](PROMPTS.md). NPC-Namenspools: [NPC_NAMES.md](NPC_NAMES.md). Frontier-NPCs & Questline-Backlog: [Docs/Design/Frontier_NPCs_and_Questlines.md](Docs/Design/Frontier_NPCs_and_Questlines.md). Epic-Questlines (Lv 1–50) je Reich: [Albion](Docs/Design/Albion_Epic_Questline.md), [Midgard](Docs/Design/Midgard_Epic_Questline.md), [Hibernia](Docs/Design/Hibernia_Epic_Questline.md). Quest-Content & Umsetzungsstand (zentraler Tracker): [Docs/Design/Quests.md](Docs/Design/Quests.md).

## Wichtig: zwei getrennte Arbeitsumgebungen

- **GUI-Chat** (diese Art von Session): Planung, Recherche, GitHub/Repo-Arbeit, Dokumentation. Kein Zugriff auf Unreal-MCP-Werkzeuge, kein `/plugin`-Befehl verfügbar.
- **Terminal mit laufender `claude`-Sitzung**: einzige Umgebung, in der Unreal-MCP-Werkzeuge (direkte Editor-Steuerung) funktionieren. Siehe SETUP.md. Fortschritt: [GitHub Project Board](https://github.com/users/Unaragan/projects/1).
- **Beide Sitzungen committen/pushen eigenständig ins selbe Repo.** Deshalb: vor Beginn neuer Arbeit immer erst `git pull`, um nicht auf einem veralteten Stand aufzusetzen oder Commits der jeweils anderen Sitzung zu übersehen.

## Definition of Done (Editor-Arbeit)

Eine Terminal-Sitzung darf eine Änderung **nicht** als "behoben"/"verifiziert" melden, nur weil Logs fehlerfrei sind oder Objekt-Properties den erwarteten Wert zeigen. Log-/Property-Checks bestätigen nur "keine Fehlermeldung", nicht "sieht beim tatsächlichen Spielen richtig aus" — das ist wiederholt auseinandergefallen (Animation, Kamera, Instanz-Anzahl). Als "erledigt" gilt eine Änderung erst, wenn der Nutzer sie selbst in einer laufenden Play-Session (nicht nur Edit-Modus) bestätigt hat, idealerweise mit Screenshot. Bis dahin: als "vorgenommen, ungetestet" oder "vorgenommen, wartet auf Bestätigung" melden, nicht als erledigt.

## Nicht verhandelbare Regeln

- **Jeder spieler-sichtbare Text ist `FText`**, nie `FString`/hartcodiert. C++: `LOCTEXT`/`NSLOCTEXT`. Blueprints: `Text`-Typ. DataTables: `FText`-Spalten. Zielsprachen: en (Quelle), de, fr, es.
- **Kein Lumen, kein Nanite für Charaktere.** Gebackenes Licht (Lightmass). Ziel-Hardware ist Mittelklasse, nicht der Entwicklerrechner. *Gilt für POC/Vertical Slice.* Artdirection/Rendering-Technik fürs finale Produkt (ggf. Lumen/Nanite/realistischer Look) ist bewusst noch offen — siehe [Docs/Design/OpenWorld_Frontier_3Realms_Vision.md](Docs/Design/OpenWorld_Frontier_3Realms_Vision.md).
- **Gameplay-Klassen referenzieren Mesh/Material als austauschbare Variable**, nie hart verdrahtet — Platzhalter-Toon-Art muss später ersetzbar sein, ohne Logik anzufassen. Standard-Mannequin-Skeleton für Animations-Retargeting.
- **Blueprint-first, kein neuer eigener C++-Code.** Neue Inhalte (Klassen, Fähigkeiten, Items) werden als Blueprints gebaut, nicht als neue .cpp/.h-Dateien — passt zum Skillset des Nutzers (kein C++-Spezialist). GAS (Ability-System) wird seit dem Architekturwechsel (siehe unten) manuell per Blueprint auf Basis des Third Person Templates nachgerüstet, nicht mehr von Lyra vorgefertigt übernommen. Eigener neuer C++-Code nur im Ausnahmefall, wenn in Blueprint wirklich nicht machbar.
- **Kein Original-DAOC-Content** (Assets, Texte, exakte Markennamen). Namensgebung siehe [CLASSES.md](CLASSES.md) — Archetypen ja, unverwechselbare erfundene Namen nein.

## Aktuelle Priorität

Battleground-Vertical-Slice vor Startgebiet/Tutorial-Zone (siehe Roadmap in README.md). Zwei Fraktionen zum Einstieg, dritte kommt später dazu.

## Scope-Disziplin (Nicht-jetzt)

Crafting, Housing, offene persistente Welt, Login-/Account-Server, tiefe Itemization, mehr als 3 Klassen pro Fraktion, Startgebiet, große Netzwerk-Skalierung (100+ vs. 100+). Vollständige Liste: README.md → "Nicht-jetzt-Liste".

## Server/Hardware-Kontext

Linux-VPS für späteres Dedicated-Server-Hosting (Contabo). Zwei vorhandene Testgeräte: HP ZBook (unteres Performance-Ziel), Ryzen-9/RTX-40er-Desktop (High-End-Referenz) — beide gegen testen, nicht nur den Entwicklerrechner.

## Bug-Tracking

Aktive, noch ungelöste Bugs werden als **GitHub Issues** mit Label `bug` angelegt (`gh issue create --label bug`), nicht nur in SETUP.md/SYSTEMS.md erwähnt. Beim Beheben: Issue schließen (`gh issue close <Nummer>`) mit Verweis auf die Doku-Stelle (SETUP.md-Stolperfallen-Tabelle oder SYSTEMS.md-Referenzimplementierung), die den Fix erklärt. Unterschied zur bisherigen Doku: SETUP.md/SYSTEMS.md sind die **Wissensbasis** (wie wurde X gelöst), GitHub Issues sind der **Statusüberblick** (was ist gerade offen) – `gh issue list --label bug` zeigt auf einen Blick, was noch aktiv ist.

## Bekannte technische Einschränkung

Git LFS auf GitHub Free hat nur 1 GB Speicher/Monat — mit Lyra als Basis (Content 1,8 GB, Plugins 1,6 GB) bereits eingetreten. Lösung: Content/Plugins bewusst nicht versioniert, separat pro Rechner über Epic Games Launcher installiert. Siehe SETUP.md → "Projekt-Basis: Lyra + Sync-Workflow".
