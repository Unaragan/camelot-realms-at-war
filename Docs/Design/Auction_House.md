# Auction House System

> **Status:** Design-Konzept, keine Implementation. Zentraler Item-Marktplatz für Realm.

## Grund: Kein Private Housing

Da **Private Housing** (pers. Häuser mit NPC-Vendors) nicht geplant ist, brauchen wir einen **zentralen Marktplatz** für Spieler, um Crafted Items + Loot zu verkaufen/kaufen.

---

## Kern-Features

### 1. **Auktionhaus-Standort pro Realm**

- **Albion:** Aldenbury (Hauptstadt) — Taverne oder Marktplatz
- **Midgard:** Skaldheim (Hauptstadt) — Schankhalle oder Marktplatz
- **Hibernia:** Dun Kerath (Hauptstadt) — Druiden-Kreis oder Marktplatz

**Zugang:**
- NPC "Auctioneer" im Zentrum jeder Hauptstadt
- Spieler besuchen NPC → "Open Auction House" → UI öffnet sich

### 2. **Auktion-Listings**

Spieler können Items zur Auktion stellen:

```
┌──────────────────────────────────────────┐
│ [Auction House] - Albion                 │
├──────────────────────────────────────────┤
│ Search: [Knight's Steel Sword____]       │
│                                          │
│ Listing 1: Knight's Steel Sword          │
│  Price: 50 Gold  |  Seller: Player123    │
│  Listed: 2 hours ago  |  Expires: 22h    │
│                                          │
│ Listing 2: Knight's Steel Sword (worn)   │
│  Price: 30 Gold  |  Seller: Warrior99    │
│  Listed: 8 hours ago  |  Expires: 16h    │
│                                          │
│ [Bid] [Buy Now] [Cancel Search]          │
└──────────────────────────────────────────┘
```

**Item-Info beim Hover:**
- Name, Rarity (Common/Uncommon/Rare/Epic)
- Stats, Level-Requirement
- Durability (falls relevant)
- Seller-Name, Listing-Date

### 3. **Auktion-Aktionen**

**Auktion erstellen:**
- Spieler wählt Item aus Inventory
- Setzt Startpreis + Auktionsdauer (12h, 24h, 48h)
- Listing-Fee: 5% des Startpreises
- Item wird aus Inventory entfernt (reserviert für Auktion)

**Gebot abgeben:**
- Spieler bietet auf Item
- Kann nachgeboten werden (anderer Spieler bietet höher)
- Letzte Stunde: Auktion kann noch bis 5 Min vor Ende erneuert werden (Sniping-Schutz)

**Direkt kaufen (Buy-Out):**
- Seller kann "Buy-Out-Preis" setzen (z. B. 100 Gold)
- Spieler kann direkt kaufen statt zu bieten

**Nach Auktion:**
- Gewinner: Item ins Inventory + Nachricht "Sie haben gewonnen!"
- Seller: Gold ins Konto + Nachricht "Auktion beendet"
- Ablauf ohne Gebot: Item zurück zu Seller (kostenloses Relisting)

---

## Listings & Suche

### Search-Filter:

```
Item Name: [Search____]
Rarity: [All] [Common] [Uncommon] [Rare] [Epic]
Item Type: [All] [Weapon] [Armor] [Accessory] [Consumable]
Price Range: [Min_____] - [Max_____]
Seller: [All Realms] [Search Seller____]
Sort by: [Price: Low-High] [Newest] [Ending Soon]

[Search] [Clear]
```

### Auktions-Limits:

- **Max 5 aktive Listings pro Spieler** (Vertical Slice)
- **Max 10 später** (endgame)
- Verhindert Markt-Manipulation durch einzelne Spieler

---

## Gebühren & Gold-Sinks

### Listing-Fee (Verkäufer):
- 5% des Startpreises → Gold wird vom Verkäufer sofort abgezogen
- Z. B. Startpreis 100 Gold → 5 Gold Gebühr

### Sales-Fee (bei Verkauf):
- Zusätzlich 2% des Endpreises an die "Gilde" / Realm (Gold-Sink)
- Z. B. Finales Gebot 150 Gold → 3 Gold Tax

**Grund:** Gold-Sinks verhindern Inflation

### Beispiel:
```
Verkäufer listet: Knight's Steel Sword
  Startpreis: 100 Gold
  Listing-Fee: 5 Gold (sofort abgezogen)
  
Käufer bietet: 150 Gold
  Käufer zahlt: 150 Gold
  Verkäufer erhält: 150 - (2% × 150) = 147 Gold
  Realm erhält: 3 Gold (Tax, aus Circulation)
```

---

## Realm-Trennung

**WICHTIG:** Auktionshäuser sind **REALM-ONLY**:
- Albion-Spieler sehen nur Albion-Listings
- Midgard-Spieler sehen nur Midgard-Listings
- Hibernia-Spieler sehen nur Hibernia-Listings
- ❌ Kein Cross-Realm-Handel

**Grund:** Realm-Separation (wie Chat) — Feinde handeln nicht miteinander!

---

## Vertical Slice Scope

Für erste Implementation (später, nach Crafting):
- ✅ **Auction House UI** (Search, Browse, Bid, Buy-Out)
- ✅ **Create Listing** (Spieler stellt Item zur Auktion)
- ✅ **Basic Search Filter** (Name, Rarity, Price)
- ✅ **Bidding System** (Gebot abgeben, gewinnen, Gold transferieren)
- ✅ **Realm-Only Listings** (Keine Cross-Realm)
- ⏸ Listing-Fee + Sales-Fee (später, später balancen)
- ⏸ Advanced Filters (Item-Stats, Level-Requirement filtern)
- ⏸ Watchlist (Items merken für später)
- ⏸ Seller-Reputation / Blacklist (später)

---

## Offene Punkte

- **Auktions-Dauer:** 12h, 24h, 48h? Oder flexibel? (später balancen)
- **Sniping-Schutz:** 5 Min vor Ende = auto-extend? Oder nur 1x? (später)
- **Bot-Protection:** Sollen Bots automatische Gebote machen? (später, wenn nötig)
- **Stuck Items:** Was passiert mit Items, wenn Spieler sich logout? (Auto-return nach 30 Tagen)
- **Scam-Protection:** Können Seller Preis nach Verkauf ändern? (nein, fixiert sobald Gebot kommt)
