> **Dated cost record.** Prices, service tiers, and LFS allowances below are historical. Verify current terms when budgeting or planning a large upload.

# Cost tracking

Ongoing documentation of all costs for Camelot: Realms at War – current and planned for later stages.All amounts are estimates at the time of registration and should be re-examined before actual payment (prices change, see Notes).

## Ongoing (currently occurring)

| Category | Items | Costs | Interval | Status | Note: |
|---|---|---|---|---|---|
| AI support | Claude (Pro/Max) | 100–200 $ | Monthly | Active | Max 5x recommended as starting point, if necessary 20x as required |

## Unique/planned (not yet incurred)

| Category | Items | Costs | Status | Note: |
|---|---|---|---|---|
| Servers | Dedicated VPS**Linux**For example, Contabo Cloud VPS 4 | ~5.50 €/month | deferred – LAN test runs instead free of charge via existing Linux notebook | Only relevant if you want to test over the Internet/outside the home network or a 24/7 server without your own running hardware is needed |
| Servers | Greater VPS when growing (e.g. Contabo Cloud VPS 8) | ~14 €/month upwards | Planned if number of players grows | Linux |
| Brands/IP | DPMA trademark application (Germany only) | ~290 € | Delayed until shortly before release | + Legal fees, if applicable |
| Brands/IP | EUIPO trade mark application (EU-wide) | ~850 € | Delayed until shortly before release | Alternative/supplement to DPMA |
| Brands/IP | USPTO Trademark Application (USA) | ~250–350 $ | Deferred if US market becomes relevant | |
| Domain/Branding | Domain + Social Handles (camelotrealmsatwar).*) | Few €/year | feasible at any time, favorable intermediate step | No substitute for trademark protection, but sensible to secure early |
| Content | Marketplace/Fab assets (placeholder toon-art) | Variables | Open, not yet budgeted | Depending on the size of the required placeholder assets |
| Content | Epic Paragon assets (free, commercially available) for later more realistic characters/weapons (Task #9, after Toon placeholder phase) | 0 € | Open point, not yet integrated | Complete collection (39 heroes) ~76 GB — **Do not version into the repo** (Content exclusion, same pattern as Lyra itself), only targeting 1-2 matching heroes locally via Fab load if actually needed. |

## Already covered (no additional cost point)

| Category | Items | Costs | Note: |
|---|---|---|---|
| Engine | Unreal Engine 5.8 | 0 € | Free up to $1 million gross sales, then 5% royalty (Epic standard model) |
| Tools | Epic Games Launcher | 0 € | |
| Repo | GitHub (private repo) | 0 € | As part of the existing GitHub account |
| Test hardware | HP ZBook (lower performance target) | 0 € | Already existing |
| Test hardware | Ryzen 9 + RTX 40s desktop (high-end reference) | 0 € | Already existing |
| Servers | Old Linux Notebook (LAN Dedicated Server Test, Task #5) | 0 € | existing, replaces VPS for LAN testing |

## Performance analysis tools (freeware, for later)

For Phase 2+ (performance budget, Task #10) and the later Linux server operation – all free of charge:

| Tool | Field of use | Platform | Note: |
|---|---|---|---|
| **Unreal Insights** | CPU/GPU/Memory profiling in-game | Integrated in UE5 | Free, direct engine tooling – first point of contact |
| **UE5 Stat commands** (`stat unit`, `stat fps`, `stat gpu`, `stat memory`) | Rapid live diagnosis during testing | Integrated in UE5 | Free of charge, immediately usable |
| **MSI Afterburner + RivaTuner Statistics Server** | FPS/GPU overlay in external tests (HP ZBook, Ryzen-9 desktop) | Windows | Free, industry standard for gaming benchmarks |
| **PresentMon** (Intel, Open Source) | Detailed frame-time analysis | Windows | Free of charge |
| **htop** / **Glances** | Live system overview (CPU/RAM) on the Linux server | Linux (VPS) | Free of charge, directly usable via SSH |
| **Netdata** | Real-time Performance Dashboard for the VPS | Linux (VPS) | Free Community Edition, Popular for Small VPS |
| **Prometheus + Grafana** | Long-term server monitoring with dashboards | Linux (VPS) | Free/Open Source, more setup effort – only relevant with more load |

## Status

Last Updated: 2026-07-16.
