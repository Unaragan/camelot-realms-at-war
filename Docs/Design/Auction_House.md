# Auction House System

> **Status:** Design concept, no implementation. Central item marketplace for realm.

## Reason: No private housing

Da **Private Housing** (pers. houses with NPC vendors) is not planned, we need a **Central Marketplace** for players to sell/buy Crafted Items + Loot.

---

## Core features

### 1. **Auction House Location Per Realm**

- **Albion:** Aldenbury (Capital) — Tavern or Market Square
- **Midgard:** Skaldheim (capital) — Schankhalle or Marktplatz
- **Hibernia:** Dun Kerath (capital) — Druid district or market square

**Access:**
- NPC "Auctioneer" in the center of each capital
- Players visit NPC → "Open Auction House" → UI opens

### 2. **Auction listings**

Players can put items at auction:

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

**Item info at the hover:**
- Name, Rarity (Common/Uncommon/Rare/Epic)
- stats, level requirements
- Durability (if relevant)
- Seller name, listing date

### 3. **Auction promotions**

**Create an auction:**
- Player Selects Item from Inventory
- Sets starting price + auction duration (12h, 24h, 48h)
- Listing fee: 5% of the starting price
- Item is removed from Inventory (reserved for auction)

**Make a bid:**
- Player offers on Item
- Can be bid (other player offers higher)
- Last hour: Auction can be renewed up to 5 minutes before the end (sniping protection)

**Buy directly (buy-out):**
- Seller can set "buy-out price" (e.g. 100 gold)
- Players can buy directly instead of bidding

**After auction:**
- Winner: Item to Inventory + Message "You have won!"
- Seller: Gold to the account + message "Auction ended"
- Expiration without bid: Item back to Seller (free relisting)

---

## Listings and Search

### Search filters:

```
Item Name: [Search____]
Rarity: [All] [Common] [Uncommon] [Rare] [Epic]
Item Type: [All] [Weapon] [Armor] [Accessory] [Consumable]
Price Range: [Min_____] - [Max_____]
Seller: [All Realms] [Search Seller____]
Sort by: [Price: Low-High] [Newest] [Ending Soon]

[Search] [Clear]
```

### Auction Limits (Type & Quality Dependent):

**Consumables (drinks, potions) — Alchemist-specific:**
- Common/Uncommon: **Unlimited** (quickly consumed)
- Rare: **Max 50 listings**
- Epic: **Max 5 listings**
- *Reason: Alchemists produce many potions daily*

**Weapons & Armaments:**
- Common: **Max 10 listings**
- Uncommon: **Max 8 listings**
- Rare: **Max 5 listings**
- Epic: **Max 2 listings** (very valuable)
- *Reason: Crafted items should remain rare, not flooded*

**Accessories (rings, amulets):**
- Common: **Max 8 listings**
- Uncommon: **Max 6 listings**
- Rare: **Max 3 listings**
- Epic: **Max 1 Listing** (unique)

**Raw materials (ore, leather, etc.) — Vendor alternative:**
- **Unlimited** (should be available from the NPC, not AH-imprinted)
- *Reason: Players should buy materials from the vendor, not farm from the AH*

**Total per player:**
- Vertical slice: **Max 20 active listings total** (mix of all types)
- Endgame: **Max 40 active listings total**

---

## Occupational bonuses (listing extension)

**Players with suitable main professions will receive higher listing limits:**

- **Alchemist:** +50% Consumable listings (e.g. 50 Rare → 75 Rare)
- **Gunsmiths:** +3 Weapon listings
- **Armsmith:** +3 Heavy Armor Listings
- **Leather:** +3 Light/Medium Armor Listings
- **Jewellery:** +2 Accessory listings
- **Tailor:** +3 Cloth-Armor listings

**Example:**
```
Alchemist player:
  Common Potions: Unbegrenzt → Unbegrenzt
  Rare Potions: 50 → 75 Listings (+50%)
  Epic Potions: 5 → 7 Listings (+50%)

Weaponsmith player:
  Uncommon Weapons: 8 → 11 Listings (+3)
  Rare Weapons: 5 → 5 (keine Änderung)
```

**Reason:** Craftsmen can monetize their specialization!

---

## Fees and Gold-Sinks

### Listing fee (seller):
- 5% of the starting price → Gold is immediately deducted by the seller
- E.g. starting price 100 gold → 5 gold fee

### Sales fee (for sale):
- In addition, 2% of the final price to the "guild" / realm (gold sink)
- E.g. Final bid 150 Gold → 3 Gold Tax

**Reason:** Gold sinks prevent inflation

### Example:
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

## Realm separation

**IMPORTANT:** Auction houses are: **REALM-ONLY**:
- Albion players only see Albion listings
- Midgard players only see Midgard listings
- Hibernia players only see Hibernia listings
- No cross-realm trade

**Reason:** Realm separation (like chat) — enemies don’t trade with each other!

---

## Vertical slice scope

For first implementation (later, after crafting):
- ✅ **Auction House UI** (Search, Browse, Bid, Buy-Out)
- ✅ **Create Listing** (Player puts Item up for auction)
- ✅ **Basic search filters** (Name, Rarity, Price)
- ✅ **Bidding system** (Bid, win, transfer gold)
- ✅ **Realm-only listings** (No cross-realm)
- ⏸ Listing fee + Sales fee (later, later balance)
- Advanced Filters (Item-Stats, Level-Requirement filtering)
- ⏸ Watchlist (remember items for later)
- ⏸ Seller reputation / Blacklist (later)

---

## Open points

- **Auction duration:** 12h, 24h, 48h? Or flexible? (later balance)
- **Sniping protection:** 5 min before end = auto-extend? or just 1x? (later)
- **Bot protection:** Should bots make automatic bids? (later, if necessary)
- **Stuck Items:** What happens to items when players logout? (auto-return after 30 days)
- **Scam protection:** Can sellers change price after sale? (no, fixed as soon as bid comes)
