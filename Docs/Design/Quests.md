# Quests: Content & Umsetzungsstand

Zentrale Sammelstelle für **fertig ausformulierten Quest-Content** und den **Stand der Umsetzung im Spiel** — getrennt von den Design-Konzept-Dokumenten (die Prämissen/Story-Struktur bleiben dort, wo sie entstanden sind) und getrennt von [PROMPTS.md](../../PROMPTS.md) (die nur die wiederverwendbaren Anfrage-Vorlagen enthält, nicht die Ergebnisse).

## Wie diese Datei benutzt wird

- **Story-Konzepte/Prämissen** leben weiter in ihren Quelldokumenten: [Albion_Epic_Questline.md](Albion_Epic_Questline.md) (AEQ-01 bis AEQ-26), [Midgard_Epic_Questline.md](Midgard_Epic_Questline.md) (MEQ-01 bis MEQ-26), [Hibernia_Epic_Questline.md](Hibernia_Epic_Questline.md) (HEQ-01 bis HEQ-26), [Frontier_NPCs_and_Questlines.md](Frontier_NPCs_and_Questlines.md) (Punkt-NPCs FNQ-01 bis FNQ-07), [NPC_NAMES.md](../../NPC_NAMES.md) (Reichsführungs-Hooks). Hier **nicht** duplizieren.
- **Diese Datei** ist der Tracker: welche Quest hat schon fertigen Text (Titel/Beschreibung/Ziele/Dialog), und was fehlt noch, um sie tatsächlich im Spiel zu haben.
- **Technisches Schema:** [SYSTEMS.md](../../SYSTEMS.md) → Abschnitt 3 "Quests (Datenschema-Vorschlag)".

## Status-Legende

- **Content:** 🟢 fertig ausformuliert · 🟡 nur Prämisse/Kurzinhalt vorhanden · ⚪ noch nicht angefasst
- **Engine:** 🔴 nicht begonnen · 🟡 teilweise · 🟢 fertig im Spiel

## Wichtigster offener Punkt

**Es existiert noch kein Quest-System im Projekt** — keine Quest-DataTable, keine Dialog-UI, kein Objective-Tracking (siehe SYSTEMS.md Abschnitt 3). Das ist Voraussetzung, bevor auch nur eine einzige Quest von hier tatsächlich spielbar wird. Bis dahin ist der "Engine"-Status für **alle** Einträge unten 🔴, unabhängig vom Content-Status.

**Generische Umsetzungs-Checkliste** (gilt pro Quest, sobald das Grundsystem steht):
1. NPC-Blueprint im Level platziert (Questgeber)
2. Quest-DataTable-Zeile angelegt (Schema siehe SYSTEMS.md Abschnitt 3)
3. Dialogtexte ins Dialog-System/Widget eingepflegt
4. Objective-Tracking-Logik gebaut (z. B. Trigger-Volume, Kill-Counter, Item-Pickup)
5. Reward vergeben (vorerst Platzhalter, da Itemization noch nicht existiert)

## Instanzen-Übersicht (level-abhängige Gruppen-Dungeons)

Jedes Reich hat vier gruppenpflichtige Instanzen entlang seiner Epic-Questline — drei "Zwischen-Instanzen" plus die Finalinstanz, die alle drei Reiche in derselben Lv~50-Bastion zusammenführt (siehe Frontier-Vision). Jede Instanz hat einen benannten Boss und ein Loot-Konzept (kein fertiges Zahlendesign, siehe SYSTEMS.md Abschnitt 1).

| Lv | Albion | Midgard | Hibernia |
|---|---|---|---|
| **~16** | *Recruits of the Watch* (AEQ-10) — Boss **Osric the Turned**, Loot: *Osric's Broken Blade* (selten) | *Wolves Among Wolves* (MEQ-10) — Boss **Erik, First of the Ironbrood**, Loot: *Erik's War-Axe* (selten) | *The Withering Circle* (HEQ-10) — Boss **Eamon the Withered**, Loot: *Eamon's Thorned Staff* (selten) |
| **~28** | *Baldwin's Last Watch* (AEQ-16) — Boss **Leofric the Hollow-Marked**, Loot: *Leofric's Warhorn* (selten) | *Gunnar's Last Stand* (MEQ-16) — Boss **Ingvar of the Ironbrood**, Loot: *Ingvar's Storm-Shield* (selten) | *Niav's Vigil* (HEQ-16) — Boss **Tadhg the Withered**, Loot: *Tadhg's Bramble Crown* (selten) |
| **~39** | *Into the Hollow* (AEQ-21) — Boss **The Hollow Sentinel**, Loot: *Sentinel's Ward-Fragment* (episch) | *Into the Ironbrood's Hold* (MEQ-21) — Boss **The Iron Wolf**, Loot: *Iron Wolf's Fang* (episch) | *Into the Rootbound Hollow* (HEQ-21) — Boss **The Bramble Warden**, Loot: *Bramble Warden's Heartwood* (episch) |
| **~50 (Finale)** | *The Hollow Warden* (AEQ-26) — Boss **Sir Alaric**, Loot: episches Set-Stück + Titel | *Ragnar Half-Sworn* (MEQ-26) — Boss **Ragnar Half-Sworn**, Loot: episches Set-Stück + Titel | *Fintan the Rootbound* (HEQ-26) — Boss **Fintan the Rootbound**, Loot: episches Set-Stück + Titel |

**Progression:** Lv~16/28/39-Instanzen sind jeweils der Höhepunkt eines Akts (siehe Realm-Dateien), nicht optionale Beikost — sie treiben die Haupthandlung voran (Ermittlung → Bestätigung → Konfrontation). Die Lv-50-Finalinstanz aller drei Reiche liegt an derselben Karte ("Bastion der Kill-Zone"), aber mit reichseigenem Boss/Ausgang.

## Master-Index

### Albion Epic Questline (AEQ, Level 1–50, 26 Stufen) — siehe [Albion_Epic_Questline.md](Albion_Epic_Questline.md)

| ID | Lv | Titel | Typ | Content | Engine |
|---|---|---|---|---|---|
| AEQ-01 | 1 | The Silent Frontier | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-02 | 2 | Shadows Across the Border | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-03 | 3 | To the Borderlands | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-04 | 5 | First Blood | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-05 | 7 | A Soldier's Instinct | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-06 | 9 | The Cartographer's Warning | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-07 | 11 | Eleanor's Missing Wagons | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-08 | 13 | The Old Ward-Keeper's Journal | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-09 | 15 | Osric's Trail | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-10 | 16 | Recruits of the Watch — **Instanz #1** (Boss: Osric the Turned) | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| AEQ-11 | 18 | Aftermath at the Hollow | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-12 | 20 | Grenzland-Scharmützel (BG-Debüt) | **Gruppe/RvR** | ⚪ nur Prämisse | 🔴 |
| AEQ-13 | 23 | Lord Ector's Suspicion | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-14 | 26 | What the Archives Hide | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-15 | 27 | The Cartographer's Fear | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-16 | 28 | Baldwin's Last Watch — **Instanz #2** (Boss: Leofric the Hollow-Marked) | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| AEQ-17 | 30 | Umkämpftes Hochland (BG-Debüt #2) | **Gruppe/RvR** | ⚪ nur Prämisse | 🔴 |
| AEQ-18 | 33 | The Vanishing Ward-Stone | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-19 | 36 | Kay's Warpath | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-20 | 38 | The Sentinel's Ground | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-21 | 39 | Into the Hollow — **Instanz #3** (Boss: The Hollow Sentinel) | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| AEQ-22 | 42 | The Leader's Name | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-23 | 45 | The Price of an Oath | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-24 | 47 | Muster for the Bastion | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-25 | 49 | The Last Vigil | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-26 | 50 | The Hollow Warden (FINALE — Instanz #4, Boss: Sir Alaric) | **Gruppe, Endgegner** | ⚪ nur Prämisse | 🔴 |

### Midgard Epic Questline (MEQ, Level 1–50, 26 Stufen) — siehe [Midgard_Epic_Questline.md](Midgard_Epic_Questline.md)

| ID | Lv | Titel | Typ | Content | Engine |
|---|---|---|---|---|---|
| MEQ-01 | 1 | Trial of the First Blade | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-02 | 2 | Prove Your Worth | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-03 | 3 | The Hersir's Summons | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-04 | 5 | Blood on the Ice | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-05 | 7 | Gunnar's Watch | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-06 | 9 | The Skald's Doubt | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-07 | 11 | Ulf's Vanishing Ore | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-08 | 13 | The Half-Sworn Rune | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-09 | 15 | Erik's Trail | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-10 | 16 | Wolves Among Wolves — **Instanz #1** (Boss: Erik, First of the Ironbrood) | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| MEQ-11 | 18 | What the Wolves Left Behind | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-12 | 20 | Grenzland-Scharmützel (BG-Debüt) | **Gruppe/RvR** | ⚪ nur Prämisse | 🔴 |
| MEQ-13 | 23 | Skadi's Doubt | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-14 | 26 | The Unbound Oath | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-15 | 27 | The Skald's Warning | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-16 | 28 | Gunnar's Last Stand — **Instanz #2** (Boss: Ingvar of the Ironbrood) | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| MEQ-17 | 30 | Umkämpftes Hochland (BG-Debüt #2) | **Gruppe/RvR** | ⚪ nur Prämisse | 🔴 |
| MEQ-18 | 33 | The Silent Fjord | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-19 | 36 | Vidar's Reckoning | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-20 | 38 | The Iron Wolf's Den | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-21 | 39 | Into the Ironbrood's Hold — **Instanz #3** (Boss: The Iron Wolf) | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| MEQ-22 | 42 | The Wolf Unbound | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-23 | 45 | What Honor Costs | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-24 | 47 | The Long Hunt | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-25 | 49 | The Last Toast | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-26 | 50 | Ragnar Half-Sworn (FINALE — Instanz #4, Boss: Ragnar Half-Sworn) | **Gruppe, Endgegner** | ⚪ nur Prämisse | 🔴 |

### Hibernia Epic Questline (HEQ, Level 1–50, 26 Stufen) — siehe [Hibernia_Epic_Questline.md](Hibernia_Epic_Questline.md)

| ID | Lv | Titel | Typ | Content | Engine |
|---|---|---|---|---|---|
| HEQ-01 | 1 | The Fading Grove | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-02 | 2 | Whispers in the Root | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-03 | 3 | Aoife's Trial | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-04 | 5 | First Skirmish | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-05 | 7 | Niav's Silence | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-06 | 9 | The Seer's Unease | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-07 | 11 | Cormac's Stolen Iron | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-08 | 13 | The Old Grove-Keeper's Rite | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-09 | 15 | Eamon's Trail | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-10 | 16 | The Withering Circle — **Instanz #1** (Boss: Eamon the Withered) | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| HEQ-11 | 18 | What the Roots Remember | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-12 | 20 | Grenzland-Scharmützel (BG-Debüt) | **Gruppe/RvR** | ⚪ nur Prämisse | 🔴 |
| HEQ-13 | 23 | Aengus' Fear | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-14 | 26 | The Rootbound Rite | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-15 | 27 | The Seer's Vision | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-16 | 28 | Niav's Vigil — **Instanz #2** (Boss: Tadhg the Withered) | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| HEQ-17 | 30 | Umkämpftes Hochland (BG-Debüt #2) | **Gruppe/RvR** | ⚪ nur Prämisse | 🔴 |
| HEQ-18 | 33 | The Drowned Dolmen | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-19 | 36 | Aoife's Resolve | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-20 | 38 | The Bramble Threshold | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-21 | 39 | Into the Rootbound Hollow — **Instanz #3** (Boss: The Bramble Warden) | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| HEQ-22 | 42 | The Warden Who Grew Wild | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-23 | 45 | The Wild and the Bound | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-24 | 47 | The Gathering Wood | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-25 | 49 | The Last Rite | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-26 | 50 | Fintan the Rootbound (FINALE — Instanz #4, Boss: Fintan the Rootbound) | **Gruppe, Endgegner** | ⚪ nur Prämisse | 🔴 |

### Nebenquests: Albion (ASQ), Midgard (MSQ), Hibernia (HSQ)

| ID | Reich | Titel | Schwierigkeit | Content | Engine |
|---|---|---|---|---|---|
| ASQ-01 | Albion | Smith Godwin's Request | Leicht | ⚪ nur Prämisse | 🔴 |
| ASQ-02 | Albion | Cedric's Lost Hound | Leicht | ⚪ nur Prämisse | 🔴 |
| ASQ-03 | Albion | The Widow's Debt | Mittel | ⚪ nur Prämisse | 🔴 |
| ASQ-04 | Albion | Rosalind's Cure | Mittel | ⚪ nur Prämisse | 🔴 |
| ASQ-05 | Albion | Harold's Wager | Mittel | ⚪ nur Prämisse | 🔴 |
| ASQ-06 | Albion | The Tax Collector's Ledger | Schwer | ⚪ nur Prämisse | 🔴 |
| MSQ-01 | Midgard | Bjorn's Boast | Leicht | ⚪ nur Prämisse | 🔴 |
| MSQ-02 | Midgard | Astrid's Catch | Leicht | ⚪ nur Prämisse | 🔴 |
| MSQ-03 | Midgard | The Frozen Raiders | Mittel | ⚪ nur Prämisse | 🔴 |
| MSQ-04 | Midgard | Sigrid's Runes | Mittel | ⚪ nur Prämisse | 🔴 |
| MSQ-05 | Midgard | Halvar's Duel | Mittel | ⚪ nur Prämisse | 🔴 |
| MSQ-06 | Midgard | The Ice-Bound Wyrm | Schwer | ⚪ nur Prämisse | 🔴 |
| HSQ-01 | Hibernia | Ronan's Lost Charm | Leicht | ⚪ nur Prämisse | 🔴 |
| HSQ-02 | Hibernia | Siobhan's Herbs | Leicht | ⚪ nur Prämisse | 🔴 |
| HSQ-03 | Hibernia | The Hungry Wood | Mittel | ⚪ nur Prämisse | 🔴 |
| HSQ-04 | Hibernia | Declan's Wager | Mittel | ⚪ nur Prämisse | 🔴 |
| HSQ-05 | Hibernia | Maeve's Warning | Mittel | ⚪ nur Prämisse | 🔴 |
| HSQ-06 | Hibernia | The Old Oak's Grief | Schwer | ⚪ nur Prämisse | 🔴 |

### Frontier-Punkt-NPCs (FNQ) — siehe [Frontier_NPCs_and_Questlines.md](Frontier_NPCs_and_Questlines.md)

| ID | Reich | NPC/Punkt | Content | Engine |
|---|---|---|---|---|
| FNQ-01 | Albion | Wachhauptmann Baldwin, Wachturm | ⚪ nur Prämisse | 🔴 |
| FNQ-02 | Albion | Vorsteherin Eleanor, Dorf | ⚪ nur Prämisse | 🔴 |
| FNQ-03 | Midgard | Wachhauptmann Gunnar, Wachturm | ⚪ nur Prämisse | 🔴 |
| FNQ-04 | Midgard | Minenaufseher Ulf, Mine | ⚪ nur Prämisse | 🔴 |
| FNQ-05 | Hibernia | Schreinhüterin Niav, Schrein | 🟢 fertig (unten) | 🔴 |
| FNQ-06 | Hibernia | Vorsteher Cormac, Schmiedelager | ⚪ nur Prämisse | 🔴 |
| FNQ-07 | Neutral | Namenloser Lagerhauptmann, Belagerungslager | ⚪ nur Prämisse | 🔴 |

---

## Fertiger Content

### AEQ-01 — The Silent Frontier (Lv 1, Solo, Lord Ector)

Generiert per Copilot (2026-07-21). Prompt-Vorlage: siehe PROMPTS.md-Historie/Albion_Epic_Questline.md-Muster.

> **Quest Title:** The Silent Frontier
>
> **Quest Description:** Several of Lord Ector's border scouts have failed to return from their patrols along the frontier. What first seemed like poor weather or delayed travel now feels far more troubling. Investigate the scouts' last known route and uncover any sign of what befell them.
>
> **Objectives:**
> 1. Travel to the frontier watch road and inspect the scouts' last reported camp.
> 2. Search the surrounding area for traces of the missing patrol.
> 3. Return your findings to Lord Ector.
>
> **Opening Dialogue (Lord Ector):**
> Our border scouts know these lands better than most men know their own hearths, yet several have vanished without word.
> At first I took it for bad weather or a broken supply train. Now I fear something else is at work.
> Ride to their last reported camp and see what can be learned.
> I would rather discover a simple answer than nurture darker suspicions.
>
> **Closing Dialogue (Lord Ector):**
> Tracks ending in open ground... abandoned gear... and no bodies found. That is a hard tale to weigh.
> The frontier has always been dangerous, yet this bears little resemblance to an ordinary ambush.
> If our scouts were taken, then by whom—and why leave so little behind?
> Stay vigilant. I suspect this matter is only beginning.

Trifft den gewünschten Ton gut (bedächtig, kein Bodyfund als billiger Cliffhanger, endet in offener Frage statt Auflösung) – passt direkt als Übergabe an AEQ-02.

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### AEQ-02 — Shadows Across the Border (Lv 2, Solo, Lord Ector)

Generiert per Copilot (2026-07-21).

> **Quest Title:** Shadows Across the Border
>
> **Quest Description:** The clues you uncovered paint a troubling picture. What first seemed like a tragic disappearance now bears the marks of a deliberate intrusion from beyond Albion's borders. Lord Ector must judge the evidence and determine whether a greater threat is gathering in the wilds.
>
> **Objectives:**
> 1. Gather and confirm evidence of the scouts' fate.
> 2. Return the evidence to Lord Ector.
> 3. Receive Lord Ector's orders and report to Burgvogt Kay.
>
> **Lord Ector Dialogue:**
> "You've returned. Tell me, what did you find out there?"
> "A broken banner... tracks from foreign boots... and a weapon unlike any forged in our realm?"
> "No... this was no accident. Our scouts did not simply vanish into the wilderness."
> "Someone crossed our border with purpose, and they took great care to hide their trail."
> "If hostile forces are testing our defenses, we may be facing far more than a handful of missing men."
>
> **Quest Closing:**
> "This matter has grown beyond my authority to ignore. Take what you've found to Burgvogt Kay, my military commander. He will decide our next course of action."

Guter Anschluss an AEQ-01 (greift Banner/Spuren/Waffe als offene Fragen wieder auf), Eskalation von Sorge zu Handlungsbedarf trägt den Ton, sauberer Handoff an Kay für AEQ-03.

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### AEQ-03 — To the Borderlands (Lv 3, Solo, Burgvogt Kay)

Generiert per Copilot (2026-07-21).

> **Quest Title:** To the Borderlands
>
> **Quest Description:** Lord Ector's findings leave little room for doubt: trouble is stirring beyond Albion's borders. Burgvogt Kay has no patience for endless discussions—if war is coming, Albion needs soldiers who can fight, not talk.
> Before assigning you to the frontier patrol, Kay will put your readiness to the test. Prove your skill in training, then ride with Albion's scouts to begin your first watch along the border.
>
> **Objectives:**
> 1. Defeat 5 Training Warriors in the garrison yard.
> 2. Report your success to Burgvogt Kay.
> 3. Join the Border Patrol and travel to the Frontier Watchpost.
>
> **Quest Offer Dialogue (Burgvogt Kay):**
> "Ector has his proof. Good. That's all I needed to hear."
> "If our neighbors are stirring, we'll answer with steel—not speculation."
> "Show me you can hold your own. Settle a few scores in the training yard, then report back."
> "After that, you're riding for the frontier. Albion needs eyes and blades on the border."
>
> **Closing Line from Kay:**
> "The frontier isn't a training yard, recruit. Beyond those walls, every banner you see belongs to someone who wants what Albion has. Ride out, stay sharp, and be ready—the next battle may already be waiting for you."

Kays Ton (ungeduldig, handlungsorientiert) hebt sich klar von Ectors bedächtiger Art ab – funktioniert als Kontrast. Objective 1 ("5 Training Warriors") ist direkt als Kampf-Tutorial nutzbar (Test gegen `BP_Paladin`-ähnliche Trainingsgegner, siehe Task #6), die Closing Line ist eine saubere erzählerische Brücke zur Battleground-Map (Task #8).

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### AEQ-04 — First Blood (Lv 5, Solo, Burgvogt Kay)

Generiert von Claude (2026-07-22), direkt statt über Copilot.

> **Quest Title:** First Blood
>
> **Quest Description:** Burgvogt Kay's border patrol meets its first real resistance — a small band of enemy scouts testing Albion's defenses. Time to prove the training yard wasn't wasted.
>
> **Objectives:**
> 1. Patrol the assigned stretch of the frontier watch road.
> 2. Engage and drive off the enemy scouting party.
> 3. Report the encounter back to Burgvogt Kay.
>
> **Opening Dialogue (Burgvogt Kay):**
> "You made it to the watchpost. Good. Don't get comfortable."
> "Patrols report movement along the eastern stretch — could be nothing. Could be more of what Ector found."
> "Walk the road. If you meet trouble, handle it. That's what you're here for."
>
> **Closing Dialogue (Burgvogt Kay):**
> "Scouts, you said. Not soldiers, not raiders — scouts."
> "That fits. Someone wants to know our numbers before they commit to anything larger."
> "Keep your blade close. This is only the beginning of your watch."

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### AEQ-05 — A Soldier's Instinct (Lv 7, Solo, Wachhauptmann Baldwin)

Generiert von Claude (2026-07-22).

> **Quest Title:** A Soldier's Instinct
>
> **Quest Description:** Guard-Captain Baldwin's watchtower signal fire has gone dark — not through battle, but through deliberate sabotage. Investigate the tower and see what was left behind.
>
> **Objectives:**
> 1. Travel to Baldwin's watchtower along the frontier.
> 2. Search the tower and its surroundings for signs of the intruder.
> 3. Report your findings to Guard-Captain Baldwin.
>
> **Opening Dialogue (Baldwin):**
> "The signal fire's out. Not burned down — put out. Deliberately."
> "No alarm was raised. No one saw a thing. That unsettles me more than any raid would."
> "Go up and look for yourself. Tell me what you find."
>
> **Closing Dialogue (Baldwin):**
> "A rune, you say. Cut clean into the stone, not scratched in haste."
> "That's no mark I've seen on any Midgard or Hibernia blade — and believe me, I've seen plenty of both."
> "I don't like not knowing who we're watching for. Keep that mark in mind. I have a feeling it won't be the last we see of it."

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### AEQ-06 — The Cartographer's Warning (Lv 9, Solo, Kartograf)

Generiert von Claude (2026-07-22).

> **Quest Title:** Lines That Don't Match
>
> **Quest Description:** A cartographer at the local map-guild has noticed something odd — recent border reports don't line up with any existing map. She asks for help surveying the discrepancy before it becomes a real problem.
>
> **Objectives:**
> 1. Speak with the cartographer at the map-guild.
> 2. Survey the disputed stretch of borderland and mark any discrepancies.
> 3. Return the corrected notes to the cartographer.
>
> **Opening Dialogue (Cartographer):**
> "You've got a soldier's eyes — good, I need someone who can tell a real landmark from a rumor."
> "Every report I get from the frontier describes ground that isn't on any map I own. Either the land is changing, or the maps were wrong to begin with."
> "Walk the disputed stretch. Note what's actually there. I'll make sense of it after."
>
> **Closing Dialogue (Cartographer):**
> "So the ridge really has shifted. Interesting — unsettling, but interesting."
> "I'll redraw this section properly. It's a small thing, but small things add up when armies start moving."
> "My thanks. Come back if the land keeps surprising you — I have a feeling it will."

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### MEQ-01 — Trial of the First Blade (Lv 1, Solo, Jarl Skadi)

Generiert von Claude (2026-07-22).

> **Quest Title:** Trial of the First Blade
>
> **Quest Description:** Jarl Skadi tests every newcomer to her hall in the practice ring before granting them so much as a word — prove your blade before you ask for her ear.
>
> **Objectives:**
> 1. Enter the practice ring before the Jarl's hall.
> 2. Defeat the ring's appointed sparring partner.
> 3. Present yourself to Jarl Skadi.
>
> **Opening Dialogue (Jarl Skadi):**
> "Another stranger at my door. Words are cheap — I've heard enough of them."
> "Step into the ring. Show me what you're made of before you waste my time with talk."
> "Win, and I'll listen. Lose, and you can try again tomorrow."
>
> **Closing Dialogue (Jarl Skadi):**
> "Not bad. Not bad at all."
> "You didn't win pretty, but you won. That tells me more than a clean bout would have."
> "Come back tomorrow. One trial proves nothing on its own."

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### MEQ-02 — Prove Your Worth (Lv 2, Solo, Jarl Skadi)

Generiert von Claude (2026-07-22).

> **Quest Title:** Prove Your Worth
>
> **Quest Description:** One bout was not enough. Skadi sets a harder trial — a real hall-warrior this time, no easy opponent.
>
> **Objectives:**
> 1. Return to the practice ring.
> 2. Defeat the hall-warrior chosen by Skadi.
> 3. Stand before Skadi once again.
>
> **Opening Dialogue (Jarl Skadi):**
> "Back again. Good — persistence counts for something here."
> "Yesterday's opponent was a formality. Today's isn't."
> "Bjorn's beaten better than you in that ring. Let's see if you're the exception."
>
> **Closing Dialogue (Jarl Skadi):**
> "Bjorn doesn't lose often. He'll grumble about it for a week."
> "You've proven you can fight. Now we'll see if you can be trusted to fight for something."
> "Go find Hersir Vidar. He's been watching from the shadow of the hall — he doesn't miss much."

Kleiner Kontinuitäts-Bonus: erwähnt Bjorn, denselben Bjorn aus MSQ-01 ("Bjorn's Boast") — verankert die Nebenquest in der Haupthandlung, ohne sie zu duplizieren.

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### MEQ-03 — The Hersir's Summons (Lv 3, Solo, Hersir Vidar)

Generiert von Claude (2026-07-22).

> **Quest Title:** The Hersir's Summons
>
> **Quest Description:** Hersir Vidar watched every bout without a word. Now he has one for you — an invitation into his raiding party, offered the way Midgard offers most things: bluntly.
>
> **Objectives:**
> 1. Find Hersir Vidar at the training yard.
> 2. Accept his terms.
> 3. Collect your gear for the road ahead.
>
> **Opening Dialogue (Hersir Vidar):**
> "You fight well enough. I don't waste breath on compliments, so take that as the highest one you'll get."
> "I'm taking a party to the frontier. I could use someone who doesn't flinch."
> "Say yes or say no. I won't ask twice."
>
> **Closing Dialogue (Hersir Vidar):**
> "Good. Take this — better than what you're carrying now."
> "We ride at first light. Don't be late, and don't slow me down."
> "Skadi tests your blade. I test whether you're worth keeping alive."

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### MEQ-04 — Blood on the Ice (Lv 5, Solo, Hersir Vidar)

Generiert von Claude (2026-07-22).

> **Quest Title:** Blood on the Ice
>
> **Quest Description:** The frontier patrol meets its first real resistance — a band testing Midgard's edges. Vidar wants them answered in kind.
>
> **Objectives:**
> 1. Patrol the frozen border route with Vidar's party.
> 2. Engage the raiding band encountered along the way.
> 3. Report back to Hersir Vidar.
>
> **Opening Dialogue (Hersir Vidar):**
> "Movement on the ice ahead. Could be nothing. Could be a testing party."
> "Either way, we don't run from it. Stay close, hit hard."
> "Let's see what you're made of when it isn't a practice ring."
>
> **Closing Dialogue (Hersir Vidar):**
> "Clean work. No hesitation — I noticed."
> "This won't be the last of it. Something's stirring past the ice, and I intend to find out what."
> "Rest while you can. We're not done here."

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### MEQ-05 — Gunnar's Watch (Lv 7, Solo, Wachhauptmann Gunnar)

Generiert von Claude (2026-07-22).

> **Quest Title:** Gunnar's Watch
>
> **Quest Description:** Watch-Captain Gunnar's post has gone silent — no fight, no fire, no tracks leading away. Just an empty post, which unsettles him more than an obvious attack would.
>
> **Objectives:**
> 1. Travel to Gunnar's watch post along the border.
> 2. Search the post for any sign of what happened.
> 3. Report your findings to Watch-Captain Gunnar.
>
> **Opening Dialogue (Gunnar):**
> "My watch post's gone quiet. Not attacked — quiet. There's a difference, and I don't like it."
> "No blood, no fire, no tracks leading off into the dark. Just... nothing."
> "Go take a look. Tell me if you see it the way I see it."
>
> **Closing Dialogue (Gunnar):**
> "No struggle. No sign anyone even raised a blade."
> "A raid, I could answer. This — I don't know how to answer this."
> "Whatever did this wasn't interested in a fight. That's what worries me most."

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### MEQ-06 — The Skald's Doubt (Lv 9, Solo, Skald)

Generiert von Claude (2026-07-22).

> **Quest Title:** The Skald's Doubt
>
> **Quest Description:** A traveling skald passing through the hall insists the old sagas describe the borderlands differently than they lie today — a curiosity worth checking, if nothing else.
>
> **Objectives:**
> 1. Listen to the skald's tale at the hall.
> 2. Travel to the landmark described in the saga.
> 3. Return and tell the skald what you found.
>
> **Opening Dialogue (Skald):**
> "You look like someone who walks the border. Tell me — does the old saga-ridge still stand where the songs say it does?"
> "I've sung that verse a hundred times without ever checking. Strange, when you think about it."
> "Humor an old singer. Go and see."
>
> **Closing Dialogue (Skald):**
> "Moved, you say. Or maybe it was never quite where the song claimed."
> "Sagas drift like ice on the fjord — a little each year, until one day nothing matches."
> "Still. Worth knowing. I'll sing it truer next time — assuming there's a next time worth singing about."

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### HEQ-01 — The Fading Grove (Lv 1, Solo, Rí Aengus)

Generiert von Claude (2026-07-22).

> **Quest Title:** The Fading Grove
>
> **Quest Description:** A grove near Rí Aengus' keep has begun losing its vitality — no visible wound, no sign of disease, just a slow and wrong kind of fading. Aengus asks you to look, more from unease than any real suspicion yet.
>
> **Objectives:**
> 1. Travel to the fading grove near the keep.
> 2. Examine the grove for any sign of what ails it.
> 3. Return to Rí Aengus with what you've found.
>
> **Opening Dialogue (Rí Aengus):**
> "There is a grove not far from here that is... fading. Not burning, not withering as the seasons turn — just fading."
> "I cannot say why it troubles me as much as it does. Perhaps that is reason enough to look."
> "Go and see what the land will show you."
>
> **Closing Dialogue (Rí Aengus):**
> "No blight. No hand of man that you could find. And yet it fades all the same."
> "I had hoped you would return with a simple answer. I confess I am glad you did not — a simple answer would have been a lie."
> "Watch for this, wherever your road takes you next. I fear it will not be the last grove to grow quiet."

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### HEQ-02 — Whispers in the Root (Lv 2, Solo, Rí Aengus)

Generiert von Claude (2026-07-22).

> **Quest Title:** Whispers in the Root
>
> **Quest Description:** A closer look at the fading grove reveals something stranger still — the roots themselves are growing wrong, twisting against the grain of the land.
>
> **Objectives:**
> 1. Return to the fading grove.
> 2. Dig beneath the roots to examine the corruption.
> 3. Bring a sample to Rí Aengus.
>
> **Opening Dialogue (Rí Aengus):**
> "You found no hand of man at the grove, yet still it fades. I would know more."
> "Look beneath it, if you can bear to. The land rarely hides its wounds so deep without reason."
> "Bring back whatever you find. I will not like it, I think — but I would rather not like the truth than trust a comforting lie."
>
> **Closing Dialogue (Rí Aengus):**
> "These roots did not grow this way on their own. Something guided them — or twisted them."
> "This is no sickness of the land I recognize, and I have walked these woods since before you were born."
> "I must think on this. Rest, for now. I fear your road is only beginning."

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### HEQ-03 — Aoife's Trial (Lv 3, Solo, Ceann Cogaidh Aoife)

Generiert von Claude (2026-07-22).

> **Quest Title:** Aoife's Trial
>
> **Quest Description:** Before venturing deeper into the woods, Aoife insists on testing your readiness — Hibernia's skirmish style rewards the prepared, not the reckless.
>
> **Objectives:**
> 1. Meet Ceann Cogaidh Aoife at the training clearing.
> 2. Complete her skirmish trial.
> 3. Receive her judgment.
>
> **Opening Dialogue (Aoife):**
> "Rí Aengus sends you to me now, does he. Sensible — no use walking deeper into trouble unprepared."
> "The deep wood forgives no carelessness. I'll see what you can do before I let you near it."
> "Follow my lead, match my pace, and don't get yourself killed. That's the whole trial."
>
> **Closing Dialogue (Aoife):**
> "You kept your feet under you. That's more than I can say for most who come through here."
> "Hibernia doesn't fight the way Albion or Midgard do — we don't stand and trade blows. We choose when the fight happens."
> "Remember that, and you might just survive what's coming."

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### HEQ-04 — First Skirmish (Lv 5, Solo, Ceann Cogaidh Aoife)

Generiert von Claude (2026-07-22).

> **Quest Title:** First Skirmish
>
> **Quest Description:** Real trouble stirs at the wood's edge — a chance for Aoife to see her newest recruit's training put to use.
>
> **Objectives:**
> 1. Patrol the forest border with Aoife.
> 2. Ambush the intruders spotted at the tree line.
> 3. Report back to Aoife.
>
> **Opening Dialogue (Aoife):**
> "Movement at the tree line. Not ours."
> "Now we find out if my trial taught you anything at all."
> "Stay low, strike fast, and don't give them time to answer."
>
> **Closing Dialogue (Aoife):**
> "Good. Quick, quiet, done before they knew what hit them."
> "That's how Hibernia fights, and how Hibernia survives."
> "There'll be more. Stay sharp."

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### HEQ-05 — Niav's Silence (Lv 7, Solo, Schreinhüterin Niav)

Generiert von Claude (2026-07-22).

> **Quest Title:** Niav's Silence
>
> **Quest Description:** A ritual at Niav's shrine has failed without explanation — the wardstones no longer answer as they should.
>
> **Objectives:**
> 1. Travel to Niav's shrine.
> 2. Observe the failed ritual and examine the wardstones.
> 3. Report your observations to Niav.
>
> **Opening Dialogue (Niav):**
> "The stones did not answer. They have always answered — even when the answer was silence itself, it was a silence I understood."
> "This was different. This was absence."
> "Watch with me. Perhaps a stranger's eyes will see what mine have grown too familiar to notice."
>
> **Closing Dialogue (Niav):**
> "You saw it too, then. Good — I feared I was imagining it."
> "The wardstones are not merely quiet. They are being quieted."
> "I do not yet know by whom, or why. But I do not think this ends with one shrine."

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### HEQ-06 — The Seer's Unease (Lv 9, Solo, Seherin)

Generiert von Claude (2026-07-22).

> **Quest Title:** The Seer's Unease
>
> **Quest Description:** A wandering seer passing through insists the old omens no longer match the land — worth hearing out, if nothing else.
>
> **Objectives:**
> 1. Speak with the seer at the wayside.
> 2. Visit the omen-site she describes.
> 3. Return and share what you saw.
>
> **Opening Dialogue (Seer):**
> "The birds fly wrong this season. The moss grows on the wrong side of the stones. Small things — but I have read this land long enough to know small things matter."
> "There is a place east of here where the wrongness gathers thickest. Go, if you're willing."
> "Tell me plainly what you see. I trust plain eyes more than my own, some days."
>
> **Closing Dialogue (Seer):**
> "As I feared. As I feared, and hoped I was wrong."
> "The land is not sick. The land is being unmade, slowly, in places too small to notice — until they aren't small anymore."
> "Go carefully from here. I think you have only seen the edge of it."

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

### FNQ-05 — Wardstones at the Frontier (Hibernia, Schreinhüterin Niav, Schrein-Eroberungspunkt)

Generiert von Claude (2026-07-22). Bewusst eigenständig von HEQ-05 gehalten (andere Örtlichkeit: Frontier-Eroberungspunkt statt Niavs Heimschrein), aber thematisch verbunden.

> **Quest Title:** Wardstones at the Frontier
>
> **Quest Description:** A shrine near the frontier trembles under the same strange silence spreading elsewhere — Niav asks you to investigate before whatever is happening reaches the border itself.
>
> **Objectives:**
> 1. Travel to the frontier shrine.
> 2. Investigate the dimming wardstones.
> 3. Report back to Niav.
>
> **Opening Dialogue (Niav):**
> "Even here, at the very edge of our lands, the stones grow quiet. I had hoped the frontier would be spared."
> "Go and listen where I cannot. The border keeps its own secrets from those who tend the deep wood."
> "Whatever you find, bring it back whole — even if it is only a feeling."
>
> **Closing Dialogue (Niav):**
> "The frontier shrine fades just as the others do. Whatever this is, it does not respect distance."
> "I fear it does not begin at the border, either — only ends there, for now."
> "Hold this thought close. I believe we will need it again before long."

**Umsetzungs-Checkliste:** siehe generische Liste oben, alle 5 Punkte 🔴.

---

## Status

🟡 Erweitert (2026-07-22) — alle drei Epic-Questlines auf 26 Stufen ausgebaut (vorher je 20), mit vier benannten Instanz-Bossen + Loot-Konzept pro Reich (siehe "Instanzen-Übersicht"). 97 Einträge insgesamt, davon **19 mit fertigem Content** (kompletter Akt 1 aller drei Reiche: AEQ-01–06, MEQ-01–06, HEQ-01–06, plus FNQ-05 — von Claude direkt generiert statt über Copilot, auf Bitte des Nutzers). Kein Eintrag hat bisher Engine-Fortschritt — das Quest-Grundsystem selbst existiert noch nicht (siehe SYSTEMS.md Abschnitt 3, Task #14).
