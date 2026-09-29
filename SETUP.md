> **Aktueller Startablauf (2026-09-29): Codex Desktop statt Claude-Terminal.**
> Siehe AGENTS.md. tools/start-dev.ps1 startet den Editor, prüft MCP per Handshake
> und öffnet Codex. Der direkte .uproject-Start öffnet nach neuem Modul-Build ebenfalls
> Codex und startet MCP, führt aber keinen Git-Pull aus. Ältere Claude-spezifische
> Anleitungen unten sind nur noch für die frühere Client-Installation relevant.
> Ein frisch eingetragener MCP-Server kann einen Codex-Neustart benötigen.
> Die Map-Sicherung über Git ist wegen ignorierter externer Actor-Dateien noch unvollständig.

# Setup: Unreal MCP (Claude Code ↔ Unreal Editor)

Anleitung, um Claude Code direkt mit dem Unreal Editor zu verbinden (Actors spawnen, Blueprints/Materialien bearbeiten, GAS-Fähigkeiten konfigurieren, DataTables, UMG-Widgets, u. v. m. – ohne blindes GUI-Klicken). Basiert auf Epics offiziellem Plugin [`unreal-engine-skills-for-claude-code-plugin`](https://github.com/EpicGames/unreal-engine-skills-for-claude-code-plugin). Erfolgreich getestet: **53 Toolsets** registriert (Stand CamelotRAW_TP, 2026-07-27), inkl. aller GAS-Werkzeuge (GameplayTagsToolset, AttributeSetToolset, AbilitySystemInspectorToolset, GameplayCueToolset).

## Wichtige Voraussetzung: richtiges Fenster benutzen

**Diese Einrichtung funktioniert nur in einer echten Terminal-Sitzung** (`claude` direkt in PowerShell/Git Bash/Eingabeaufforderung gestartet) – **nicht** in GUI-basierten Claude-Oberflächen (z. B. Desktop-App-Chats). Slash-Befehle wie `/plugin` sind dort nicht verfügbar. Für alles, was direkt in der Unreal Engine passieren soll, muss im Terminal-Fenster gearbeitet werden.

## Schritt 1: Toolset-Plugins im Unreal Editor aktivieren

1. **Edit → Plugins** → nach **"Toolset"** suchen (nicht nur "MCP" – sonst tauchen die einzelnen Toolset-Plugins nicht auf!)
2. Mindestens aktivieren: **All Toolsets** (Aggregator), **EditorToolset**, **GASToolsets** (für unser Gameplay Ability System). Optional je nach Bedarf: **Niagara Toolsets**, **Physics Toolsets**, **AI Assistant**, **Gameplay Behaviors**, **AI Module Toolset**.
3. Zusätzlich nach **"MCP"** suchen und **ModelContextProtocol** aktivieren
4. **Editor komplett neu starten** – neu aktivierte Plugins greifen sonst nicht, auch wenn der Server schon läuft. **Bekannte Falle:** `PluginToolset.SetPluginEnabled` meldet im UI Erfolg, persistiert die Änderung aber nicht zuverlässig in die `.uproject` – im Zweifel die `.uproject` direkt öffnen und prüfen, ob der Plugin-Eintrag mit `"Enabled": true` tatsächlich drinsteht, sonst manuell ergänzen. Mit vollständiger Liste: **53 Toolsets** registriert (Stand CamelotRAW_TP, 2026-07-27).

## Schritt 2: Konsole finden (Windows/QWERTZ-Falle)

- **Bei deutscher Tastatur (QWERTZ) funktioniert die `~`-Taste oft nicht** – stattdessen: **Window → Output Log** öffnen, dort unten im Eingabefeld ("Cmd") die Befehle eintippen
- Alternativ: Taste links neben "1", über Tab (meist `^`/`°` beschriftet) probieren
- Alternativ: Konsolen-Taste in den Editor-Eingabeeinstellungen neu belegen

## Schritt 3: MCP-Server im Editor starten

### Manual (jede Session):
Im Output-Log-Eingabefeld:
```
ModelContextProtocol.StartServer
```
Läuft standardmäßig auf Port 8000, Pfad `/mcp`.

### Automatisch beim Editor-Start (2026-08-22, per C++-Modul, korrigiert)

Zwei frühere Ansätze waren **nachweislich wirkungslos** (kein Aufruf im Log, Port blieb zu) und wurden entfernt: `Config/DefaultEngine.ini` → `[Startup]` → `ConsoleAutoStartCommand` (vermutlich kein echter Ini-Schlüssel), sowie die nie tatsächlich angelegte `+SystemStartupScripts=/Game/Camelot/Startup/MCP_AutoStart`-Blueprint-Variante.

**Funktionierender Ersatz:** `Source/CamelotRAW_TP/CamelotRAW_TP.cpp` registriert in `StartupModule()` einen Handler auf `FCoreDelegates::OnPostEngineInit` (nur `#if WITH_EDITOR`), der `ModelContextProtocol.StartServer` per `GEngine->Exec(...)` ausführt — feuert garantiert erst, nachdem die Engine (inkl. MCP-Plugin-HTTP-Server-Subsystem) vollständig initialisiert ist, anders als zeitlich unsichere Ini-/Kommandozeilen-Ansätze. Braucht nach dem Pull einen Rebuild (siehe "Missing Modules"-Dialog-Stolperfalle oben).

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

Bei korrekter Einrichtung: 53 Toolsets, u. a. ActorTools, BlueprintTools, DataTableTools, MaterialTools, GameplayTagsToolset, AttributeSetToolset, AbilitySystemInspectorToolset, UMGToolSet.

## Projekt-Basis: Third Person Template + Sync-Workflow

Seit dem Architekturwechsel (2026-07-26, siehe README.md) basiert das Projekt auf Epics **Third Person Template** (Blueprint-Variante, Variant "None"). Der von Epic mitgelieferte Template-Content (`Content/ThirdPerson/`, `Content/Characters/Mannequins/`, `Content/Input/` usw.) ist **bewusst nicht versioniert** (`.gitignore`), analog zum bisherigen Lyra-Workflow, um das kostenlose GitHub-LFS-Kontingent (1 GB, siehe COSTS.md) nicht zu sprengen.

**Workflow für einen zweiten Rechner:**
1. In Unreal Editor: New Project → Games → Third Person → Blueprint, Target Platform Desktop, Quality Preset Scalable, Variant **None** → als `CamelotRAW_TP` im selben Repo-Pfad anlegen (z. B. `D:\Claude\camelot-realms-at-war`), dabei `Config/`, `Content/` und `.uproject` aus dem frisch erzeugten Projekt übernehmen (überschreiben die durch `git pull` geholten, aber gitignorierten lokalen Platzhalter nicht – nur einmalig nötig, falls diese Ordner lokal noch fehlen)
2. Danach `git clone`/`git pull` – synchronisiert nur `Config/`, `.uproject`, `Content/Camelot/` und eigene Doku, **nicht** den übrigen Template-Content
3. Eigener Content entsteht ausschließlich unter `Content/Camelot/` (siehe `.gitignore`-Ausnahme `!Content/Camelot/`) und wird darüber synchronisiert

**Rechner-übergreifender Abgleich läuft ausschließlich über Git/GitHub** (`origin`), nicht über OneDrive – OneDrive lief parallel dazu unzuverlässig (unterschiedliche Stände auf verschiedenen Rechnern, siehe Stolperfallen-Tabelle) und wurde entfernt. `tools/start-dev.ps1` macht vor dem Editor-Start automatisch `git pull` und erinnert nach dem Schließen an `git add`/`commit`/`push`.

**Zusätzliches lokales Git-Remote (Backup, kein Live-Arbeitsort):** ein bare Repo liegt auf dem an der FritzBox angeschlossenen USB-Stick unter `\\Mkl-iw4\mkl-iw4\Claude\camelot-realms-at-war.git`, als Remote `nas` eingerichtet. **Wichtig:** Git LFS scheitert über den rohen UNC-Pfad (`chdir`-Fehler im `lfs-standalone-file`-Adapter) – der Pfad muss stattdessen auf einen Laufwerksbuchstaben gemappt sein (`net use Z: \\Mkl-iw4\mkl-iw4\Claude /persistent:yes`, Remote-URL dann `Z:\camelot-realms-at-war.git`). Nutzung: `git push nas master` als zusätzliches Backup neben GitHub, **nicht** als primärer Sync-Weg – der Editor arbeitet immer auf der lokalen Kopie, nie direkt auf dem Netzwerk-Share (Performance-/Korruptionsrisiko bei Unreal-Binärdateien über SMB).

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
| Nach Rechnerwechsel/Sync: Blueprint-Fehler `Cast has an invalid target type (was the class deleted without a redirect?)` an einer eigenen C++-Klasse (z. B. `AS_PaladinAttributes`/`CamelotAttributeSetBase`), obwohl Source/Content laut Git identisch sind | `Binaries/`, `Intermediate/` (gitignoriert, nicht synct) waren auf dem Zielrechner **veraltet** — die Haupt-DLL stammte vom allerersten Build, seither liefen nur Live-Coding-Hot-Patches oben drauf, die bei geänderten UCLASS-Layouts (neue/geänderte C++-Klasse) keine sauberen Klassen-Re-Instanzierungen garantieren | `Binaries/`, `Intermediate/Build/` und `DerivedDataCache/` löschen, Live Coding deaktivieren (Editor Preferences → General → Live Coding), Editor neu starten → sauberer Voll-Rebuild über den "Missing Modules"-Dialog. Nach jedem C++-Änderungs-Pull auf einem Zweitrechner vorsichtshalber denselben Weg gehen statt auf Live-Coding-Patches zu vertrauen |
| Rechnerübergreifend über OneDrive synchronisierte Kopie zeigt auf verschiedenen Rechnern unterschiedliche Stände (Blueprint-Fehler, fehlende Animation/GUI trotz "synct") | OneDrive lief parallel zu Git als zweiter, unkoordinierter Sync-Mechanismus über denselben Ordner – kennt keine Git-Historie, überschreibt/verzögert unabhängig davon | OneDrive für diesen Ordner nicht mehr nutzen, ausschließlich Git/GitHub für den Rechner-Abgleich (siehe "Projekt-Basis"-Abschnitt oben, `tools/start-dev.ps1` macht das jetzt automatisch) |
| `git push` zu einem Remote auf einem Netzwerk-Share via UNC-Pfad (`\\Server\Share\...`) schlägt bei LFS-Objekten fehl: `error initializing custom adapter "lfs-standalone-file": chdir ...: The specified path is invalid` | Git LFS' `lfs-standalone-file`-Transfer-Adapter kommt mit rohen UNC-Pfaden nicht zurecht (Windows-spezifischer Bug) | UNC-Pfad auf einen Laufwerksbuchstaben mappen (`net use Z: \\Server\Share /persistent:yes`), Remote-URL auf den gemappten Pfad (`Z:\...`) setzen statt auf die UNC-Form |
| `scalability N`-Konsolenbefehl wirkt sofort, aber jede neue PIE-Session fällt zurück auf Quality-Level 3 (Epic) | Der reine Konsolenbefehl setzt nur die CVars für die laufende Sitzung, speichert aber **nicht** automatisch (anders als oft angenommen) – `Saved/Config/Windows/Scalability.ini` wird dabei nie geschrieben | Projektweiter Fix in `Config/DefaultEngine.ini` unter `[SystemSettings]` (siehe README "Performance-Ziele") – gilt für jede Maschine, kein manueller Schritt pro Session nötig |
| `PluginToolset.SetPluginEnabled` (MCP) meldet Erfolg, aber `.uproject` bleibt unverändert | MCP-Tool persistiert die Änderung in dieser UE-5.8-Version nicht auf die Platte, obwohl kein Fehler zurückkommt | `CamelotRAW_TP.uproject` direkt als JSON bearbeiten (die `"Enabled"`-Flags der betroffenen Plugin-Einträge auf `false`/`true` setzen) – identischer Effekt wie über den Plugin-Browser der Editor-UI |
| GAS-ASC lässt sich nicht rein in Blueprint initialisieren: `InitAbilityActorInfo` und die Funktion zum Anhängen eines AttributeSets an den ASC (`GetOrCreateAttributeSubobject`/`AddSpawnedAttribute`) sind in Vanilla-GAS **nicht** `BlueprintCallable` | Epic exponiert diese beiden Kernfunktionen bewusst nur für C++ | Minimales eigenes C++-Modul `CamelotRAW_TP` angelegt (`Source/CamelotRAW_TP/`, s. u.) mit `UCamelotGASLibrary` (2 statische `BlueprintCallable`-Funktionen: `InitAbilitySystem`, `AddAttributeSet`) – einzige Existenzberechtigung dieses Moduls, siehe CLAUDE.md-Ausnahmeklausel zu "Blueprint-first" |
| GameplayEffect-Modifier über MCP gesetzt (`ObjectTools.set_properties` auf `Modifiers`), aber `LogAbilitySystem: Warning: ... has a null modifier attribute` beim Anwenden, Attribut-Wert bleibt 0 | Beim `FGameplayAttribute`-Struct sind `AttributeName`/`AttributeOwner` nur `WITH_EDITORONLY_DATA`-Hilfsfelder für die Editor-Combobox – das tatsächlich zur Laufzeit ausgewertete Feld ist `Attribute` (ein `TFieldPath<FProperty>`), das die Combobox-UI normalerweise automatisch befüllt, reines Property-Setzen per Reflection aber übergeht | Zusätzlich explizit `"Attribute": "<PfadZurAttributSet-BP-Klasse>:<AttributName>"` setzen, z. B. `"/Game/.../AS_PaladinAttributes.AS_PaladinAttributes_C:Health"` |
| `ObjectTools.set_properties` auf ein Array mit anderer Elementzahl als aktuell gesetzt schlägt fehl: `ArrayAdd: elements changed alongside the size change; insertion points are ambiguous` | Der Property-Differ kann Größenänderung + Inhaltsänderung im selben Aufruf nicht eindeutig auflösen | Array-Property zuerst explizit auf `[]` setzen (eigener `set_properties`-Aufruf), erst danach die vollständige neue Liste in einem zweiten Aufruf setzen |

**Zwei Lyra-C++-Build-spezifische Stolperfallen (Automation-Build-Cache, Live-Coding/UBA-Fehler) betrafen den alten Lyra-Stand — archiviert in [Archive.md](Archive.md). Seit 2026-07-27 hat das Projekt trotz "Blueprint-first"-Grundsatz wieder ein (bewusst minimales) C++-Modul, s. o.**

## Rechner-Start: ein einziges Skript für alles (2026-08-22)

**Überholt/entfernt:** der vorherige OneDrive-Symlink-Ansatz (`Content/Camelot` per Windows-Junction in einen OneDrive-Ordner umgeleitet) — das leitete ausgerechnet unseren **git-versionierten** Ordner zusätzlich durch OneDrive um und war vermutlich Hauptursache der wiederholten "unterschiedliche Stände auf beiden Rechnern"-Probleme (Git und OneDrive stritten sich um dieselben Dateien). **Falls auf dem Power-Rechner noch aktiv:** Junction entfernen (`Remove-Item "C:\Claude\camelot-realms-at-war\Content\Camelot"` — löscht nur den Junction-Punkt, nicht die Zieldateien in OneDrive) und danach per `git pull` den normalen, git-verwalteten Ordner wiederherstellen lassen.

**Aktueller Workflow:** `tools/start-dev.ps1` deckt den kompletten Start ab:
```powershell
& "D:\Claude\camelot-realms-at-war\tools\start-dev.ps1"
```
1. `git pull origin master` — Code/Config/`Content/Camelot/`/Doku (Quelle der Wahrheit)
2. Spiegelt `Z:\SharedAssets` (NAS-Stick, siehe unten) nach `SharedAssetsCache/` — für große, bewusst nicht versionierte Downloads (Fab/Paragon etc., siehe COSTS.md), nur NAS → lokal, nie automatisch zurück
3. Startet den Unreal Editor — MCP-Server startet automatisch (`Config/DefaultEngine.ini` → `[Startup]` → `ConsoleAutoStartCommand`)
4. Öffnet ein Claude-Code-Terminal im Projektordner (verbindet sich mit `unreal-mcp`)

Root-Kurzstarter außerhalb des Repos (`D:\Claude\start-dev.ps1`) delegiert nur an dieses Skript, keine doppelte Logik.

### Großer, nicht versionierter Content (Fab/Paragon etc.)

Getrennt von `Content/Camelot/` (Git) und vom Third-Person-Template-Content (pro Rechner neu erzeugt, siehe oben): ein bare Git-Backup-Repo **und** ein reiner Datei-Ordner liegen auf dem an der FritzBox angeschlossenen USB-Stick.

- **`Z:\SharedAssets`** (gemapptes Laufwerk, `net use Z: \\Mkl-iw4\mkl-iw4\Claude /persistent:yes`) — Ablageort für große Downloads, die nicht in Git sollen. Wird beim Start automatisch nach `SharedAssetsCache/` (lokal, gitignoriert) gespiegelt; von dort manuell im Content Browser importieren, wo gebraucht.
- **`Z:\camelot-realms-at-war.git`** — bare Repo, zusätzliches Backup-Remote (`git remote nas`) neben GitHub, kein Live-Arbeitsort.

## Status

🟢 Vollständig eingerichtet und getestet (Stand: 2026-08-22, CamelotRAW_TP) – 53 Toolsets bestätigt verbunden. Rechner-Abgleich ausschließlich über Git/GitHub, großer Nicht-Git-Content über NAS-Stick-Ordner. Nutzung erfolgt im Terminal-Fenster, nicht im GUI-Chat.
