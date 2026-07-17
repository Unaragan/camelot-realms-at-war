# Setup: Unreal MCP (Claude Code ↔ Unreal Editor)

Anleitung, um Claude Code direkt mit dem Unreal Editor zu verbinden (Actors spawnen, Blueprints/Materialien bearbeiten, GAS-Fähigkeiten konfigurieren, u. v. m. – ohne blindes GUI-Klicken). Basiert auf Epics offiziellem Plugin [`unreal-engine-skills-for-claude-code-plugin`](https://github.com/EpicGames/unreal-engine-skills-for-claude-code-plugin).

## Wichtige Voraussetzung: richtiges Fenster benutzen

**Diese Einrichtung funktioniert nur in einer echten Terminal-Sitzung** (`claude` direkt in PowerShell/Git Bash/Eingabeaufforderung gestartet) – **nicht** in GUI-basierten Claude-Oberflächen (z. B. Desktop-App-Chats). Slash-Befehle wie `/plugin` sind dort nicht verfügbar. Für alles, was direkt in der Unreal Engine passieren soll, muss im Terminal-Fenster gearbeitet werden.

## Schritt 1: MCP-Server im Unreal Editor starten

1. Plugin aktivieren: **Edit → Plugins** → nach "MCP" suchen → **ModelContextProtocol** und **AllToolsets** aktivieren → Editor neu starten
2. Konsole öffnen, um Befehle einzugeben:
   - **Bei deutscher Tastatur (QWERTZ) funktioniert die `~`-Taste oft nicht** – stattdessen: **Window → Output Log** öffnen, dort unten im Eingabefeld ("Cmd") die Befehle eintippen
   - Alternativ: Taste links neben "1", über Tab (meist `^`/`°` beschriftet) probieren
   - Alternativ: Konsolen-Taste in den Editor-Eingabeeinstellungen neu belegen
3. Im Konsolen-/Output-Log-Eingabefeld:
   ```
   ModelContextProtocol.StartServer
   ```
   Läuft standardmäßig auf Port 8000.

## Schritt 2: Plugin in Claude Code installieren (im Terminal!)

Das Epic-Repo ist als **einzelnes Plugin** aufgebaut (`.claude-plugin/plugin.json`), nicht als Marketplace-Katalog (`marketplace.json`). Direktes `/plugin marketplace add EpicGames/...` schlägt deshalb fehl ("Marketplace file not found"). Lösung: lokaler Marketplace-Wrapper, der im Repo liegt unter [`tools/ue-marketplace/`](tools/ue-marketplace/).

Im Terminal, `claude` gestartet, dann **zwei getrennte Befehle, jeder mit eigenem Enter**:

```
/plugin marketplace add <Pfad-zum-Repo>/tools/ue-marketplace
```

Danach als neue Eingabe:

```
/plugin install unreal-engine-skills@ue-local-marketplace
```

Bei der Installationsabfrage **"Install for you (user scope)"** wählen.

## Bekannte Stolperfallen (bereits gelöst, falls sie wieder auftauchen)

| Fehler | Ursache | Lösung |
|---|---|---|
| `Host key verification failed` | GitHub noch nicht in `known_hosts` bekannt | `ssh-keyscan -t ed25519,rsa,ecdsa github.com >> ~/.ssh/known_hosts` |
| `Permission denied (publickey)` | Kein SSH-Key bei GitHub hinterlegt (Account nutzte bisher nur HTTPS via `gh`) | SSH-Key erzeugen (`ssh-keygen -t ed25519`), dann `gh ssh-key add ~/.ssh/id_ed25519.pub` (braucht ggf. `gh auth refresh -s admin:public_key`) |
| `/plugin isn't available in this environment` | Falsches Fenster – GUI-Chat statt Terminal | Im echten Terminal mit laufender `claude`-Sitzung arbeiten |
| Zwei Befehle werden als einer interpretiert | Beide Zeilen ohne Enter dazwischen eingegeben | Jeden Befehl einzeln eingeben, auf Antwort warten, dann nächsten |

## Nach erfolgreicher Installation

Test im Terminal: *"Liste alle verfügbaren Unreal-MCP-Werkzeuge auf"* oder *"Spawne einen Actor in der aktuellen Szene"* – bei laufendem MCP-Server im Editor sollte das funktionieren.

## Status

🟢 Erfolgreich eingerichtet (Stand: 2026-07-18). Nutzung erfolgt im Terminal-Fenster, nicht im GUI-Chat.
