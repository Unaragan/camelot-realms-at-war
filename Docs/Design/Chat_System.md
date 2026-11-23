# Chat system design

> **Status:** Design concept, no implementation. Chat channels, UI, architecture.

## Chat channels (hierarchy)

**IMPORTANT: Strict realm separation** — Hibernia CANNOT chat with Midgard or Albion.Only own realm + gestures (emotes) to other realms.

### Vertical slice (MVP)
1. **Say:** - Local chat, ~50m radius around players **[REALM-ONLY]**
2. **Group** — Only current group (5 players, only from their own realm)
3. **Realm-wide** (later) — All players of an empire

### Post-release (later)
4. **Guild** — Only guild members (one realm)
5. **Alliance** - Multiple guilds coordinated (one realm)
6. **Whisper/PM** 1v1 private **[REALM-ONLY]**

### Cross-Realm Communication (limited)
- **Gestures/Emotes:** `/bow`, `/wave`, `/cheer`, `/laugh` Visible to all the rich
- **Is non-verbal:** Only way to "talk" to other rich people
- **RvR Realism:** No chat communication with enemies — only body language

## Chat message format

**Structure:** `[Timestamp] [ChannelIcon] [PlayerName] [Realm-Icon]: Message`

### Examples:

```
[14:32] [💬] Player123 [A]: Looking for group for Dungeon XYZ
[14:33] [👥] Paladin42 [A]: I'm in! What level?
[14:34] [⚔️] GroupLeader: Group ready, moving to instance
[14:35] [🔱] Berserker99 [M]: We counter-attack at north gate!
```

**Realm color coding:**
- Albion: red/gold
- Midgard: Blue and White
- Hibernia: green/brown

## Chat UI (In-Game Window)

```
┌──────────────────────────────────────────┐
│ Say  | Group  | [Realm]  | [Guild]     │ ← Tabs
├──────────────────────────────────────────┤
│                                          │
│ [14:32] Player123: Looking for group... │
│ [14:33] Paladin42: I'm in!              │
│ [14:33] Player123: Nice, 30 min?        │
│                                          │
│ [Auto-scroll enabled]                    │
├──────────────────────────────────────────┤
│ [Input: Type message here...] [Send]    │
└──────────────────────────────────────────┘
```

**Features:**
- **Tab switch:** Switching Channels as Needed
- **Auto-Scroll:** New messages scroll up
- **Timestamp:** Any message with HH:MM
- **Transmitter name:** Clickable Profile/Whisper/Add-Friend
- **[Realm icon]:** Shows realm of the transmitter (only Say relevant)
- **Scrollable:** Old messages browsing

## Emotes/gestures (cross-realm)

**Visible to all the rich** — only non-verbal communication between enemies.

### Vertical Slice (Vertical Slice)
- `/bow` — Bow
- `/wave` —Winking
- `/cheer` — Cheering
- `/laugh` — Laughter
- `/salute` - Military Salute
- `/point` — Show
- `/sit` — Sitting
- `/kneel` — Knees

### Animation display:
```
[14:35] Paladin42 bows respectfully.
[14:35] Berserker99 waves at the enemy!
[14:36] Druid54 laughs maniacally.
```

**No text message** — only the animation visible, no matter from which realm.

---

## Chat commands (slash commands)

### Vertical Slice (Vertical Slice)
- `/say <message>` Send in Say-Channel (default)
- `/group <message>` or `/g <message>` — Group chat
- `/reply <message>` or `/r <message>` — Last whispers answer (later)
- `/ignore <playername>` – Blocking player messages
- `/clear` - Chat windows empty

### Later (post-release)
- `/whisper <playername> <message>` or `/w` Private Message
- `/guild <message>` or `/guild message` — Guild Chat
- `/alliance <message>` — Alliance Chat
- `/report <playername> <reason>` — Moderation
- `/mute <playername>` — Silencing (without blocking)

## Technical architecture (conceptual)

### Chat flow:
```
Player types a message
      ↓
[Chat Input Handler]
      ↓
Validierung: (Length < 256, No Spam-Flood, Language Filter?)
      ↓
[Server-RPC] → Send zum Server
      ↓
[Server-Chat-Manager] empfängt
      ↓
Bestimme Recipient-List nach Channel:
   - Say: All players within 50 m
   - Group: Nur Gruppe-Members
   - Realm: All players in the realm (later)
      ↓
[Server-Replicate] → Send zu allen Recipients
      ↓
Empfänger-Clients: Message in Chat-Window rendern
```

### Server-side logging (later)
- **Persistence** Save messages in database (for moderation, later archive)
- **Moderation:** Flagged messages for admin review
- **Anti-spam:** Flood detection (e.g. >5 messages in 10 seconds)

## Moderation and Safety

### Player control features
- **Ignore List:** Max 50 Names, Ignore Players Don't See Your Messages
- **Mute:** Like Ignore, but No Moderation Flagging
- **Block:** (later) block whisper/friend requests

### Admin features (later)
- **/mod-mute <playername> <duration>** — Temporarily mute players
- **/mod-kick <playername>` — Player offline force
- **/mod-ban <playername>** — Permaban (+ Appeal channel)
- **Message review:** Admin panel for flagged messages

### Language filter (later, optional)
- Automatic Flagging by Slurs/Racism
- Not auto-censure (remain visible but marked)
- Manual Review for False Positives

## Chat Privacy and Logging

**What is logged:**
- Sender, Recipient-List, Timestamp, Message-Text (abbreviated to 255 chars)
- **Deleted messages:** Soft-Delete (player sees) [deleted]Admin still sees original

**Retention**
- Say/Group: 7 days (low storage)
- Guild/Alliance: 30 days
- Whisper (later): 30 days
- Ban-Appeals: 90 days

## Open points

- **Spam protection:** Rate-Limiting per player? (e.g. max 1 Message/sec)
- **Language filters:** Activate for launch or later?
- **Chat history:** Can old messages be scrolled? (limited to local client or from server?)
- **Bot detection:** Should Auto-Spam be detected? (later, if necessary)
- **Whisper in Vertical Slice:** Now or later? (probably later, only Say+Group for POC)

## Vertical Slice Scope (Minimum)

For first implementation:
- Say Channel (local messages), **REALM-ONLY**)
- ✅ Group Channel (group only), **REALM-ONLY**)
- ✅ **Emotes/gestures** (Cross-Realm visible)
- Basic UI (Tabs, Input, Send)
- Slash Commands: /say, /group, /bow, /wave, /cheer, /clear
- ✅ Server replication (all clients see new messages)
- ✅ **Realm filter:** Players can only chat with their own realm
- ⏸ Whisper (later, REALM-ONLY if implemented)
- ⏸ Guild/Alliance (later, no Guild system in the POC)
- Moderation (later, if necessary)
- ⏸ Language filter (later)

