# GUI/UI design concept

> **Status:** Early design idea, no implementation. Screens, layout, information — not complete, later refineable.

## Core principles

- **RvR readable:** UI must still be legible in the combat chaos (large icons, clear contrasts, color coding according to realm)
- **Minimum:** Only the Necessary on the HUD — Details in Separate Screens
- **Toon-consistent:** UI design matches the toon look (no ultra-realistic panel optics)
- **Realm colours:** Albion (red/gold), Midgard (blue/white), Hibernia (green/brown)

## Main Screens (from top to bottom)

### 1. **Main Menu** (Start of the game)
- Title Screen with atmospheric background (realm-specific depending on the selected realm)
- Buttons: Play, Create Character, Settings, Exit
- Server status display (optional for later)

### 2. **Character creation screen**
- **Election:** Realm (Albion/Midgard/Hibernia)
- **Election:** Class (3 classes per realm to vertical slice)
- **Entry:** Character name (validation: 3-20 characters, no special characters)
- **Preview:** 3D model of the created character (turns, different poses)
- Button: Create, Cancel

### 3. **Character Select Screen** (if there are several chars)
- List of available characters
- Jeder Eintrag zeigt: Name, Realm-Flagge, Klasse-Icon, Level, Last Played
- Play, Delete, Create New

### 4. **In-game HUD** (During the game)

**Layout (conceptual):**
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

**Battleground Player Count (top of HUD):**
- Live display: `[🔴 Albion: X]  [🔵 Midgard: Y]  [🟢 Hibernia: Z]`
- Realm colour coding
- Only the numbers, minimal (no names)
- Real-time Update (Server sendet Count-Changes zu allen Clients)

**Elements:**

| Element | Info | Update rate |
|---|---|---|
| **Health bar** | Player HP (number + bars) | Real-time |
| **Mana/Resource Bar** | Resource for skills | Real-time |
| **Ability bar** | 4-6 hotkeys (1-4, Q, E, etc.) | Static |
| **Buff/Debuff Icons** | Active buffs/debuffs, stacked | Real-time |
| **Minimap** | Top-right corner, 3D overhead view | Real-time |
| **Enemy Nameplate** | Enemy Name, HP Bar, Realm Icon via Head | Mouseover |
| **Chat Window** | Say, Group, Realm Chat | Real-time |
| **Status icons** | Crowd control (stun, slow, etc.) indicators | Real-time |

### 5. **Character screen** (Press 'C')
- **Left Panel:**
  - Portrait (large 3D model or image)
  - Name, Level, Realm, Class
  - Experience Bar (Lv X → Lv X+1)
  - Attribute points available: [X]

- **Center Panel:**
  - Tabbed: Stats, Attributes, Skills
  - **Stats Tab:** Health, Mana, Armor, Damage, etc.
  - **Attributes Tab:** Strength, Intellect, Constitution, Dexterity (with points allocation)
  - **Skills Tab:** Current Active Abilities, Upgrade Status

- **Right Panel:**
  - Equipment Slots (Paperdoll View)
  - Head, Chest, Legs, Hands, Feet, Main-Hand, Off-Hand
  - Double Click to Open Details

### 6. **Inventory screen** (Press 'I')
- **Left:** Inventory Bag (Grid-View, 20-30 slots for Vertical Slice)
- **Right:** Equipment Slots (Paperdoll)
- **Drag & Drop:** Items between bag and equipment
- **Info Panel:** Selected Item Shows: Name, Description, Stats, Level Requirement

### 7. **Quest logo** (Press 'L')
- **Active Quests:** Title, Objectives (Progress), NPC-giver
- **Completed Quests:** Archives (optional for later)
- **Double-click:** Open quest details (NPCs, Reward Preview)

### 8. **Group Panel** (Press 'G' or automatically when group joins)
- List of group members
- Per player: Name, Class-Icon, Level, Health-Bar, Mana-Bar
- Buttons: Invite, Remove, Leave Group
- (PvP-Realm-Info: Realm-Flag for everyone)

### 9. **Options/Settings Screen**
- **Graphics:** Resolution, Brightness, Effects Quality (Low/Medium/High)
- **Audio:** Master Volume, Music Volume, SFX Volume
- **Gameplay:** Difficulty, car loot, car attack
- **Keybinds:** Customizable (later)
- Buttons: Apply, Cancel, Restore Defaults

### 10. **Battleground Player-Count Panel** (Vertical slice)

**Live Player Count (in the HUD, top right or as a widget):**
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

**Functionality:**
- **Always visible:** Real number of all active players per kingdom in the BG
- **Only for your own kingdom:** Button `[Show Realm Players]` → List of players from their own empire with level/class
- **Server Update:** Updated every 5-10 seconds (on Spawn/Death/DC)

**Own-Reich-Detail-Question:**
- Slash command: `/bgplayers` or `/bg players` → shows all players from their own kingdom in the BG
- Format: `Name [Level Klasse] [HP-Status]`
- Example:
  ```
  Albion Players in Battleground (12):
  • Paladin42 [45 Paladin] [Healthy]
  • Cleric99 [44 Cleric] [Wounded]
  • Wizard23 [46 Wizard] [Healthy]
  ... (etc.)
  ```

## Open points

- **Paperdoll style:** Are the item icons small/grid or large model? (later than UI test)
- **Chat rooms:** Multiple channels (Say, Group, Realm, Guild later)? (for Vertical Slice: Say only)
- **Targeting UI:** Should a target frame be next to the player frame? (optional, later)
- **Mobile/Responsive:** Is Console Support Planned? (no for POC)
