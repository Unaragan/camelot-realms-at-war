# Terminal-Prompt-Vorlagen

Wiederverwendbare Prompts für die Terminal-Claude-Code-Sitzung (MCP-verbunden mit dem Unreal Editor). Nicht jede Kleinanweisung – nur Muster, die wiederholt gebraucht werden, damit sie nicht bei jeder Nutzung neu erfunden werden müssen.

## Kampf-Charakter mit GAS-Fähigkeiten (Lyra-Basis)

Verwendet für: erste Ritter-Testcharaktere (POC, verworfen), Neuaufbau nach Lyra-Umstieg (Task #6), Vorlage für Task #7 (weitere Klassen).

> "Wir bauen auf der Lyra-Basis. Erstelle zwei kämpfende [Rollen]-Testcharaktere als Blueprint-Unterklassen von Lyras bestehenden GAS-/Charakter-Klassen (kein neuer C++-Code) – nutze wo möglich Lyras vorhandenes Ability-System-Framework statt eigener Attribute-Sets von Grund auf. Je [X] Health. Zwei Fähigkeiten: Angriff 1 fügt dem Ziel [X] Schaden zu; Angriff 2 fügt [X] Schaden zu und heilt den Angreifer um [X] Punkte. Beide nutzen einen modularen, wiederverwendbaren GameplayEffect mit Set-by-Caller-Magnitude statt eigener Effekte pro Fähigkeit. Zusätzlich: serverseitiger Winkel-Check zwischen Blickrichtung des Ziels und Position des Angreifers – liegt der Angreifer innerhalb eines ca. 120°-Kegels hinter dem Ziel, wird nur der Schadensanteil verdoppelt (Heilung bleibt unverändert). Platziere beide [Rollen] so, dass sie sich gegenseitig angreifen können, und teste per PIE."

**Anpassbare Platzhalter:** `[Rollen]` (z. B. Ritter/Paladin/Berserker aus CLASSES.md), `[X]` Health/Schaden/Heilung-Werte aus SYSTEMS.md.

## Beleuchtung bauen (schwarzer Spiel-Viewport)

> "Baue die Beleuchtung für das aktuelle Level ([Levelname])."

Nötig nach jedem neuen/geänderten Level, wenn Lumen deaktiviert ist (siehe CLAUDE.md) und der Play-Viewport schwarz bleibt.

## Status

🟡 Gerade erst angelegt (2026-07-21) – wird bei Bedarf um weitere wiederverwendbare Muster ergänzt (z. B. Battleground-Grayboxing, Vegetation platzieren), nicht rückwirkend für jede Einzelanweisung.
