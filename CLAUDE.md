# Camelot: Realms at War — Projektleitfaden

Spiritual Successor zu Dark Age of Camelot (UE5.8), Drei-Fraktionen-RvR. Details/Begründungen: [README.md](README.md). Kosten: [COSTS.md](COSTS.md). Klassen-Design: [CLASSES.md](CLASSES.md). Skill-/Stat-/GUI-Schemas: [SYSTEMS.md](SYSTEMS.md). Fortschritt: [GitHub Project Board](https://github.com/users/Unaragan/projects/1).

## Nicht verhandelbare Regeln

- **Jeder spieler-sichtbare Text ist `FText`**, nie `FString`/hartcodiert. C++: `LOCTEXT`/`NSLOCTEXT`. Blueprints: `Text`-Typ. DataTables: `FText`-Spalten. Zielsprachen: en (Quelle), de, fr, es.
- **Kein Lumen, kein Nanite für Charaktere.** Gebackenes Licht (Lightmass). Ziel-Hardware ist Mittelklasse, nicht der Entwicklerrechner.
- **Gameplay-Klassen referenzieren Mesh/Material als austauschbare Variable**, nie hart verdrahtet — Platzhalter-Toon-Art muss später ersetzbar sein, ohne Logik anzufassen. Standard-Mannequin-Skeleton für Animations-Retargeting.
- **C++ für Kernsysteme, Blueprints/DataTables für Content & Balancing.**
- **Kein Original-DAOC-Content** (Assets, Texte, exakte Markennamen). Namensgebung siehe [CLASSES.md](CLASSES.md) — Archetypen ja, unverwechselbare erfundene Namen nein.

## Aktuelle Priorität

Battleground-Vertical-Slice vor Startgebiet/Tutorial-Zone (siehe Roadmap in README.md). Zwei Fraktionen zum Einstieg, dritte kommt später dazu.

## Scope-Disziplin (Nicht-jetzt)

Crafting, Housing, offene persistente Welt, Login-/Account-Server, tiefe Itemization, mehr als 3 Klassen pro Fraktion, Startgebiet, große Netzwerk-Skalierung (100+ vs. 100+). Vollständige Liste: README.md → "Nicht-jetzt-Liste".

## Server/Hardware-Kontext

Linux-VPS für späteres Dedicated-Server-Hosting (Contabo). Zwei vorhandene Testgeräte: HP ZBook (unteres Performance-Ziel), Ryzen-9/RTX-40er-Desktop (High-End-Referenz) — beide gegen testen, nicht nur den Entwicklerrechner.

## Bekannte technische Einschränkung

Git LFS auf GitHub Free hat nur 1 GB Speicher/Monat — bei wachsendem Asset-Umfang im Auge behalten (siehe COSTS.md).
