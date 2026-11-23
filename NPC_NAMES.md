# NPC names (design reference)

Name pools per realm for quest givers, traders, guards and other NPCs. Based on real historical/mythological name traditions of the respective culture (common, as already in "Camelot"/Albion/Midgard/Hibernia itself) - no invented DAOC NPC names adopted.

## Legal notice

As with class names (see CLASSES.md): historical/mythological proper names are in the public domain. **The most famous** Arthur-say names (Merlin, Arthur, Lancelot, Guinevere, Excalibur) seem strangely worn/deprecated for ordinary filling NPCs — better to pick up a possible later main story character instead of randomly distributing them to any x-questers.

## Albion (arthurian/medieval-english)

**From the Arthurian saga (lesser known figures, in the public domain):**
Bedivere, Kay, Percival, Gawain, Ector, Pellinore, Elaine, Nimue, Igraine, Lynette, Tristan, Isolde, Gareth, Lamorak

**Generic medieval English names:**
- Male: Aldric, Cedric, Edmund, Godwin, Wulfric, Osric, Baldwin, Alaric, Leofric, Harold
- Weiblich: Beatrice, Eleanor, Rosalind, Matilda, Millicent, Adelina, Winifred, Editha, Cwen, Alys

## Midgard (Nordic)

**From Norse mythology (side characters, in the public domain) — for special/unique NPCs, not inflationary:**
Bragi, Idun, Njord, Skadi, Vidar, Vili, Ve, Mimir, Sif

**Generic Old Norse personal names (historical, not mythological — suitable for ordinary NPCs):**
- Male: Bjorn, Ragnar, Gunnar, Erik, Ulf, Halvar, Sven, Torvald, Leif, Ingvar
- Weiblich: Ingrid, Astrid, Sigrid, Helga, Thora, Freydis, Runa, Signe, Gudrun, Solveig

## Hibernia (Celtic/Irish)

**From Celtic mythology (side figures, in the public domain) — for special/unique NPCs, not inflationary:**
Aoife, Niamh, Oisín, Brigid, Lugh, Danu, Aengus, Fand, Etain

**Generic Gaelic names (suitable for ordinary NPCs):**
- Male: Aidan, Ronan, Cormac, Declan, Eamon, Cian, Fintan, Diarmuid, Tadhg, Ruairi
- Weiblich: Aoibheann, Siobhan, Fionnuala, Saoirse, Brenna, Maeve, Orla, Niav, Ailbhe, Sorcha

## Important NPCs: Burgherren & Military Commander (realm leadership)

Per realm, two named recurring leaders — deliberately chosen from the "special/unique NPCs" pool of the respective mythology reserved above (not from the generic fill names), as they appear more often in quest dialogues than ordinary quest givers. **Burgherr(in)** (political/noble owner of the Reichsfeste) and **Military commander(s)** (professional defender/leader) — historically based pattern (e.g. lord vs. Burgvogt), also generates narrative friction (diplomacy vs. confrontation), which is well suited to quest lines.

### Albion

| Role | Title + Name | Characteristic |
|---|---|---|
| Castle owner | Lord Ector | Conscious, dutiful, adheres to right/tradition — sees the imperial claim to the central relic castle as an inherited right, not as a conquest |
| Military Commander | Burgvot Kay | More impatient than Ector, urges decisive action, administers training and defense of the castle |

### Midgard

| Role | Title + Name | Characteristic |
|---|---|---|
| The castle owner | Jarl Skadi | Pride, test newcomers for energy before they gain prestige in the hall - honor must be proven, not claimed |
| Military Commander | Hersir Vidar | Wordless, determined, leads raid/advance squads to the border — tests recruits directly in the field instead of through ceremony |

### Hibernia

| Role | Title + Name | Characteristic |
|---|---|---|
| Castle owner | River Aengus | Sees itself as the custodian, not the owner of the relic site — care is given to the balance of the land itself (forest death/dwindling Wardstein magic as a recurring theme) |
| Military Commander | Ceann Cogaidh Aoife | Train newcomers in the Hibernian skirmish/guerrilla style, test them in small battles before they are admitted to border defense |

**Note:** Ector/Kay, Skadi/Vidar, Aengus/Aoife are now considered reserved for these realm leadership roles — not to be reused additionally for any filling NPCs in order to avoid confusion.

## Basic Conflict Proposal (Basic for Quest Lines)

Following the central "Relic Castle" [Docs/Design/OpenWorld_Frontier_3Realms_Vision.md](Docs/Design/OpenWorld_Frontier_3Realms_Vision.md): all three empires claim the same central relic site, but for different motives typical of the empire — this automatically delivers different sounds per realm questline, without the empires having to mechanically differ:

- **Albion – Legal Entitlement:** The relic site was once built/sealed by Albanian ancestors, the claim is inherited right, not conquest.
- **Midgard – Honor/Conquest Claim:** The place of relic belongs to those who can hold and defend it—claims must be proven in battle, not by documents.
- **Hibernia – Guardianship claim:** The relic site is not a trophy, but protects the land itself (Wardstein magic, forest balance) — Hibernia sees himself as a guardian, not an owner.

**Small-scale quest hooks for later starting area** (low entry level, leads gradually to the Battleground transition):

- *Lord Ector:* Missing border scouts near the Reichsrand – low-threshold exploration quest, leads players for the first time to the Reichsbord.
- *Burgvogt Kay:* Training/probation orders (defendants, secure small guard posts), escalating to the first real border patrol – natural transition starting area → Battleground.
- *Jarl Skadi:* Test chain before newcomers are considered full-fledged warriors of the hall.
- *Hersir Vidar* Direct recruitment hook for a first advance squad to the border — the most immediate bridge to the battleground.
- *River Aengus:* a grove/stone circle near the border shows signs of decay (Wardstein magic weakens) — exploration/investigation quest with natural magic clay instead of military clay.
- *Ceann Cogaidh Aoife:* small skirmish trials in the Hibernian guerrilla style, before recruits are admitted to the border defense.

**Classification:** pure design template, no elaborated quest scripts/dialogues — relevant only from the starting area phase (see roadmap in README.md, after the Vertical Slice), does not change the current Battleground focus.

**Expansion with conquest point NPCs (watchtowers, villages, mines, shrines, neutral siege camp):** See also [Docs/Design/Frontier_NPCs_and_Questlines.md](Docs/Design/Frontier_NPCs_and_Questlines.md) — there also the quest backlog with co-pilot prompt template for the later open-world frontier.

**Extension to Albion-Epic-Questline (Level 1-50):** See also [Docs/Design/Albion_Epic_Questline.md](Docs/Design/Albion_Epic_Questline.md) introduces a new antagonist: **Sir Alaric**, "the Hollow Warden", leader of the heretical splinter group "The Broken Oath". Name taken from the generic Albion men's pool above (Alaric) - now reserved for this role, not to use additionally as a fill NPC name.

**Extension by Midgard-Epic-Questline (Level 1-50):** See also [Docs/Design/Midgard_Epic_Questline.md](Docs/Design/Midgard_Epic_Questline.md) — Antagonist: **Ragnar Half-Sworn**, leader of **"The Ironbrood"**, a splinter group that discards Midgard's warrior code of honor. Name from the generic Midgard men's pool (Ragnar) - reserved now.

**Hibernia Epic Questline (Level 1–50):** See also [Docs/Design/Hibernia_Epic_Questline.md](Docs/Design/Hibernia_Epic_Questline.md) — antagonist/antagonist: **Fintan the Rootbound**, leader of **"The Withered Circle"**Name from the generic Hibernia men’s pool (Fintan) – reserved from now on.

**Instance bosses (Lv~16/28/39, see [Docs/Design/Quests.md](Docs/Design/Quests.md) → "Instance Overview":** also taken from the generic pools, now reserved for these Encounters – **Osric the Turned, Leofric the Hollow-Marked** (Albion); **Erik/Ingvar of the Ironbrood** (Midgard); **Eamon the Withered, Tadhg the Withered** (Hibernia) The three guardian constructs (The Hollow Sentinel, The Iron Wolf, The Bramble Warden) are creatures, no personal names, no pool reservations necessary.

## Practical use for quest givers

Combine name + role/title instead of just own name, e.g.:
- "Smith Godwin" (Albion)
- "Elder Torvald" (Midgard)
- "Healer Sorcha" (Hibernia)

Roles for quest givers: blacksmith, guard, elder, healer, dealer, messenger/botin, scholar, ferryman/woman.

## Status

Name pool still linked without specific quests; the six realm leaderships-NPCs (Burgherren/military commander) now have character and quest hook proposals (2026-07-21), but no elaborated quest scripts/dialogues. Relevant only from the starting area phase (see README roadmap, after the Vertical Slice).
