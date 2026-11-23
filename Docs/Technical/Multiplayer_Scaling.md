# Multiplayer Scaling and Network Relevance

**Status:** Design proposal based on the November 4, 2026 project audit. Implementation, dedicated-server verification, and load testing are pending.

## Finding from the DAoC review

The project’s DAoC review examined the open-source DOLSharp emulator. The audit notes describe spatial cells and filtered updates. The idea for Realm at War is **per-connection interest management**. The authoritative server selects which nearby or otherwise relevant entities each client needs and sends only the necessary state. The audit does not establish how Eden implements networking or what player counts it supports.

## Proposed replication policy

| State | Recipients and behavior |
|---|---|
| Movement and combat | Use Unreal’s networked Character Movement and server-authoritative GAS. Send public gameplay state to relevant connections. |
| Nearby actors | Evaluate spatial cells as a way to build the recipient list. Preserve relevance for combat effects, projectiles, and actors behind cover when gameplay requires it. Use stable transitions at cell boundaries. |
| Parties and objectives | Allow explicit non-spatial relevance for authorized party information and global match or objective summaries. |
| Inventory and full cooldown details | Send to the owning player. Keep frequent private state off global PlayerState updates. |
| Stealth | Decide on the server which connections may receive the actor’s state. |
| Stable world objects | Send initial state and meaningful changes. Consider dormancy for stable doors and keep objects. Test late join and re-entry into relevance. |

World Partition streams level content. Network relevance determines which connections receive gameplay state. Keep these responsibilities separate.

## Implementation and verification order

1. Establish a two-client baseline for movement, attacks, healing, death, respawn, late join, and reconnect. Record authority, ownership, and update recipients.
2. Prepare a dedicated-server test path. Measure server frame times, replicated actors per connection, bytes per connection, correction rates, and combat-state consistency.
3. Compare a distributed workload with a dense fight at the keep gate. Spatial filtering provides less benefit when most nearby players need each other’s updates. Measure local actor density separately from total server population and rendered character count.
4. Prototype Replication Graph if building per-connection relevance lists dominates. Evaluate Iris filtering if polling or serialization dominates. Compare either candidate against the same baseline and recheck GAS and movement behavior before choosing an approach.

The first milestone remains the small battleground. Capacity targets depend on measured gameplay correctness, server cost, bandwidth, and local combat density. See the [Game Design Document](../Game_Design_Document.md#10-technical-design-and-production) and [Project Handbook](../Project_Documentation_and_Ideas.md).
