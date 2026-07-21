# Kosten-Tracking

Laufende Dokumentation aller Kosten für Camelot: Realms at War – aktuell anfallend und geplant für spätere Phasen. Alle Beträge sind Schätzungen zum Zeitpunkt der Eintragung und sollten vor tatsächlicher Zahlung neu geprüft werden (Preise ändern sich, siehe Notizen).

## Laufend (aktuell anfallend)

| Kategorie | Posten | Kosten | Intervall | Status | Notiz |
|---|---|---|---|---|---|
| KI-Unterstützung | Claude (Pro/Max) | 100–200 $ | monatlich | aktiv | Max 5x als Startpunkt empfohlen, ggf. 20x bei Bedarf |

## Einmalig / geplant (noch nicht angefallen)

| Kategorie | Posten | Kosten | Status | Notiz |
|---|---|---|---|---|
| Server | Dedizierter VPS (**Linux**, z. B. Contabo Cloud VPS 4) | ~5,50 €/Monat | zurückgestellt – LAN-Test läuft stattdessen kostenlos über vorhandenes Linux-Notebook | Erst relevant, falls über Internet/außerhalb des Heimnetzes getestet werden soll oder ein 24/7-Server ohne eigene laufende Hardware gebraucht wird |
| Server | Größerer VPS bei Wachstum (z. B. Contabo Cloud VPS 8) | ~14 €/Monat aufwärts | geplant, falls Spielerzahl wächst | Linux |
| Marken/IP | DPMA-Markenanmeldung (nur Deutschland) | ~290 € | zurückgestellt bis kurz vor Release | + ggf. Anwaltskosten |
| Marken/IP | EUIPO-Markenanmeldung (EU-weit) | ~850 € | zurückgestellt bis kurz vor Release | Alternative/Ergänzung zu DPMA |
| Marken/IP | USPTO-Markenanmeldung (USA) | ~250–350 $ | zurückgestellt, falls US-Markt relevant wird | |
| Domain/Branding | Domain + Social-Handles (camelotrealmsatwar.*) | wenige €/Jahr | jederzeit machbar, günstiger Zwischenschritt | Kein Ersatz für Markenschutz, aber sinnvoll früh zu sichern |
| Content | Marketplace/Fab-Assets (Platzhalter-Toon-Art) | variabel | offen, noch nicht budgetiert | Abhängig von Umfang der benötigten Platzhalter-Assets |

## Bereits gedeckt (kein zusätzlicher Kostenpunkt)

| Kategorie | Posten | Kosten | Notiz |
|---|---|---|---|
| Engine | Unreal Engine 5.8 | 0 € | Kostenlos bis 1 Mio. $ Bruttoumsatz, danach 5 % Royalty (Epic-Standardmodell) |
| Tools | Epic Games Launcher | 0 € | |
| Repo | GitHub (privates Repo) | 0 € | Im Rahmen des bestehenden GitHub-Accounts |
| Test-Hardware | HP ZBook (unteres Performance-Ziel) | 0 € | bereits vorhanden |
| Test-Hardware | Ryzen 9 + RTX 40er Desktop (High-End-Referenz) | 0 € | bereits vorhanden |
| Server | Altes Linux-Notebook (LAN-Dedicated-Server-Test, Task #5) | 0 € | bereits vorhanden, ersetzt VPS fürs LAN-Testing |

## Performance-Analyse-Tools (Freeware, für später)

Für Phase 2+ (Performance-Budget, Task #10) und den späteren Linux-Server-Betrieb – alle kostenlos:

| Tool | Einsatzbereich | Plattform | Notiz |
|---|---|---|---|
| **Unreal Insights** | CPU/GPU/Memory-Profiling im Spiel | in UE5 integriert | Kostenlos, direktes Engine-Tooling – erster Anlaufpunkt |
| **UE5 Stat-Kommandos** (`stat unit`, `stat fps`, `stat gpu`, `stat memory`) | Schnelle Live-Diagnose während des Testens | in UE5 integriert | Kostenlos, sofort nutzbar |
| **MSI Afterburner + RivaTuner Statistics Server** | FPS/GPU-Overlay bei externen Tests (HP ZBook, Ryzen-9-Desktop) | Windows | Kostenlos, Industriestandard für Gaming-Benchmarks |
| **PresentMon** (Intel, Open Source) | Detaillierte Frame-Time-Analyse | Windows | Kostenlos |
| **htop** / **Glances** | Live-Systemübersicht (CPU/RAM) auf dem Linux-Server | Linux (VPS) | Kostenlos, direkt per SSH nutzbar |
| **Netdata** | Echtzeit-Performance-Dashboard für den VPS | Linux (VPS) | Kostenlose Community Edition, populär für kleine VPS |
| **Prometheus + Grafana** | Langfristiges Server-Monitoring mit Dashboards | Linux (VPS) | Kostenlos/Open Source, mehr Einrichtungsaufwand – erst relevant bei mehr Last |

## Status

🟢 Zuletzt aktualisiert: 2026-07-16.
