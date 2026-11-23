> **Historical design draft.** The July 2026 roster, roadmap, monetization, and business figures are earlier proposals. Use the [current Game Design Document](Docs/Game_Design_Document.md) for prototype scope.

Camelot Realms at War - Game Design Document

**Version:** 1.0  
**Last Updated:** July 2026  
**Project Lead:** Michael Klopp (Unaragan)

---

## Table of Contents

1. [Executive Summary](#executive-summary)
2. [Game Vision](#game-vision)
3. [Core Systems](#core-systems)
4. [Economy & Currency](#economy--currency)
5. [Realm Points & Progression](#realm-points--progression)
6. [Keep System](#keep-system)
7. [Monetization Model](#monetization-model)
8. [Business Projections](#business-projections)
9. [Development Roadmap](#development-roadmap)

---

## Executive Summary

**Camelot Realms at War** is a modern, remaster-inspired take on the classic MMORPG **Dark Age of Camelot**, featuring enhanced RvR mechanics, fair-to-play monetization, and guild-focused gameplay.

The game targets the substantial DAoC nostalgia market (estimated 10k-50k+ potential players) with a streamlined design that emphasizes:
- **Balanced PvP Combat** (Realm vs. Realm)
- **Guild-Based Keep Ownership**
- **Skill-Driven Progression**
- **Zero Pay-to-Win Mechanics**

---

## Game Vision

### Core Philosophy

Camelot Realms at War brings the beloved RvR formula of early DAoC into the modern era with:

- **Three Iconic Realms**: Albion, Midgard, Hibernia (faithful to original)
- **Dynamic Territory Control**: Guilds claim and upgrade keeps through RvR achievements
- **True Meritocracy**: Realm Points reward active PvP participation; currency rewards PvE content
- **Community Ownership**: Guild identity is protected (free banner customization)

### Target Audience

- **Primary**: Former DAoC players (2002-2010 era) seeking modernized experience
- **Secondary**: RvR/PvP-focused MMO enthusiasts
- **Tertiary**: Guild-focused players seeking territorial gameplay

---

## Core Systems

### Realms & Factions

Three balanced Realms, each with:
- **Unique visual identity** (armor skins, architecture, NPC aesthetics)
- **Shared class mechanics** (no P2P balance issues)
- **Home zones** for leveling, PvE content, crafting
- **RvR territories** (Keep zones, tower outposts)

**Realms:**
- 🏰 **Albion** (British/English aesthetics)
- ⚔️ **Midgard** (Norse/Scandinavian aesthetics)
- 🍀 **Hibernia** (Celtic/Irish aesthetics)

### Classes (5 Core Archetypes)

All classes available in all Realms with identical stats & abilities (only visual skins differ).

1. **Warrior** - Melee tank/DPS
2. **Mage** - Ranged nuker, crowd control
3. **Healer** - Group support, healing
4. **Scout** - Rogue, stealth, burst damage
5. **Ranger** - Bow DPS, pet summoning

### Leveling Progression

- **Level Cap**: 50
- **PvE Zones**: Home realm zones (1-50)
- **Instanced Dungeons**: 3-4 per Realm (progressive difficulty 1-50)
- **RvR Leveling**: Optional (slower but rewarding)
- **Estimated Time**: 40-60 hours to Level 50 (casual pacing)

---

## Economy & Currency

### Four-Tier Currency System

**Logarithmic exchange rates** to prevent hyperinflation:

| Tier | Name | Exchange Rate | Use Case |
|------|------|---|---|
| 1 | Copper (C) | — | Entry-level rewards |
| 2 | Silver (S) | 100 C = 1 S | Mid-tier gear, consumables |
| 3 | Gold (G) | 100 S = 1 G | High-end gear, rare crafts |
| 4 | Mithril (M) | 1,000 G = 1 M | Keep charters, legendary items |

### Currency Sources (PvE)

- **Mob Drops**: Copper → Gold (level-appropriate)
- **Quest Rewards**: Copper/Silver (narrative quests)
- **Dungeon Bosses**: Silver → Gold (rare drops)
- **Crafting Sales**: Player-to-player trading
- **Keep Ownership**: +100 Gold/week per owned Keep tier

### Currency Sinks (Anti-Inflation)

- **Keep Charters**: 100-500 Gold (one-time per guild)
- **Keep Upkeep**: RP-based maintenance costs
- **Enchantments**: Mithril-locked endgame upgrades
- **Housing**: Optional player housing (future expansion)

---

## Realm Points & Progression

### RP Earning Sources

| Activity | RP Reward | Notes |
|----------|-----------|-------|
| **Standard Kill** | 10 RP | Enemy player, same Realm Rank |
| **Keep Conquest** | 100-500 RP | Scales by Keep level (1-10) |
| **Tower Destruction** | 50 RP | Outpost control |
| **Realm Bonus** | +10-20% RP | While holding 3+ relics (future expansion) |

**Realistic Earnings** (5 kills/hour, 25h/week):
- Solo Player: ~1,550 RP/week
- 10-Player Guild: ~15,500 RP/week collective

### Realm Rank System (1-10, Logarithmic)

**RP Costs Scale Exponentially** (2x multiplier per rank):

| Rank | RP Cost | Cumulative | Time (10-man guild) |
|------|---------|-----------|-------------------|
| 1 | 500 | 500 | 1 week |
| 2 | 1,000 | 1,500 | 1 week |
| 3 | 2,000 | 3,500 | 2 weeks |
| 4 | 4,000 | 7,500 | 3 weeks |
| 5 | 8,000 | 15,500 | 1 month |
| 6 | 16,000 | 31,500 | 2 months |
| 7 | 32,000 | 63,500 | 1 month |
| 8 | 64,000 | 127,500 | 2 months |
| 9 | 128,000 | 255,500 | 3 months |
| 10 | 256,000 | 511,500 | 4 months |

**Individual Player to Rank 10**: ~1 year (active player, 5 kills/hour daily)

### Realm Rank Benefits

- **Titles & Honors**: "Drachenslayer," "Warlord," etc.
- **Optional Stat Boni**: +1-2% damage per rank (cosmetic, not P2W)
- **Guild Leadership Recognition**: Titles for active BG leaders

### Monthly BG-Leader Awards

**Criteria (per month):**
- ≥15 different Battlegroup Leaders
- Each lead: ≥3 successful Keep conquests

**Rewards for qualifying leads:**
- 🏆 Exclusive title ("Siege Commander")
- 📊 +10% RP bonus for following month
- 💎 10-20 Mithril stipend

---

## Keep System

### Keep Ownership

**Only guilds** can own keeps. Requirements:
1. **Keep Charter** from NPC King (100-500 Gold, one-time)
2. **Minimum Collective RP**: Depends on Keep level
3. **Active Management**: Maintenance costs in RP

### Keep Mechanics

#### Respawn Timer: 5 Minutes

When a Keep's gate guards are defeated:
- **Timer Starts**: 5-minute countdown
- **Angreifer-Fenster**: Must push deeper before guards respawn
- **Strategic Pressure**: Forces coordinated, timed assaults

**Scenario Timeline:**
```
T+0:00 - BG assaults Outer Gate (3-4 guards)
T+1:00 - Outer Gate breached
T+1:00 - 5-MIN RESPAWN TIMER STARTS
T+2:30 - Inner Gate assault begins
T+3:30 - Inner Gate breached
T+5:00 - OUTER GATE RESPAWNS (if not inner sanctum captured)
T+4:30 - Sanctum assault (most dangerous)
T+5:00 - KEEP CAPTURED ✅ (no more respawns)
```

### Keep Guards (Defensive NPCs)

**Stat Philosophy**: Impossible for solo player, manageable for organized group

| Stat | Value | Notes |
|------|-------|-------|
| HP | 5,000-8,000 | ~3-5x player HP |
| Damage | 200-300/hit | ~5-10% player HP |
| Armor | Heavy (-40% player damage) | Mitigates burst |
| Attack Speed | Fast | Auto-attack every 1.5s |

**Guard Distribution:**
- Outer Gate: 3-4 guards
- Inner Gate: 4-5 guards
- Sanctum: 5-6 elite guards

**Minimum Assault Group**: 8-12 players (balanced composition)

### Keep Levels (1-10 Progression)

**Keep Level Advancement** via RP expenditure. Each level unlocks new defensive options.

#### Level 1: Foundation
- **RP Cost to Unlock**: 3,000 RP
- **Guards**: 1 additional guard per gate
- **Upkeep**: 500 RP/month

#### Level 2: Basic Defense
- **RP Cost**: 6,000 RP
- **New Options**:
  - Guard Training (+20% guard damage, 500 RP one-time)
  - Extra Guards (up to 3 per gate, 250 RP each)
- **Upkeep**: 750 RP/month

#### Level 3: Healer Support
- **RP Cost**: 12,000 RP
- **New Options**:
  - Keep Healer (1 NPC healer, 200 HP/s healing, 1,000 RP unlock)
  - Healer Upgrade (+100 HP/s, 1,500 RP)
  - Extra Guards (2 per gate, 500 RP each)
- **Upkeep**: 1,200 RP/month

#### Level 4-5: Elite Units
- **RP Costs**: 24,000 / 48,000 RP
- **New Options**:
  - Elite Guard Captain (+50% HP/Damage, 2,500 RP)
  - Rapid Respawn (5min → 3min, 2,000 RP)
  - 2nd Healer (1,500 RP)
  - Extra Guards (3 per gate, 750 RP each)
- **Upkeep**: 1,800 RP/month (Level 4), 2,200 RP/month (Level 5)

#### Level 6-7: Advanced Tactics
- **RP Costs**: 96,000 / 192,000 RP
- **New Options**:
  - Guard Discipline (guards focus-fire healers, 4,000 RP)
  - AOE Defenders (50m radius attacks, 5,000 RP)
  - 3rd Healer (2,500 RP)
  - Extra Guards (4 per gate, 1,000 RP each)
- **Upkeep**: 2,800 RP/month (Level 6), 3,400 RP/month (Level 7)

#### Level 8-9: Elite Defense
- **RP Costs**: 384,000 / 768,000 RP
- **New Options**:
  - Magic Resistance (+30% magic resist, 7,500 RP)
  - Guild Banner (Realm buffs +10% damage, 6,000 RP)
  - Sanctum Guardian (elite boss-guard, 10,000 RP)
  - Extra Guards (5 per gate, 1,250 RP each)
- **Upkeep**: 4,200 RP/month (Level 8), 5,400 RP/month (Level 9)

#### Level 10: Legendary
- **RP Cost**: 1,536,000 RP (~24 months for large guild)
- **Unlocks**:
  - Relic Amplifier (+20% RP/Gold when realm holds relics, 25,000 RP)
  - Legendary Status (doubled all stat bonuses, 37,500 RP)
  - King's Favor (+100 Gold/week from NPC king, 12,500 RP)
  - Extra Guards (6 per gate max, 1,500 RP each)
- **Upkeep**: 7,000+ RP/month

### Keep Upgrade Strategy Examples

**Small Active Guild (5 members):**
- Target: Level 4-5
- Keep Guards: 8-10 total
- Healer: 1
- Realistically achieved in: 3-4 months

**Large Hardcore Guild (15+ members):**
- Target: Level 8-9
- Keep Guards: 20-25 total
- Healers: 3
- AOE/Magic Resistance active
- Realistically achieved in: 9-12 months

---

## Monetization Model

### Three-Tier System (Fair-to-Play)

#### Alpha/Beta Phase (Complimentary)

- **Duration**: 6-12 months
- **Cost**: FREE
- **Purpose**: Community building, balance testing, feedback gathering
- **Features**: Full Abo feature-set available for testing

#### Release: Option A - One-Time Purchase

**Price**: 24,99€ (one-time, permanent)

**Includes:**
- Guild Management Dashboard
- Keep Ownership Real-Time Map
- RP Tracker & Guild Treasury
- Exclusive Mount Skin (Golden Griffin)
- Permanent access (no subscription required)

#### Release: Option B - Monthly Abo

**Price**: 9,99€/month (flexible, cancel anytime)

**Includes:**
- Everything from One-Time Purchase
- New exclusive mount design each month
- Priority customer support
- Early access to patch notes

### Non-Monetized Systems

**Guild Banners** (100% Free)
- Each guild can create unlimited banner designs
- 3-color customization layers
- Custom logos & faction symbols
- Changes unlimited and free
- **Rationale**: Guild identity must not be paywalled

**Gameplay Content** (All Free)
- PvE dungeons (all included)
- RvR zones (all included)
- Progression systems (all included)
- New content updates (all free post-launch)

### Anti-P2W Guarantee

```
"Camelot Realms at War is fully Fair-to-Play:

✅ No stat bonuses for money
✅ No RP/Currency acceleration for payment
✅ No exclusive gear behind paywall
✅ No level-skip advantages
✅ Cosmetics only (mounts, titles)
✅ Skill & coordination determine outcome

Abo players have IDENTICAL combat power as Free players."
```

---

## Business Projections

### Development Cost Breakdown

#### Alpha/Beta (12-18 months, Bootstrap)

```
Cloud/Infrastructure:    12,600€
Tools & Licenses:          3,000€
Domain/Hosting:              500€
Miscellaneous:            2,000€
──────────────────────────────
TOTAL ALPHA: ~18,600€

(Developer time: Unpaid, one-person bootstrap)
```

#### Year 1 Post-Launch

```
Monthly Infrastructure: 2,000-3,000€
Developer Income:      2,500€/month (part-time)
Marketing:             1,000€/month
Operations/Admin:        500€/month
──────────────────────────────
ANNUAL COSTS: ~72,000€
```

### Revenue Projections

#### Conservative Scenario (10k players)

```
Monthly Revenue:
├─ Abo (30% × 3,000 players × 9,99€): 29,970€
├─ One-Time (25% × 2,500 × 24,99€): 15,618€ (amortized)
└─ TOTAL: ~45,000€/month

ANNUAL: 540,000€
PROFIT (after costs): 468,000€
```

#### Realistic Scenario (25k players)

```
Monthly Revenue:
├─ Abo (35% × 8,750 × 9,99€): 87,406€
├─ One-Time (30% × 7,500 × 24,99€): 62,475€ (amortized)
└─ TOTAL: ~150,000€/month

ANNUAL: 1,800,000€
PROFIT (after costs): 1,728,000€
```

#### Success Scenario (50k players)

```
Monthly Revenue:
├─ Abo (40% × 20,000 × 9,99€): 199,800€
├─ One-Time (30% × 15,000 × 24,99€): 124,950€ (amortized)
└─ TOTAL: ~325,000€/month

ANNUAL: 3,900,000€
PROFIT (after costs): 3,828,000€
```

### Break-Even Analysis

| Player Count | Monthly Revenue | Annual Profit | Break-Even |
|---|---|---|---|
| 10k | 45k€ | 468k€ | Year 1 ✅ |
| 25k | 150k€ | 1,728k€ | Year 1 ✅ |
| 50k | 325k€ | 3,828k€ | Year 1 ✅ |

**With DAoC nostalgia market (250k historical players), even conservative 10k player assumption yields profitability in Year 1.**

---

## Development Roadmap

### Phase 1: Design & Documentation (Months 1-2)

- ✅ Complete Game Design Document (THIS FILE)
- ✅ Business Plan & Financial Projections
- ✅ Pitch Deck for Investors/Publishers
- ✅ Technical Architecture Specification
- ✅ Art Style Guide
- ✅ Audio/Music Direction Document

### Phase 2: Alpha Development (Months 3-15)

- Core engine setup
- Realm/class/progression systems
- Basic Keep mechanics
- Economy system (currency, crafting)
- Leveling dungeons (first pass)
- RvR zone implementation
- Guard AI & combat tuning

### Phase 3: Beta Polish (Months 16-20)

- Balance pass (PvE & RvP)
- QA/bug fixes
- Performance optimization
- Art asset finalization
- Audio/music integration
- UI/UX refinement

### Phase 4: Launch Preparation (Months 21-24)

- Server infrastructure setup
- Community platform (Discord, forums)
- Marketing ramp-up
- Closed beta testing
- Launch day operations plan

### Phase 5: Year 1 Post-Launch

- Ongoing balance adjustments
- Content patches (monthly)
- Quality-of-life improvements
- Community feedback integration
- Expansion planning

---

## Success Metrics (First Year)

| Metric | Target | Success Indicator |
|--------|--------|---|
| **Active Players (DAU)** | 10k+ | ✅ Conservative projection |
| **Retention (Month 3)** | 40%+ | ✅ DAoC benchmark |
| **Abo Conversion** | 30-40% | ✅ Premium model viability |
| **Revenue** | 500k€+ | ✅ Year 1 profitability |
| **Community Rating** | 7.5+/10 | ✅ Strong DAoC credibility |
| **Guild Participation** | 70%+ active | ✅ Territory control engagement |

---

## Conclusion

**Camelot Realms at War** represents a modern, monetarily sustainable approach to the classic RvR MMO formula. By combining:

- Proven gameplay mechanics (DAoC template)
- Modern technology & infrastructure
- Fair-to-play monetization
- Guild-focused community systems

...we can capture a significant portion of the 250k+ historical DAoC player base while establishing a new standard for ethical, player-first MMO design.

**Target Timeline**: 24 months to launch, profitability by Month 1 post-launch.

---

## Contact & Questions

**Project Lead**: Michael Klopp  
**GitHub**: [Unaragan/camelot-realms-at-war](https://github.com/unaragan)  
**Version**: 1.0 | July 2026

---

*This document is subject to revision and expansion based on stakeholder feedback and market research.*
