# GUI/UI Design-Konzept

> **Status:** Frühe Design-Idee, keine Implementation. Screens, Layout, Informationen — nicht vollständig, später verfeinerbar.

## Kern-Prinzipien

- **RvR-lesbar:** UI muss im Kampf-Chaos noch lesbar sein (große Icons, klare Kontraste, Farb-Coding nach Realm)
- **Minimal:** Nur das Nötigste auf dem HUD — Details in separaten Screens
- **Toon-konsistent:** UI-Design passt zum Toon-Look (keine ultra-realistische Paneloptik)
- **Realm-Farben:** Albion (Rot/Gold), Midgard (Blau/Weiß), Hibernia (Grün/Braun)

## Main Screens (von oben nach unten)

### 1. **Main Menu** (Start des Spiels)
- Title Screen mit atmosphärischem Hintergrund (Realm-spezifisch je nach ausgewähltem Realm)
- Buttons: Play, Create Character, Settings, Exit
- Server-Status-Anzeige (optional für später)

### 2. **Character Creation Screen**
- **Wahl:** Realm (Albion/Midgard/Hibernia)
- **Wahl:** Klasse (3 Klassen pro Realm zur Vertical Slice)
- **Eingabe:** Charakter-Name (Validierung: 3-20 Zeichen, keine Sonderzeichen)
- **Preview:** 3D-Modell des erstellten Characters (dreht sich, verschiedene Posen)
- Button: Create, Cancel

### 3. **Character Select Screen** (wenn mehrere Chars vorhanden)
- Liste der verfügbaren Charaktere
- Jeder Eintrag zeigt: Name, Realm-Flagge, Klasse-Icon, Level, Last Played
- Buttons: Play, Delete, Create New

### 4. **In-Game HUD** (Während des Spiels)

**Layout (konzeptuell):**
```
┌─────────────────────────────────────────────────────┐
│  [Name/Level] [Health Bar] [Mana Bar]   [Minimap]  │  ← Top
│  [BG Players: 🔴 Albion: 12  🔵 Midgard: 15  🟢 Hibernia: 10]
├─────────────────────────────────────────────────────┤
│                                                      │
│                   3D-Game-Viewport                  │
│                                                      │
├─────────────────────────────────────────────────────┤
│ [Ability 1] [A2] [A3] [A4]     [Buffs/Debuffs]    │  ← Bottom
│              [Status Icons]      [Group]             │
└─────────────────────────────────────────────────────┘
```

**Battleground Player-Count (oben im HUD):**
- Live-Anzeige: `[🔴 Albion: X]  [🔵 Midgard: Y]  [🟢 Hibernia: Z]`
- Farbcodierung nach Realm
- Nur die Zahlen, minimal (keine Namen)
- Real-time Update (Server sendet Count-Changes zu allen Clients)

**Elemente:**

| Element | Info | Update-Rate |
|---|---|---|
| **Health Bar** | Spieler HP (Zahl + Balken) | Real-time |
| **Mana/Resource Bar** | Ressource für Fähigkeiten | Real-time |
| **Ability Bar** | 4-6 hotkeys (1-4, Q, E, etc.) | Static |
| **Buff/Debuff Icons** | Active buffs/debuffs, stacked | Real-time |
| **Minimap** | Top-right corner, 3D-Overhead-View | Real-time |
| **Enemy Nameplate** | Gegner-Name, HP-Bar, Realm-Icon über Head | Mouseover |
| **Chat Window** | Say, Group, Realm Chat | Real-time |
| **Status Icons** | Crowd Control (stun, slow, etc.) Indikatoren | Real-time |

### 5. **Character Screen** (Press 'C')
- **Left Panel:**
  - Portrait (großes 3D-Modell oder Bild)
  - Name, Level, Realm, Klasse
  - Experience Bar (Lv X → Lv X+1)
  - Attribute-Punkte verfügbar: [X]

- **Center Panel:**
  - Tabbed: Stats, Attributes, Skills
  - **Stats Tab:** Health, Mana, Armor, Damage, etc.
  - **Attributes Tab:** Strength, Intellect, Constitution, Dexterity (mit Punkte-Zuweisung)
  - **Skills Tab:** Aktuell aktive Fähigkeiten, Upgrade-Status

- **Right Panel:**
  - Ausrüstungs-Slots (Paperdoll-View)
  - Head, Chest, Legs, Hands, Feet, Main-Hand, Off-Hand
  - Doppelklick zum Öffnen von Details

### 6. **Inventory Screen** (Press 'I')
- **Left:** Inventory Bag (Grid-View, 20-30 Slots für Vertical Slice)
- **Right:** Equipment Slots (Paperdoll)
- **Drag & Drop:** Items zwischen Bag und Equipment
- **Info Panel:** Selected Item zeigt: Name, Beschreibung, Stats, Level-Requirement

### 7. **Quest Log** (Press 'L')
- **Active Quests:** Titel, Objectives (Fortschritt), NPC-Geber
- **Completed Quests:** Archive (optional für später)
- **Doppelklick:** Quest-Details öffnen (NPCs, Reward Preview)

### 8. **Group Panel** (Press 'G' oder automatisch wenn Gruppe beitritt)
- Liste der Gruppen-Mitglieder
- Je Spieler: Name, Class-Icon, Level, Health-Bar, Mana-Bar
- Buttons: Invite, Remove, Leave Group
- (PvP-Realm-Info: Realm-Flag für jeden)

### 9. **Options/Settings Screen**
- **Graphics:** Resolution, Brightness, Effects Quality (Low/Medium/High)
- **Audio:** Master Volume, Music Volume, SFX Volume
- **Gameplay:** Difficulty, Auto-Loot, Auto-Attack
- **Keybinds:** Customizable (später)
- Buttons: Apply, Cancel, Restore Defaults

### 10. **Battleground Player-Count Panel** (Vertical Slice)

**Live Player-Count (im HUD, oben rechts oder als Widget):**
```
┌──────────────────────────────────┐
│  BATTLEGROUND PLAYERS             │
│  🔴 Albion:     12 players        │
│  🔵 Midgard:    15 players        │
│  🟢 Hibernia:   10 players        │
│                                  │
│  [Show Realm Players]  [Close]   │
└──────────────────────────────────┘
```

**Funktionalität:**
- **Immer sichtbar:** Echtzahl aller aktiven Spieler pro Reich im BG
- **Nur für eigenes Reich:** Button `[Show Realm Players]` → Liste der Spieler aus eigenem Reich mit Level/Klasse
- **Server-Update:** Alle 5-10 Sekunden aktualisiert (bei Spawn/Death/DC)

**Eigenes-Reich-Detail-Abfrage:**
- Slash-Befehl: `/bgplayers` oder `/bg players` → zeigt alle Spieler aus eigenem Reich im BG
- Format: `Name [Level Klasse] [HP-Status]`
- Beispiel:
  ```
  Albion Players in Battleground (12):
  • Paladin42 [45 Paladin] [Healthy]
  • Cleric99 [44 Cleric] [Wounded]
  • Wizard23 [46 Wizard] [Healthy]
  ... (etc.)
  ```

## Offene Punkte

- **Paperdoll-Style:** Sind die Item-Icons klein/grid oder großes Modell? (später als UI-Test)
- **Chat-Räume:** Mehrere Channels (Say, Group, Realm, Guild später)? (für Vertical Slice: nur Say)
- **Targeting-UI:** Soll ein Ziel-Frame neben dem Player-Frame sein? (optional, später)
- **Mobile/Responsive:** Ist Console-Support geplant? (nein für POC)
