# Setup: Unreal MCP (Claude Code ↔ Unreal Editor)

Anleitung, um Claude Code direkt mit dem Unreal Editor zu verbinden (Actors spawnen, Blueprints/Materialien bearbeiten, GAS-Fähigkeiten konfigurieren, DataTables, UMG-Widgets, u. v. m. – ohne blindes GUI-Klicken). Basiert auf Epics offiziellem Plugin [`unreal-engine-skills-for-claude-code-plugin`](https://github.com/EpicGames/unreal-engine-skills-for-claude-code-plugin). Erfolgreich getestet: **41 Toolsets** registriert, inkl. aller GAS-Werkzeuge (GameplayTagsToolset, AttributeSetToolset, AbilitySystemInspectorToolset, GameplayCueToolset).

## Wichtige Voraussetzung: richtiges Fenster benutzen

**Diese Einrichtung funktioniert nur in einer echten Terminal-Sitzung** (`claude` direkt in PowerShell/Git Bash/Eingabeaufforderung gestartet) – **nicht** in GUI-basierten Claude-Oberflächen (z. B. Desktop-App-Chats). Slash-Befehle wie `/plugin` sind dort nicht verfügbar. Für alles, was direkt in der Unreal Engine passieren soll, muss im Terminal-Fenster gearbeitet werden.

## Schritt 1: Toolset-Plugins im Unreal Editor aktivieren

1. **Edit → Plugins** → nach **"Toolset"** suchen (nicht nur "MCP" – sonst tauchen die einzelnen Toolset-Plugins nicht auf!)
2. Mindestens aktivieren: **All Toolsets** (Aggregator), **EditorToolset**, **GASToolsets** (für unser Gameplay Ability System). Optional: **Niagara Toolsets**, **Physics Toolsets**, je nach Bedarf.
3. Zusätzlich nach **"MCP"** suchen und **ModelContextProtocol** aktivieren
4. **Editor komplett neu starten** – newly aktivierte Plugins greifen sonst nicht, auch wenn der Server schon läuft. Das haben wir live erlebt: ohne Neustart wurde nur 1 statt 41 Toolsets registriert.

## Schritt 2: Konsole finden (Windows/QWERTZ-Falle)

- **Bei deutscher Tastatur (QWERTZ) funktioniert die `~`-Taste oft nicht** – stattdessen: **Window → Output Log** öffnen, dort unten im Eingabefeld ("Cmd") die Befehle eintippen
- Alternativ: Taste links neben "1", über Tab (meist `^`/`°` beschriftet) probieren
- Alternativ: Konsolen-Taste in den Editor-Eingabeeinstellungen neu belegen

## Schritt 3: MCP-Server im Editor starten

Im Output-Log-Eingabefeld:
```
ModelContextProtocol.StartServer
```
Läuft standardmäßig auf Port 8000, Pfad `/mcp`.

## Schritt 4: Plugin/Skill in Claude Code installieren (im Terminal!)

Das Epic-Repo ist als **einzelnes Plugin** aufgebaut (`.claude-plugin/plugin.json`), nicht als Marketplace-Katalog (`marketplace.json`). Direktes `/plugin marketplace add EpicGames/...` schlägt deshalb fehl ("Marketplace file not found"). Lösung: lokaler Marketplace-Wrapper, der im Repo liegt unter [`tools/ue-marketplace/`](tools/ue-marketplace/).

Im Terminal, `claude` gestartet, **zwei getrennte Befehle, jeder mit eigenem Enter**:

```
/plugin marketplace add <Pfad-zum-Repo>/tools/ue-marketplace
```

Danach als neue Eingabe:

```
/plugin install unreal-engine-skills@ue-local-marketplace
```

Bei der Installationsabfrage **"Install for you (user scope)"** wählen.

**Wichtig:** Dieser Schritt installiert nur den *Skill* (die Anleitung/Beschreibung) – **nicht automatisch die eigentliche Serververbindung.** Das ist ein separater Schritt (5).

## Schritt 5: MCP-Server-Verbindung manuell registrieren

Claude-Sitzung kurz verlassen (`exit`) oder neues Terminal-Fenster, **außerhalb** der interaktiven `claude`-Sitzung:

```
claude mcp add --transport http unreal-mcp http://localhost:8000/mcp
```

Danach `claude` neu starten. Zur Kontrolle `/mcp` eingeben → "List/manage MCP servers" wählen → `unreal-mcp` sollte jetzt als verbundener Server auftauchen.

## Schritt 6: Testen

**Wichtig:** Der bloße Tool-Name allein (z. B. nur `list_toolsets` eintippen) wird nicht als Anweisung erkannt – das öffnet nur eine Detailansicht. Immer als **natürlichsprachlicher Satz**:

> "Rufe das Werkzeug list_toolsets bei unreal-mcp auf und zeig mir alle registrierten Toolsets"

Bei korrekter Einrichtung: 41 Toolsets, u. a. ActorTools, BlueprintTools, DataTableTools, MaterialTools, GameplayTagsToolset, AttributeSetToolset, AbilitySystemInspectorToolset, UMGToolSet.

## Projekt-Basis: Third Person Template + Sync-Workflow

Seit dem Architekturwechsel (2026-07-26, siehe README.md) basiert das Projekt auf Epics **Third Person Template** (Blueprint-Variante, Variant "None"). Der von Epic mitgelieferte Template-Content (`Content/ThirdPerson/`, `Content/Characters/Mannequins/`, `Content/Input/` usw.) ist **bewusst nicht versioniert** (`.gitignore`), analog zum bisherigen Lyra-Workflow, um das kostenlose GitHub-LFS-Kontingent (1 GB, siehe COSTS.md) nicht zu sprengen.

**Workflow für einen zweiten Rechner:**
1. In Unreal Editor: New Project → Games → Third Person → Blueprint, Target Platform Desktop, Quality Preset Scalable, Variant **None** → als `CamelotRAW_TP` im selben Repo-Pfad anlegen (z. B. `D:\Claude\camelot-realms-at-war`), dabei `Config/`, `Content/` und `.uproject` aus dem frisch erzeugten Projekt übernehmen (überschreiben die durch `git pull` geholten, aber gitignorierten lokalen Platzhalter nicht – nur einmalig nötig, falls diese Ordner lokal noch fehlen)
2. Danach `git clone`/`git pull` – synchronisiert nur `Config/`, `.uproject`, `Content/Camelot/` und eigene Doku, **nicht** den übrigen Template-Content
3. Eigener Content entsteht ausschließlich unter `Content/Camelot/` (siehe `.gitignore`-Ausnahme `!Content/Camelot/`) und wird darüber synchronisiert

## Bekannte Stolperfallen (bereits gelöst)

| Fehler | Ursache | Lösung |
|---|---|---|
| Nur 1 Toolset (`AgentSkillToolset`) statt 41 | Toolset-Plugins aktiviert, aber Editor nicht neu gestartet | Editor komplett neu starten nach Plugin-Aktivierung |
| `Host key verification failed` | GitHub noch nicht in `known_hosts` bekannt | `ssh-keyscan -t ed25519,rsa,ecdsa github.com >> ~/.ssh/known_hosts` |
| `Permission denied (publickey)` | Kein SSH-Key bei GitHub hinterlegt (Account nutzte bisher nur HTTPS via `gh`) | SSH-Key erzeugen (`ssh-keygen -t ed25519`), dann `gh ssh-key add ~/.ssh/id_ed25519.pub` (braucht ggf. `gh auth refresh -s admin:public_key`) |
| `/plugin isn't available in this environment` | Falsches Fenster – GUI-Chat statt Terminal | Im echten Terminal mit laufender `claude`-Sitzung arbeiten |
| Zwei Befehle werden als einer interpretiert | Beide Zeilen ohne Enter dazwischen eingegeben | Jeden Befehl einzeln eingeben, auf Antwort warten, dann nächsten |
| "Nur ein System-Reminder, keine Aufgabe" | Bloßer Tool-Name statt natürlichsprachlicher Anweisung eingegeben | Als vollständigen Satz formulieren, z. B. "Führe list_toolsets aus" |
| Server verbindet nicht trotz Plugin-Install | `/plugin install` registriert nur den Skill, nicht die Serververbindung | Zusätzlich manuell: `claude mcp add --transport http unreal-mcp http://localhost:8000/mcp` |
| Neue Assets fehlen im Git, obwohl im Editor sichtbar | Editor/Terminal arbeiteten an einer zweiten Projekt-Kopie außerhalb des Repos (`Documents\Unreal Projects\CamelotRAW`) statt am Repo selbst | **Nur noch eine Kopie verwenden:** Projekt liegt jetzt direkt unter `D:\Claude\camelot-realms-at-war\CamelotRAW_TP.uproject`. Immer darüber öffnen (z. B. via `tools/start-dev.ps1`), nie eine zweite Kopie parallel bearbeiten |
| `/mcp` zeigt `unreal-mcp` gar nicht erst in der Serverliste | `claude mcp add` (Schritt 5) wurde nur fürs alte Projekt gemacht; die Registrierung ist **projektbezogen** (`.mcp.json`), nicht global – ein neu angelegtes Projekt hat sie nicht automatisch | Schritt 5 bei jedem neuen/umgezogenen Projekt erneut ausführen: `claude mcp add --transport http unreal-mcp http://localhost:8000/mcp` |
| Plugin-Aktivierung wirkt nicht, obwohl Häkchen gesetzt | Experimentelle Plugins (z. B. "Unreal MCP") zeigen beim Aktivieren einen Bestätigungsdialog – Server-Start-Befehle *vor* dieser Bestätigung schlagen fehl, auch nach Neustart-Anschein | Bestätigungsdialog abnicken, **danach** Editor komplett neu starten, erst dann `ModelContextProtocol.StartServer` |
| Build schlägt fehl: `Visual Studio is installed, but is out of date or missing a valid C++ toolchain` | Installierte MSVC-Buildtools-Version unter dem von UE 5.8 geforderten Minimum (v14.38.33130, bevorzugt v14.50.35717 = VS 17.8+) | Visual Studio Installer öffnen → "Ändern" → Workload "Desktopentwicklung mit C++" sicherstellen, unter "Einzelne Komponenten" neueste "MSVC v143 – VS 2022 C++ x64/x86-Buildtools" installieren/aktualisieren, ggf. auch die VS-IDE selbst aktualisieren |
| `error CS0579: Doppeltes Attribut "AssemblyTitleAttribute"/"AssemblyVersionAttribute"` in `Lyra.Automation.AssemblyInfo.cs` beim AutomationTool-Build | Stale generierter .NET-Build-Cache unter `Build/Scripts/obj/` (entsteht v. a. nach Projekt-Verschiebungen) – ist bereits **zweimal** in dieser Session aufgetreten | `Build/Scripts/obj/`, `Build/Scripts/bin/` und `Build/Scripts/uatobj/` löschen (reine generierte Caches, ungefährlich), danach Build erneut anstoßen |
| Live Coding: `Could not spawn process ...UnrealBuildAccelerator/x64/UbaCli.exe. Error: 267` bei **jedem** Modul, "Failed to link patch (0.000s)" | Der Live-Coding-Hot-Patch-Schritt (versucht, eine neu kompilierte DLL in eine **bereits laufende** Editor-Instanz zu spritzen) scheitert konsequent an diesem UBA-Hilfsprogramm – auch mit AV komplett deaktiviert und Pfad-Ausnahmen. Der eigentliche Compile/Link-Schritt selbst (voller Build, `Result: Succeeded`) ist davon nicht betroffen | Live Coding für dieses Projekt deaktivieren: Editor Preferences → General → Live Coding → "Enable Live Coding" abwählen. Nach C++-Änderungen stattdessen den Editor immer **komplett schließen und neu starten** (lädt die frische DLL direkt von der Platte, ohne den kaputten Patch-Pfad) – das war in jedem Testfall zuverlässig |
| `scalability N`-Konsolenbefehl wirkt sofort, aber jede neue PIE-Session fällt zurück auf Quality-Level 3 (Epic) | Der reine Konsolenbefehl setzt nur die CVars für die laufende Sitzung, speichert aber **nicht** automatisch (anders als oft angenommen) – `Saved/Config/Windows/Scalability.ini` wird dabei nie geschrieben | `Saved/Config/Windows/Scalability.ini` manuell mit `[ScalabilityGroups]`-Sektion und den gewünschten `sg.*`-Werten (z. B. `sg.ViewDistanceQuality=1`) anlegen, danach Editor **komplett neu starten** (nicht nur PIE neu starten) |
| `PluginToolset.SetPluginEnabled` (MCP) meldet Erfolg, aber `.uproject` bleibt unverändert | MCP-Tool persistiert die Änderung in dieser UE-5.8-Version nicht auf die Platte, obwohl kein Fehler zurückkommt | `CamelotRAW_TP.uproject` direkt als JSON bearbeiten (die `"Enabled"`-Flags der betroffenen Plugin-Einträge auf `false`/`true` setzen) – identischer Effekt wie über den Plugin-Browser der Editor-UI |

## Status

🟢 Vollständig eingerichtet und getestet (Stand: 2026-07-18) – 41 Toolsets bestätigt verbunden. Nutzung erfolgt im Terminal-Fenster, nicht im GUI-Chat.
