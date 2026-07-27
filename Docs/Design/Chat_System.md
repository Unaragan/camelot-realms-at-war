# Chat-System-Design

> **Status:** Design-Konzept, keine Implementation. Chat-Kanäle, UI, Architektur.

## Chat-Kanäle (Hierarchie)

### Vertical Slice (MVP)
1. **Say** — Lokaler Chat, ~50m Radius um Spieler
2. **Group** — Nur aktuelle Gruppe (5 Spieler)
3. **Realm** (später) — Alle Spieler eines Reichs

### Post-Release (Später)
4. **Guild** — Nur Gilden-Mitglieder
5. **Alliance** — Mehrere Gilden koordiniert
6. **Whisper/PM** — 1v1 privat
7. **Trade** — Item-Handel (optional)

## Chat-Messages Format

**Struktur:** `[Timestamp] [ChannelIcon] [PlayerName] [Realm-Icon]: Message`

### Beispiele:

```
[14:32] [💬] Player123 [A]: Looking for group for Dungeon XYZ
[14:33] [👥] Paladin42 [A]: I'm in! What level?
[14:34] [⚔️] GroupLeader: Group ready, moving to instance
[14:35] [🔱] Berserker99 [M]: We counter-attack at north gate!
```

**Farb-Coding nach Realm:**
- Albion: Rot/Gold
- Midgard: Blau/Weiß
- Hibernia: Grün/Braun

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
- **Tab-Switch:** Kanäle nach Bedarf wechseln
- **Auto-Scroll:** Neue Messages scrollen nach oben
- **Timestamp:** Jede Message mit HH:MM
- **Sender-Name:** Klickbar → Profil/Whisper/Add-Friend
- **[Realm-Icon]:** Zeigt Reich des Senders (nur Say relevant)
- **Scrollbar:** Alte Messages browsen

## Chat-Befehle (Slash-Commands)

### Basis (Vertical Slice)
- `/say <message>` — Send in Say-Channel (default)
- `/group <message>` oder `/g <message>` — Group-Chat
- `/reply <message>` oder `/r <message>` — Letzten Whisper antworten (später)
- `/ignore <playername>` — Spieler-Messages blocken
- `/clear` — Chat-Fenster leeren

### Später (Post-Release)
- `/whisper <playername> <message>` oder `/w` — Private Message
- `/guild <message>` oder `/guild message` — Guild-Chat
- `/alliance <message>` — Alliance-Chat
- `/report <playername> <reason>` — Moderation
- `/mute <playername>` — Stummschalten (ohne Blocken)

## Technische Architektur (Konzeptuell)

### Chat-Flow:
```
Spieler tippt Message
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
   - Say: Alle Spieler im 50m Radius
   - Group: Nur Gruppe-Members
   - Realm: Alle Spieler des Reichs (später)
      ↓
[Server-Replicate] → Send zu allen Recipients
      ↓
Empfänger-Clients: Message in Chat-Window rendern
```

### Server-Side Logging (Später)
- **Persistenz:** Messages in Datenbank speichern (für Moderation, später archivieren)
- **Moderation:** Flagged-Messages für Admin-Review
- **Anti-Spam:** Flood-Detection (z. B. >5 Messages in 10 Sekunden)

## Moderation & Safety

### Spieler-Kontroll-Features
- **Ignore List:** Max 50 Namen, Ignore-Player sehen deine Messages nicht
- **Mute:** Wie Ignore, aber kein Moderation-Flagging
- **Block:** (später) Whisper/Friend-Requests blockieren

### Admin-Features (später)
- **/mod-mute <playername> <duration>** — Spieler temporär stummschalten
- **/mod-kick <playername>` — Spieler offline-Force
- **/mod-ban <playername>** — Permaban (+ Appeal-Kanal)
- **Message-Review:** Admin-Panel für flagged Messages

### Language Filter (später, optional)
- Automatisches Flagging von Slurs/Racism
- Nicht Auto-Censure (sichtbar bleiben, aber markiert)
- Manual Review für False-Positives

## Chat-Privacy & Logging

**Was wird geloggt:**
- Sender, Recipient-List, Timestamp, Message-Text (gekürzt auf 255 chars)
- **Gelöschte Messages:** Soft-Delete (Spieler sieht [deleted], Admin sieht noch Original)

**Retention:**
- Say/Group: 7 Tage (gering Speicher)
- Guild/Alliance: 30 Tage
- Whisper (später): 30 Tage
- Ban-Appeals: 90 Tage

## Offene Punkte

- **Spam-Schutz:** Rate-Limiting per Spieler? (z. B. max 1 Message/sec)
- **Language-Filter:** Aktivieren für Launch oder später?
- **Chat-History:** Können alte Messages scrollt werden? (limitiert auf lokalen Client oder vom Server?)
- **Bot-Detection:** Sollte Auto-Spam erkannt werden? (später, wenn nötig)
- **Whisper in Vertical Slice:** Jetzt oder später? (wahrscheinlich später, nur Say+Group für POC)

## Vertical Slice Scope (Minimal)

Für erste Implementation:
- ✅ Say Channel (lokale Messages)
- ✅ Group Channel (nur Gruppe)
- ✅ Basic UI (Tabs, Input, Send)
- ✅ Slash-Commands: /say, /group, /clear
- ✅ Server-Replication (alle Clients sehen neue Messages)
- ⏸ Whisper (später)
- ⏸ Guild/Alliance (später, kein Guild-System im POC)
- ⏸ Moderation (später, wenn nötig)
- ⏸ Language-Filter (später)

