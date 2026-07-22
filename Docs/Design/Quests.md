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
| AEQ-07 | 11 | Eleanor's Missing Wagons | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-08 | 13 | The Old Ward-Keeper's Journal | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-09 | 15 | Osric's Trail | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-10 | 16 | Recruits of the Watch — **Instanz #1** (Boss: Osric the Turned) | **Gruppe** | 🟢 fertig (unten) | 🔴 |
| AEQ-11 | 18 | Aftermath at the Hollow | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-12 | 20 | Grenzland-Scharmützel (BG-Debüt) | **Gruppe/RvR** | 🟢 fertig (unten) | 🔴 |
| AEQ-13 | 23 | Lord Ector's Suspicion | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-14 | 26 | What the Archives Hide | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-15 | 27 | The Cartographer's Fear | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-16 | 28 | Baldwin's Last Watch — **Instanz #2** (Boss: Leofric the Hollow-Marked) | **Gruppe** | 🟢 fertig (unten) | 🔴 |
| AEQ-17 | 30 | Umkämpftes Hochland (BG-Debüt #2) | **Gruppe/RvR** | 🟢 fertig (unten) | 🔴 |
| AEQ-18 | 33 | The Vanishing Ward-Stone | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-19 | 36 | Kay's Warpath | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-20 | 38 | The Sentinel's Ground | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-21 | 39 | Into the Hollow — **Instanz #3** (Boss: The Hollow Sentinel) | **Gruppe** | 🟢 fertig (unten) | 🔴 |
| AEQ-22 | 42 | The Leader's Name | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-23 | 45 | The Price of an Oath | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-24 | 47 | Muster for the Bastion | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-25 | 49 | The Last Vigil | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-26 | 50 | The Hollow Warden (FINALE — Instanz #4, Boss: Sir Alaric) | **Gruppe, Endgegner** | 🟢 fertig (unten) | 🔴 |

### Midgard Epic Questline (MEQ, Level 1–50, 26 Stufen) — siehe [Midgard_Epic_Questline.md](Midgard_Epic_Questline.md)

| ID | Lv | Titel | Typ | Content | Engine |
|---|---|---|---|---|---|
| MEQ-01 | 1 | Trial of the First Blade | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-02 | 2 | Prove Your Worth | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-03 | 3 | The Hersir's Summons | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-04 | 5 | Blood on the Ice | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-05 | 7 | Gunnar's Watch | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-06 | 9 | The Skald's Doubt | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-07 | 11 | Ulf's Vanishing Ore | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-08 | 13 | The Half-Sworn Rune | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-09 | 15 | Erik's Trail | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-10 | 16 | Wolves Among Wolves — **Instanz #1** (Boss: Erik, First of the Ironbrood) | **Gruppe** | 🟢 fertig (unten) | 🔴 |
| MEQ-11 | 18 | What the Wolves Left Behind | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-12 | 20 | Grenzland-Scharmützel (BG-Debüt) | **Gruppe/RvR** | 🟢 fertig (unten) | 🔴 |
| MEQ-13 | 23 | Skadi's Doubt | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-14 | 26 | The Unbound Oath | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-15 | 27 | The Skald's Warning | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-16 | 28 | Gunnar's Last Stand — **Instanz #2** (Boss: Ingvar of the Ironbrood) | **Gruppe** | 🟢 fertig (unten) | 🔴 |
| MEQ-17 | 30 | Umkämpftes Hochland (BG-Debüt #2) | **Gruppe/RvR** | 🟢 fertig (unten) | 🔴 |
| MEQ-18 | 33 | The Silent Fjord | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-19 | 36 | Vidar's Reckoning | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-20 | 38 | The Iron Wolf's Den | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-21 | 39 | Into the Ironbrood's Hold — **Instanz #3** (Boss: The Iron Wolf) | **Gruppe** | 🟢 fertig (unten) | 🔴 |
| MEQ-22 | 42 | The Wolf Unbound | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-23 | 45 | What Honor Costs | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-24 | 47 | The Long Hunt | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-25 | 49 | The Last Toast | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-26 | 50 | Ragnar Half-Sworn (FINALE — Instanz #4, Boss: Ragnar Half-Sworn) | **Gruppe, Endgegner** | 🟢 fertig (unten) | 🔴 |

### Hibernia Epic Questline (HEQ, Level 1–50, 26 Stufen) — siehe [Hibernia_Epic_Questline.md](Hibernia_Epic_Questline.md)

| ID | Lv | Titel | Typ | Content | Engine |
|---|---|---|---|---|---|
| HEQ-01 | 1 | The Fading Grove | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-02 | 2 | Whispers in the Root | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-03 | 3 | Aoife's Trial | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-04 | 5 | First Skirmish | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-05 | 7 | Niav's Silence | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-06 | 9 | The Seer's Unease | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-07 | 11 | Cormac's Stolen Iron | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-08 | 13 | The Old Grove-Keeper's Rite | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-09 | 15 | Eamon's Trail | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-10 | 16 | The Withering Circle — **Instanz #1** (Boss: Eamon the Withered) | **Gruppe** | 🟢 fertig (unten) | 🔴 |
| HEQ-11 | 18 | What the Roots Remember | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-12 | 20 | Grenzland-Scharmützel (BG-Debüt) | **Gruppe/RvR** | 🟢 fertig (unten) | 🔴 |
| HEQ-13 | 23 | Aengus' Fear | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-14 | 26 | The Rootbound Rite | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-15 | 27 | The Seer's Vision | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-16 | 28 | Niav's Vigil — **Instanz #2** (Boss: Tadhg the Withered) | **Gruppe** | 🟢 fertig (unten) | 🔴 |
| HEQ-17 | 30 | Umkämpftes Hochland (BG-Debüt #2) | **Gruppe/RvR** | 🟢 fertig (unten) | 🔴 |
| HEQ-18 | 33 | The Drowned Dolmen | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-19 | 36 | Aoife's Resolve | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-20 | 38 | The Bramble Threshold | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-21 | 39 | Into the Rootbound Hollow — **Instanz #3** (Boss: The Bramble Warden) | **Gruppe** | 🟢 fertig (unten) | 🔴 |
| HEQ-22 | 42 | The Warden Who Grew Wild | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-23 | 45 | The Wild and the Bound | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-24 | 47 | The Gathering Wood | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-25 | 49 | The Last Rite | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-26 | 50 | Fintan the Rootbound (FINALE — Instanz #4, Boss: Fintan the Rootbound) | **Gruppe, Endgegner** | 🟢 fertig (unten) | 🔴 |

### Nebenquests: Albion (ASQ), Midgard (MSQ), Hibernia (HSQ)

| ID | Reich | Titel | Schwierigkeit | Content | Engine |
|---|---|---|---|---|---|
| ASQ-01 | Albion | Smith Godwin's Request | Leicht | 🟢 fertig (unten) | 🔴 |
| ASQ-02 | Albion | Cedric's Lost Hound | Leicht | 🟢 fertig (unten) | 🔴 |
| ASQ-03 | Albion | The Widow's Debt | Mittel | 🟢 fertig (unten) | 🔴 |
| ASQ-04 | Albion | Rosalind's Cure | Mittel | 🟢 fertig (unten) | 🔴 |
| ASQ-05 | Albion | Harold's Wager | Mittel | 🟢 fertig (unten) | 🔴 |
| ASQ-06 | Albion | The Tax Collector's Ledger | Schwer | 🟢 fertig (unten) | 🔴 |
| MSQ-01 | Midgard | Bjorn's Boast | Leicht | 🟢 fertig (unten) | 🔴 |
| MSQ-02 | Midgard | Astrid's Catch | Leicht | 🟢 fertig (unten) | 🔴 |
| MSQ-03 | Midgard | The Frozen Raiders | Mittel | 🟢 fertig (unten) | 🔴 |
| MSQ-04 | Midgard | Sigrid's Runes | Mittel | 🟢 fertig (unten) | 🔴 |
| MSQ-05 | Midgard | Halvar's Duel | Mittel | 🟢 fertig (unten) | 🔴 |
| MSQ-06 | Midgard | The Ice-Bound Wyrm | Schwer | 🟢 fertig (unten) | 🔴 |
| HSQ-01 | Hibernia | Ronan's Lost Charm | Leicht | 🟢 fertig (unten) | 🔴 |
| HSQ-02 | Hibernia | Siobhan's Herbs | Leicht | 🟢 fertig (unten) | 🔴 |
| HSQ-03 | Hibernia | The Hungry Wood | Mittel | 🟢 fertig (unten) | 🔴 |
| HSQ-04 | Hibernia | Declan's Wager | Mittel | 🟢 fertig (unten) | 🔴 |
| HSQ-05 | Hibernia | Maeve's Warning | Mittel | 🟢 fertig (unten) | 🔴 |
| HSQ-06 | Hibernia | The Old Oak's Grief | Schwer | 🟢 fertig (unten) | 🔴 |

### Frontier-Punkt-NPCs (FNQ) — siehe [Frontier_NPCs_and_Questlines.md](Frontier_NPCs_and_Questlines.md)

| ID | Reich | NPC/Punkt | Content | Engine |
|---|---|---|---|---|
| FNQ-01 | Albion | Wachhauptmann Baldwin, Wachturm | 🟢 fertig (unten) | 🔴 |
| FNQ-02 | Albion | Vorsteherin Eleanor, Dorf | 🟢 fertig (unten) | 🔴 |
| FNQ-03 | Midgard | Wachhauptmann Gunnar, Wachturm | 🟢 fertig (unten) | 🔴 |
| FNQ-04 | Midgard | Minenaufseher Ulf, Mine | 🟢 fertig (unten) | 🔴 |
| FNQ-05 | Hibernia | Schreinhüterin Niav, Schrein | 🟢 fertig (unten) | 🔴 |
| FNQ-06 | Hibernia | Vorsteher Cormac, Schmiedelager | 🟢 fertig (unten) | 🔴 |
| FNQ-07 | Neutral | Namenloser Lagerhauptmann, Belagerungslager | 🟢 fertig (unten) | 🔴 |

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

### Nebenquests: Albion (ASQ)

> **ASQ-01 — Smith Godwin's Request** (Leicht, Item)
> Description: The village smith needs rare ore to finish a commission — a simple errand, but Godwin pays well for reliable hands.
> Objectives: 1. Speak with Smith Godwin. 2. Retrieve ore from the nearby quarry. 3. Deliver the ore to Godwin.
> Opening (Godwin): "You look capable enough. I need ore from the old quarry — my usual supplier's gone quiet. Nothing dangerous, just watch your footing up there."
> Closing (Godwin): "Good stock, this'll do nicely. Here — first blade off my new batch. Better than whatever you're carrying now."

> **ASQ-02 — Cedric's Lost Hound** (Leicht, XP)
> Description: Cedric's hunting hound bolted after a hare and hasn't returned — he's more worried than he'll admit.
> Objectives: 1. Speak with Cedric. 2. Follow the hound's trail into the woods. 3. Bring the hound back to Cedric.
> Opening (Cedric): "You haven't seen a dog running loose, have you? Big fool of a thing, answers to Bramble. Or doesn't, usually."
> Closing (Cedric): "There you are, you menace. My thanks — don't tell the others I fussed over a dog like this."

> **ASQ-03 — The Widow's Debt** (Mittel, Item)
> Description: A farmer named Wulfric is being extorted by highwaymen demanding a "toll" for the road past his fields.
> Objectives: 1. Speak with Wulfric at his farm. 2. Locate the highwaymen's camp. 3. Drive off the highwaymen.
> Opening (Wulfric): "They come every fortnight now. Say it's a toll for using 'their' road — my own road, mind you. I've paid twice. Can't afford a third."
> Closing (Wulfric): "Gone, truly gone? I'll believe it when the harvest comes in undisturbed. Take this — little enough, but honest."

> **ASQ-04 — Rosalind's Cure** (Mittel, XP)
> Description: A herbalist needs a rare mountain flower to finish a fever cure — it only grows on dangerous, exposed terrain.
> Objectives: 1. Speak with Rosalind. 2. Climb to the ridge where the flower grows. 3. Return the flower to Rosalind.
> Opening (Rosalind): "Frostbloom, it's called. Grows where sensible people don't go. A child in the village has a fever that won't break. I need it soon."
> Closing (Rosalind): "Perfect condition, you didn't crush the petals. The fever will break by morning, I expect. You've done more good than you know."

> **ASQ-05 — Harold's Wager** (Mittel, Item)
> Description: A soldier named Harold bet he could clear a den of wolves alone — pride made poor company.
> Objectives: 1. Investigate Harold's camp. 2. Track him to the wolf den. 3. Help Harold fight free.
> Opening (Harold, before setting out): "A den of wolves, alone, no help needed. Wager stands — thirty coin says I clear it before dusk. Come along if you like. You can watch."
> Closing (Harold, humbled): "...Don't. Just — don't say it. Bring the wager back after this? I'll owe you more than coin at this rate."

> **ASQ-06 — The Tax Collector's Ledger** (Schwer, Item besonders)
> Description: A corrupt tax official has been skimming coin from villagers under threat — proving it takes more than accusations.
> Objectives: 1. Gather testimony from affected villagers. 2. Recover the collector's private ledger. 3. Decide how to handle what you've found.
> Opening (Village Elder): "He takes more than the crown allows, and threatens any who speak of it. Proof is what we lack. Words alone won't move a lord's court."
> Closing (Village Elder): "This ledger... this is damning. You've done what none of us dared. What happens to him now is not for me to say — but the village thanks you."

### Nebenquests: Midgard (MSQ)

> **MSQ-01 — Bjorn's Boast** (Leicht, XP)
> Description: Bjorn won't stop bragging about a victory that grows taller with each telling — a sparring match should set the record straight.
> Objectives: 1. Speak with Bjorn. 2. Accept his sparring challenge. 3. Defeat him in the practice ring.
> Opening (Bjorn): "You've heard the story, surely — how I felled three raiders with one stroke? Doubt me, do you? Prove it in the ring, then."
> Closing (Bjorn): "...Perhaps it was one raider. And perhaps I stumbled. Fine bout, though. Don't let it go to your head."

> **MSQ-02 — Astrid's Catch** (Leicht, Item)
> Description: Astrid needs a good haul of fish for the coming hall-feast.
> Objectives: 1. Speak with Astrid. 2. Fish the marked stretch of the fjord. 3. Deliver the catch to Astrid.
> Opening (Astrid): "The feast is in two days and my nets are empty. Fetch me a proper catch, would you? Mind the current past the rocks — stronger than it looks."
> Closing (Astrid): "Now that's a haul, the hall will eat well tonight. Take this for your trouble — caught fresh, cooked better."

> **MSQ-03 — The Frozen Raiders** (Mittel, Item)
> Description: Bandits have been raiding fishing villages along the coast — Sven wants them answered before winter makes it worse.
> Objectives: 1. Speak with Sven. 2. Track the raiders to their coastal camp. 3. Drive off the raiders.
> Opening (Sven): "Three villages robbed this month. Fishing folk, not warriors — easy prey, they think. Someone should remind them our coast isn't undefended."
> Closing (Sven): "Good. Let word spread of what happens to those who prey on the weak. You've earned this."

> **MSQ-04 — Sigrid's Runes** (Mittel, XP)
> Description: A rune-carver needs rare stones from dangerous cliffside terrain.
> Objectives: 1. Speak with Sigrid. 2. Climb the cliffs to gather rune-stones. 3. Return the stones to Sigrid.
> Opening (Sigrid): "The stones I need only form where the cliffs meet the sea-spray. Dangerous footing, but worth it."
> Closing (Sigrid): "These will hold a fine edge of luck. My thanks — you've a steady hand, for someone who isn't a carver."

> **MSQ-05 — Halvar's Duel** (Mittel, Item)
> Description: Halvar has an honor duel to settle and could use help preparing.
> Objectives: 1. Speak with Halvar. 2. Help him prepare for the duel. 3. Witness the duel's outcome.
> Opening (Halvar): "A duel, over an old insult that should've been forgotten years ago. Too late now — honor demands it."
> Closing (Halvar): "Won, though it cost me more bruises than I'd like to admit. Take this — you earned a share of the victory."

> **MSQ-06 — The Ice-Bound Wyrm** (Schwer, Item besonders)
> Description: A dangerous beast lies half-dormant in the ice near a village, waking as the season turns.
> Objectives: 1. Speak with Torvald. 2. Track the beast to its icy lair. 3. Defeat the wyrm before it fully wakens.
> Opening (Torvald): "It's been sleeping in the ice as long as anyone remembers. Now it's stirring, and I don't like what that means."
> Closing (Torvald): "You actually did it. Take its fang as proof — and as payment. You've earned both."

### Nebenquests: Hibernia (HSQ)

> **HSQ-01 — Ronan's Lost Charm** (Leicht, XP)
> Description: Ronan lost a charm he swears keeps ill luck away.
> Objectives: 1. Speak with Ronan. 2. Search the path he walked that morning. 3. Return the charm to Ronan.
> Opening (Ronan): "My charm's gone. Lost it on the low path, I think. Silly to fuss over a trinket, I know. But bad luck follows fast once it starts."
> Closing (Ronan): "There it is. You've no idea what a weight off my shoulders this is."

> **HSQ-02 — Siobhan's Herbs** (Leicht, Item)
> Description: A healer needs a fresh supply of herbs from the nearby woods.
> Objectives: 1. Speak with Siobhan. 2. Gather the herbs she describes. 3. Deliver them to Siobhan.
> Opening (Siobhan): "The woods this time of year are generous, if you know where to look. Bring me a good bundle."
> Closing (Siobhan): "Fresh and unbruised — you have a gentle hand. Take this in thanks."

> **HSQ-03 — The Hungry Wood** (Mittel, Item)
> Description: Corrupted wildlife has been attacking travelers on the forest path.
> Objectives: 1. Speak with Declan. 2. Locate the creatures' nest. 3. Clear the nest.
> Opening (Declan): "Something's wrong with the animals near the old path. Vicious, where they used to be shy. Deal with it before a traveler pays the price."
> Closing (Declan): "Good, the path should be safe again — for now. You've done the wood a favor, whether it knows it or not."

> **HSQ-04 — Declan's Wager** (Mittel, XP)
> Description: Declan claims he can outhunt anyone in the district.
> Objectives: 1. Speak with Declan. 2. Hunt game in the marked territory. 3. Return with more game than Declan.
> Opening (Declan): "You hunt, do you? Wager says I bring back more game than you by sundown. Loser buys the ale."
> Closing (Declan): "...Fine. Fine! You win this round. Ale's on me — don't let it go to your head."

> **HSQ-05 — Maeve's Warning** (Mittel, Item)
> Description: A seer named Maeve had an ominous vision and wants a specific site investigated.
> Objectives: 1. Speak with Maeve. 2. Investigate the site from her vision. 3. Report your findings to Maeve.
> Opening (Maeve): "I dreamed of a hollow tree bleeding sap black as pitch. I do not dream idly. Find it. Tell me if the dream lied."
> Closing (Maeve): "It did not lie, then. I feared as much. Take this — small thanks for confirming a fear I'd hoped was nothing."

> **HSQ-06 — The Old Oak's Grief** (Schwer, Item besonders)
> Description: An ancient tree, old enough to be a minor spirit of the wood, is dying from unknown corruption.
> Objectives: 1. Speak with Brenna. 2. Travel to the ancient oak. 3. Attempt to ease its suffering or uncover the cause.
> Opening (Brenna): "The old oak has stood since before my grandmother's grandmother. Now it weeps sap like tears, and I do not know why. It should not die alone and unwitnessed."
> Closing (Brenna): "You stayed with it. That matters more than you know, even if you found no cure. Whatever comes for it, comes for all of us in time."

**Umsetzungs-Checkliste (alle 18 Nebenquests):** siehe generische Liste oben, alle 5 Punkte 🔴.

## Akt 2 (Level 11–20/13–20): Instanz-Vorlauf und BG-Debüt aller drei Reiche

### Albion (AEQ-07 bis AEQ-12)

> **AEQ-07 — Eleanor's Missing Wagons** (Lv 11, Solo, Vorsteherin Eleanor)
> Description: Supply wagons bound for the frontier have been vanishing along the trade road — not the work of rival scouts, Eleanor suspects.
> Objectives: 1. Speak with Vorsteherin Eleanor. 2. Investigate the last wagon's route. 3. Report your findings to Eleanor.
> Opening (Eleanor): "Three wagons gone this month. Rival raiders take goods and leave a mess — whoever's doing this leaves nothing at all."
> Closing (Eleanor): "No wreckage, no bodies, no tracks worth following... just gone. That's not raiders. That's something far more careful."

> **AEQ-08 — The Old Ward-Keeper's Journal** (Lv 13, Solo, Fundstück)
> Description: A centuries-old journal found near a ruined chapel speaks of "the Oath that was broken" — a name lost to time, until now.
> Objectives: 1. Search the ruined chapel. 2. Recover the journal. 3. Bring it to Lord Ector for study.
> Journal Excerpt (kein NPC-Dialog, Fundtext): "...the Order swore to hold the seal unbroken until the world's ending. Those who could not bear the weight of that oath left in the night, and we do not speak their names..."

> **AEQ-09 — Osric's Trail** (Lv 15, Solo, Burgvogt Kay)
> Description: Evidence points to a former Albion soldier turned traitor — Osric — now leading a hidden cell near the borderlands.
> Objectives: 1. Question locals near the abandoned homestead. 2. Follow the trail to Osric's hideout. 3. Report the location to Burgvogt Kay.
> Opening (Kay): "A name, finally — Osric. Former soldier, good one too, before he vanished years back. Find where he's hiding."
> Closing (Kay): "Good work. Now we hit that hideout before he knows we're coming. Gather your strength — this won't be a solo fight."

> **AEQ-10 — Recruits of the Watch** (Lv 16, **Instanz #1**, Boss: Osric the Turned)
> Description: A full assault on Osric's hidden cell — the first real confrontation with the group behind the border's troubles.
> Objectives: 1. Enter the hideout with your group. 2. Clear the outer chamber. 3. Defeat Osric the Turned.
> Opening (Kay): "This is it. Whatever Osric's become, he was Albion once — don't let that stay your hand."
> Closing (Fundtext auf Osric): a torn oath-parchment reading "...the Oath was never meant to last forever..."

> **AEQ-11 — Aftermath at the Hollow** (Lv 18, Solo, Lord Ector)
> Description: Sorting through what Osric's cell left behind reveals plans far larger than a single hideout.
> Objectives: 1. Search the hideout's remains. 2. Recover any surviving documents. 3. Deliver them to Lord Ector.
> Closing (Ector): "These plans... they speak of the relic itself, not merely our borders. I fear Osric was never more than a piece on someone else's board."

> **AEQ-12 — Grenzland-Scharmützel** (Lv 20, **Gruppe/RvR, BG-Debüt**, Burgvogt Kay)
> Description: With the frontier boiling over, Burgvogt Kay leads Albion's first real push into open Battleground combat — the war stops being distant.
> Objectives: 1. Speak with Burgvogt Kay. 2. Join the Grenzland-Scharmützel Battleground. 3. Help secure Albion's foothold.
> Opening (Kay): "This is no longer scouts and shadows. This is the real thing. Get out there and hold the line."
> Closing (Kay): "First blood in a real battle. Remember this feeling — it doesn't get easier, only more familiar."

### Midgard (MEQ-07 bis MEQ-12)

> **MEQ-07 — Ulf's Vanishing Ore** (Lv 11, Solo, Minenaufseher Ulf)
> Description: Ore shipments keep disappearing en route to the smiths — too disciplined a pattern for common thieves.
> Objectives: 1. Speak with Minenaufseher Ulf. 2. Investigate the mine route. 3. Report back to Ulf.
> Opening (Ulf): "Ore's vanishing before it reaches the forges. Thieves are sloppy — this isn't sloppy."
> Closing (Ulf): "No cart tracks leading off, no struggle at the checkpoints. Whoever's doing this knows exactly what they're doing."

> **MEQ-08 — The Half-Sworn Rune** (Lv 13, Solo, Fundstück)
> Description: A broken oath-ring bearing an unfamiliar rune surfaces near an abandoned camp — the first real clue to a group with no known allegiance.
> Objectives: 1. Search the abandoned camp. 2. Recover the broken ring. 3. Show it to Hersir Vidar.
> Closing (Vidar): "I don't know this mark. And I know every warband's mark worth knowing. That bothers me more than I'd like to admit."

> **MEQ-09 — Erik's Trail** (Lv 15, Solo, Hersir Vidar)
> Description: The rune leads to a name — Erik, once a promising warrior, now leading a warband that answers to no jarl.
> Objectives: 1. Question travelers near the border camp. 2. Track Erik's warband to their lair. 3. Report the location to Hersir Vidar.
> Opening (Vidar): "Erik. I remember him — strong arm, weak temper. Find where he's hiding."
> Closing (Vidar): "Good. Gather your strength. This one won't go down without a real fight."

> **MEQ-10 — Wolves Among Wolves** (Lv 16, **Instanz #1**, Boss: Erik, First of the Ironbrood)
> Description: A full assault on Erik's hidden lair — the first real confrontation with the Ironbrood.
> Objectives: 1. Enter the lair with your group. 2. Clear the outer camp. 3. Defeat Erik, First of the Ironbrood.
> Opening (Vidar): "Whatever he's become, he bleeds like anyone else. Show him that."
> Closing (Fundtext auf Erik): a battered, half-melted oath-ring engraved "no oath outlasts the blade that breaks it."

> **MEQ-11 — What the Wolves Left Behind** (Lv 18, Solo, Jarl Skadi)
> Description: Documents recovered from Erik's lair hint at something far bigger than a rogue warband.
> Objectives: 1. Search the lair's remains. 2. Recover surviving documents. 3. Deliver them to Jarl Skadi.
> Closing (Skadi): "This isn't just dishonor, this is design. Someone is building toward something, and Erik was only the beginning."

> **MEQ-12 — Grenzland-Scharmützel** (Lv 20, **Gruppe/RvR, BG-Debüt**, Hersir Vidar)
> Description: Hersir Vidar leads Midgard's first real push into open Battleground combat.
> Objectives: 1. Speak with Hersir Vidar. 2. Join the Grenzland-Scharmützel Battleground. 3. Help secure Midgard's foothold.
> Opening (Vidar): "No more shadows and rumors. This is a real fight now. Go earn your place in it."
> Closing (Vidar): "You held your ground. That's worth more than any boast in the hall."

### Hibernia (HEQ-07 bis HEQ-12)

> **HEQ-07 — Cormac's Stolen Iron** (Lv 11, Solo, Vorsteher Cormac)
> Description: Materials bound for Cormac's forge keep vanishing — too precise a pattern for ordinary bandits.
> Objectives: 1. Speak with Vorsteher Cormac. 2. Investigate the supply route. 3. Report back to Cormac.
> Opening (Cormac): "My iron's disappearing before it reaches the forge. Bandits leave a mess. This leaves nothing."
> Closing (Cormac): "No signs of struggle, no dropped goods. Whoever's taking it wants precisely what they take and nothing more."

> **HEQ-08 — The Old Grove-Keeper's Rite** (Lv 13, Solo, Fundstück)
> Description: A forgotten stone circle holds the remnants of an ancient guardian rite — twisted, and recently used by unknown hands.
> Objectives: 1. Search the forgotten stone circle. 2. Examine the disturbed ritual markings. 3. Report your findings to Rí Aengus.
> Closing (Aengus): "This rite... it is ours, or was. Someone has taken what my ancestors made to protect, and bent it toward something else."

> **HEQ-09 — Eamon's Trail** (Lv 15, Solo, Ceann Cogaidh Aoife)
> Description: The corrupted rite leads to a name — Eamon, once a respected grove-tender, now leading a cell in the deep wood.
> Objectives: 1. Question the woodfolk near the corrupted grove. 2. Track Eamon's cell to their hollow. 3. Report the location to Ceann Cogaidh Aoife.
> Opening (Aoife): "Eamon. I trained beside him once. Find where he's gone to ground."
> Closing (Aoife): "Gather what allies you can. Whatever he's become, he won't come quietly."

> **HEQ-10 — The Withering Circle** (Lv 16, **Instanz #1**, Boss: Eamon the Withered)
> Description: A full assault on Eamon's corrupted grove — the first real confrontation with the Withered Circle.
> Objectives: 1. Enter the corrupted grove with your group. 2. Clear the outer grove. 3. Defeat Eamon the Withered.
> Opening (Aoife): "Whatever grew wrong in him can be cut away. Or ended. Either serves."
> Closing (Fundtext auf Eamon): a withered branch carved with spiraling marks, still faintly warm to the touch.

> **HEQ-11 — What the Roots Remember** (Lv 18, Solo, Rí Aengus)
> Description: What's left of Eamon's grove hints at a purpose far larger than one corrupted cell.
> Objectives: 1. Search the grove's remains. 2. Recover any surviving markings or writings. 3. Bring them to Rí Aengus.
> Closing (Aengus): "This was never only about one grove, or one man. Something deeper stirs, and I fear we have only glimpsed its edge."

> **HEQ-12 — Grenzland-Scharmützel** (Lv 20, **Gruppe/RvR, BG-Debüt**, Ceann Cogaidh Aoife)
> Description: Ceann Cogaidh Aoife leads Hibernia's first real push into open Battleground combat.
> Objectives: 1. Speak with Ceann Cogaidh Aoife. 2. Join the Grenzland-Scharmützel Battleground. 3. Help secure Hibernia's foothold.
> Opening (Aoife): "The quiet fighting is over, for now. Go make yourself useful where it counts."
> Closing (Aoife): "You fought well. Remember how it felt — the frontier will ask this of you again."

**Umsetzungs-Checkliste (alle 18 Akt-2-Quests):** siehe generische Liste oben, alle 5 Punkte 🔴.

## Frontier-Punkt-NPCs (FNQ-01 bis FNQ-04, FNQ-06, FNQ-07)

Hinweis zur Abgrenzung: FNQ-01/02/04 haben denselben NPC/dieselbe Ausgangslage wie AEQ-05/07 bzw. MEQ-07 (Baldwin/Eleanor/Ulf), sind hier aber bewusst als **Folgequest nach der Hauptstory** angelegt — der ursprüngliche Vorfall ist gelöst, jetzt geht es um dauerhafte Sicherung des Punktes (passt zum "regionalen Bonus"-Konzept aus Frontier_NPCs_and_Questlines.md Abschnitt 3), nicht um eine zweite, widersprüchliche Ermittlung.

> **FNQ-01 — Baldwin's Watch, Rekindled** (Albion, Wachhauptmann Baldwin, Wachturm)
> Description: With the culprit gone but the tower's signal fire still out, Baldwin needs it relit — and shown how holding this point matters beyond one man's watch.
> Objectives: 1. Speak with Wachhauptmann Baldwin. 2. Relight the signal fire. 3. Learn how holding the watchtower benefits Albion's forces.
> Opening (Baldwin): "The one who did this is dealt with, but the fire's still dark. A watchtower that can't signal is worth nothing."
> Closing (Baldwin): "There — burning true again. Hold this tower when it matters, and Albion sees farther than any enemy expects."

> **FNQ-02 — Eleanor's Lasting Watch** (Albion, Vorsteherin Eleanor, Dorf)
> Description: With the wagon raiders dealt with, Eleanor wants a standing arrangement — a reliable escort route to keep supplies flowing to the frontier.
> Objectives: 1. Speak with Vorsteherin Eleanor. 2. Escort a supply wagon safely along the route. 3. Confirm the route is secure for regular use.
> Opening (Eleanor): "The raiders are gone, but I won't rest until I know this route holds. Escort the next wagon yourself — see it through."
> Closing (Eleanor): "Delivered safe and whole. This village will keep Albion's soldiers fed and equipped as long as this road stays open."

> **FNQ-03 — Gunnar's Standard** (Midgard, Wachhauptmann Gunnar, Wachturm)
> Description: Gunnar won't let just anyone stand watch at his tower — prove your discipline before he'll trust you with the post.
> Objectives: 1. Speak with Wachhauptmann Gunnar. 2. Complete his watch-discipline trial. 3. Receive his approval.
> Opening (Gunnar): "A tower's only as good as the one watching it. Show me you can hold still and hold sharp, both."
> Closing (Gunnar): "Good enough. Stand this watch when it's needed, and I'll not have cause to doubt you again."

> **FNQ-04 — Ulf's Reckoning** (Midgard, Minenaufseher Ulf, Mine)
> Description: With the ore thieves dealt with, Ulf wants the mine route proven safe for good — a standing patrol duty, not a one-time fix.
> Objectives: 1. Speak with Minenaufseher Ulf. 2. Patrol the mine route with an ore shipment. 3. Confirm the route is secure.
> Opening (Ulf): "One clean run isn't proof of anything. Walk the route with the next shipment — see it through yourself."
> Closing (Ulf): "Delivered without a scratch. Good. This mine feeds Midgard's forges — I'd sleep easier knowing it's watched."

> **FNQ-06 — Cormac's Rare Ore** (Hibernia, Vorsteher Cormac, Schmiedelager)
> Description: Cormac needs rare materials from the contested borderland to keep arming Hibernia's skirmishers — dangerous ground, but necessary.
> Objectives: 1. Speak with Vorsteher Cormac. 2. Gather the rare ore from the contested borderland. 3. Deliver it to Cormac.
> Opening (Cormac): "The metal I need only comes from ground neither side fully holds. Dangerous, but my forge runs dry without it."
> Closing (Cormac): "This'll arm a dozen skirmishers properly. You've done more for Hibernia's defense than you know."

> **FNQ-07 — No Banner, No Loyalty** (Neutral, Namenloser Lagerhauptmann, Belagerungslager)
> Description: A mercenary camp flying no banner offers help to whoever pays — the nameless captain won't say which side he favors, if any.
> Objectives: 1. Approach the bannerless camp. 2. Negotiate terms with the nameless captain. 3. Complete the task he sets, and observe the consequences.
> Opening (Nameless Captain): "No banner over my camp, because I answer to no realm. Coin, though — coin I understand."
> Closing (Nameless Captain): "Done, and done well. What happens to the Bastion because of it... that's not my concern. Was never my concern."

**Umsetzungs-Checkliste (FNQ-01–04/06/07):** siehe generische Liste oben, alle 5 Punkte 🔴.

## Akt 3 (Level 23–35): Risse im Siegel — alle drei Reiche

### Albion (AEQ-13 bis AEQ-18)

> **AEQ-13 — Lord Ector's Suspicion** (Lv 23, Solo, Lord Ector)
> Description: Ector wants answers from Albion's own archives — if Osric's group has roots in the old Order, the records should say so.
> Objectives: 1. Speak with Lord Ector. 2. Travel to the Bibliotheksfeste archive. 3. Begin the search Ector has requested.
> Opening (Ector): "Osric spoke of an Oath before he fell. I would know what oath, and who swore it first. Our archives may hold the answer."
> Closing (Ector): "Take what time you need in the archive. If the answer is there, I would rather know it slowly than not at all."

> **AEQ-14 — What the Archives Hide** (Lv 26, Solo, Gelehrte)
> Description: Buried in Albion's oldest records lies the truth of the Order that once bound the relic's seal — and the schism that broke it.
> Objectives: 1. Search the archive's oldest records. 2. Piece together the account of the Order's founding. 3. Report the discovery to Lord Ector.
> Opening (Gelehrte): "Few come looking this deep. Whatever you're chasing, I hope you're prepared for what these shelves remember."
> Closing (Gelehrte): "So it's true. The Order that raised the seal also broke over it — some swore to guard it forever, others could not bear the cost. Take this to your Lord."

> **AEQ-15 — The Cartographer's Fear** (Lv 27, Solo, Kartograf)
> Description: The cartographer from the map-guild has fled to a new region, badly shaken — what she's found matches the archive's darkest warnings.
> Objectives: 1. Locate the cartographer in her new refuge. 2. Hear her account of the corrupted region. 3. Report back to Lord Ector.
> Opening (Cartographer): "You again. Good — I don't know who else would believe me. The land past the ridge isn't just shifting anymore. It's wrong."
> Closing (Cartographer): "Take my notes, if they're worth anything. I won't be going back there myself. Some maps are better left unfinished."

> **AEQ-16 — Baldwin's Last Watch** (Lv 28, **Instanz #2**, Boss: Leofric the Hollow-Marked)
> Description: A large Broken Oath force besieges Baldwin's tower — Albion's forces must break the siege before the tower falls.
> Objectives: 1. Reach Baldwin's tower with your group. 2. Break the siege lines. 3. Defeat Leofric the Hollow-Marked.
> Opening (Baldwin): "They came at dawn, more of them than I've ever seen. I can hold a little longer — but not forever."
> Closing (Baldwin): "You came. I wasn't certain anyone would, in time. Whoever their commander was, he won't trouble this tower again."

> **AEQ-17 — Umkämpftes Hochland** (Lv 30, **Gruppe/RvR, BG-Debüt #2**, Burgvogt Kay)
> Description: The Broken Oath's escalation has dragged the RvR war into the contested highlands — Albion answers in force.
> Objectives: 1. Muster with Albion's forces. 2. Join the Umkämpftes Hochland Battleground. 3. Push back the opposing realms.
> Opening (Kay): "The highlands are burning with more than just Albion's fire. Get out there."
> Closing (Kay): "Hard-fought ground, but ours for now. Whatever's driving this war wider, it's working exactly as they intended."

> **AEQ-18 — The Vanishing Ward-Stone** (Lv 33, Solo, Lord Ector)
> Description: A wardstone near the border has gone completely dark — the same wrongness now confirmed across all three realms.
> Objectives: 1. Travel to the border wardstone. 2. Examine the extinguished stone. 3. Report the finding to Lord Ector.
> Closing (Ector): "Dark, you say — not damaged, not destroyed. Dark, as if something drank the light from it. I begin to fear this was never only about Albion's border."

### Midgard (MEQ-13 bis MEQ-18)

> **MEQ-13 — Skadi's Doubt** (Lv 23, Solo, Jarl Skadi)
> Description: Skadi senses something dishonorable in the recent raids — she sends the player to the old oath-halls for answers.
> Objectives: 1. Speak with Jarl Skadi. 2. Travel to the old Eideshalle. 3. Begin the search she's asked for.
> Opening (Skadi): "Erik broke no honest oath — he never swore one worth breaking, I think. But someone did, once. Find out who."
> Closing (Skadi): "Take what you need from the old halls. I want the truth, however unwelcome it proves."

> **MEQ-14 — The Unbound Oath** (Lv 26, Solo, Älteste)
> Description: The old oath-halls remember a warrior who broke his sworn word to save his warband — and was exiled for it rather than honored.
> Objectives: 1. Search the old oath-hall records. 2. Piece together the account. 3. Report the discovery to Jarl Skadi.
> Opening (Älteste): "You've come far to dig up an old shame. Few do, these days."
> Closing (Älteste): "Ragnar, his name was. He broke his oath to save his people and was cast out for the saving, not spared for it. Take that back to your Jarl."

> **MEQ-15 — The Skald's Warning** (Lv 27, Solo, Skald)
> Description: The traveling skald has since witnessed a corrupted region matching the oath-hall's darkest verses — badly shaken by what he saw.
> Objectives: 1. Find the skald in his new camp. 2. Hear his account of the corrupted region. 3. Report back to Jarl Skadi.
> Opening (Skald): "You again. Good — I need someone who'll believe a singer over their own doubt. What I saw past the misty cliffs wasn't in any saga I know."
> Closing (Skald): "Take my account, such as it is. I'll not sing that verse again until I understand it myself."

> **MEQ-16 — Gunnar's Last Stand** (Lv 28, **Instanz #2**, Boss: Ingvar of the Ironbrood)
> Description: A large Ironbrood force besieges Gunnar's watch post — Midgard's warriors must break the siege before it falls.
> Objectives: 1. Reach Gunnar's post with your group. 2. Break the siege lines. 3. Defeat Ingvar of the Ironbrood.
> Opening (Gunnar): "More of them than I've ever faced. I'll hold as long as I can — no longer promise than that."
> Closing (Gunnar): "You came. Whoever led that assault, he won't trouble this post again. My thanks — more than words can carry."

> **MEQ-17 — Umkämpftes Hochland** (Lv 30, **Gruppe/RvR, BG-Debüt #2**, Hersir Vidar)
> Description: The Ironbrood's escalation drags the RvR war into the contested highlands — Midgard answers in force.
> Objectives: 1. Muster with Midgard's forces. 2. Join the Umkämpftes Hochland Battleground. 3. Push back the opposing realms.
> Opening (Vidar): "The highlands are burning with more than Midgard's fire. Get out there and make them regret it."
> Closing (Vidar): "Hard-fought ground, but ours for now. Whatever's driving this wider war, it's working exactly as intended."

> **MEQ-18 — The Silent Fjord** (Lv 33, Solo, Jarl Skadi)
> Description: A runestone along the coast has gone completely dark — the same wrongness spreading everywhere else.
> Objectives: 1. Travel to the coastal runestone. 2. Examine the extinguished stone. 3. Report the finding to Jarl Skadi.
> Closing (Skadi): "Dark, not broken. I don't like what that tells me. This was never only about Erik, or Ragnar, or any one man's grudge."

### Hibernia (HEQ-13 bis HEQ-18)

> **HEQ-13 — Aengus' Fear** (Lv 23, Solo, Rí Aengus)
> Description: Aengus sends the player to Hibernia's oldest stone-circle archive, hoping to understand the corruption at its root.
> Objectives: 1. Speak with Rí Aengus. 2. Travel to the Steinkreis-Archiv. 3. Begin the search he's requested.
> Opening (Aengus): "Eamon spoke of no oath, no order — only of undoing what was bound. I fear that is an older story than I know. The old archive may remember what I do not."
> Closing (Aengus): "Take what time the stones will allow you. I would rather know the truth slowly than lose the land to ignorance."

> **HEQ-14 — The Rootbound Rite** (Lv 26, Solo, Gelehrte)
> Description: The stone-circle archive remembers a guardian who tried to bind himself to the land forever — and the ritual that consumed him.
> Objectives: 1. Search the archive's oldest carvings. 2. Piece together the account of the binding rite. 3. Report the discovery to Rí Aengus.
> Opening (Gelehrte): "Few read these stones anymore. Fewer still wish to understand what they say."
> Closing (Gelehrte): "Fintan, his name was carved. He sought to become the land's guardian eternal — and the rite unmade him instead. Take this to your Rí. He will grieve it, I think."

> **HEQ-15 — The Seer's Vision** (Lv 27, Solo, Seherin)
> Description: The wandering seer has since witnessed a corrupted region matching the archive's darkest carvings.
> Objectives: 1. Find the seer in her new resting place. 2. Hear her account of the corrupted region. 3. Report back to Rí Aengus.
> Opening (Seer): "You again. Good — the visions have grown too clear to bear alone. What I saw in the misty moor was no ordinary omen."
> Closing (Seer): "Take my account, for what it's worth. I will not walk that moor again unaccompanied — not while it looks back."

> **HEQ-16 — Niav's Vigil** (Lv 28, **Instanz #2**, Boss: Tadhg the Withered)
> Description: A large Withered Circle force besieges Niav's shrine — Hibernia's defenders must break the assault before it falls silent for good.
> Objectives: 1. Reach Niav's shrine with your group. 2. Break the assault. 3. Defeat Tadhg the Withered.
> Opening (Niav): "They come for the stones themselves, not for me. I will not let them have either."
> Closing (Niav): "You came, and the shrine still sings. Whoever led that assault, he will trouble these stones no longer. I am grateful beyond words."

> **HEQ-17 — Umkämpftes Hochland** (Lv 30, **Gruppe/RvR, BG-Debüt #2**, Ceann Cogaidh Aoife)
> Description: The Withered Circle's escalation drags the RvR war into the contested highlands — Hibernia answers in force.
> Objectives: 1. Muster with Hibernia's forces. 2. Join the Umkämpftes Hochland Battleground. 3. Push back the opposing realms.
> Opening (Aoife): "The highlands burn with more than our fire now. Go make yourself useful where it counts most."
> Closing (Aoife): "Hard-won ground, ours for now. Whatever stirs this wider war, it is working exactly as intended — and that unsettles me more than the fighting itself."

> **HEQ-18 — The Drowned Dolmen** (Lv 33, Solo, Rí Aengus)
> Description: A dolmen near the border has gone completely dark — the same wrongness now confirmed everywhere else.
> Objectives: 1. Travel to the border dolmen. 2. Examine the extinguished stone. 3. Report the finding to Rí Aengus.
> Closing (Aengus): "Dark, not broken, not destroyed — as if something drank the light from within it. I fear this was never only Hibernia's wound to bear."

**Umsetzungs-Checkliste (Akt 3, alle 3 Reiche):** siehe generische Liste oben, alle 5 Punkte 🔴.

## Akt 4 (Level 36–46): Der Feind bekommt ein Gesicht — alle drei Reiche

### Albion (AEQ-19 bis AEQ-23)

> **AEQ-19 — Kay's Warpath** (Lv 36, Solo, Burgvogt Kay)
> Description: Kay wants to strike the Broken Oath directly rather than wait — a growing rift with Ector's caution.
> Objectives: 1. Speak with Burgvogt Kay. 2. Hear his case for immediate action. 3. Decide whether to back his plan or urge patience.
> Opening (Kay): "Ector wants more proof, more study, more waiting. I want them dead before they finish whatever they're building."
> Closing (Kay): "You've heard me out. Whatever you decide, decide it fast. I won't wait on Ector's patience forever."

> **AEQ-20 — The Sentinel's Ground** (Lv 38, Solo, Burgvogt Kay)
> Description: Scouting the entrance to the Broken Oath's hidden stronghold reveals a guardian construct far beyond anything faced so far.
> Objectives: 1. Scout the entrance to the underground cult site. 2. Observe the guardian without engaging. 3. Report back to Burgvogt Kay.
> Closing (Kay): "A construct, you say — no breath, no heartbeat, just purpose. We'll need everyone we can muster to get past that."

> **AEQ-21 — Into the Hollow** (Lv 39, **Instanz #3**, Boss: The Hollow Sentinel)
> Description: The full assault on the stronghold entrance — defeating the guardian construct opens the way to Alaric himself.
> Objectives: 1. Enter the stronghold with your group. 2. Advance through the outer halls. 3. Defeat The Hollow Sentinel.
> Opening (Kay): "Whatever that thing is, it doesn't tire and it doesn't fear. Hit it until it stops. That's the whole plan."
> Closing (Fundtext): the Sentinel's shattered core reveals a fragment humming with old, cold magic.

> **AEQ-22 — The Leader's Name** (Lv 42, Solo, Lord Ector)
> Description: Beyond the fallen guardian lies proof of who truly commands the Broken Oath — a name out of Albion's own history.
> Objectives: 1. Search the inner sanctum. 2. Recover records naming the Broken Oath's leader. 3. Report the name to Lord Ector.
> Closing (Ector): "Alaric... the knight who sealed the relic himself, centuries past. If this is truly him, then we face something far older than any traitor."

> **AEQ-23 — The Price of an Oath** (Lv 45, Solo, Lord Ector)
> Description: Deeper records reveal Alaric's tragedy — bound undying by his own seal, driven to madness by centuries of solitary vigil.
> Objectives: 1. Study the recovered records further. 2. Piece together Alaric's full history. 3. Share the account with Lord Ector.
> Closing (Ector): "He wanted to die, and could not. I do not know whether to hate him or to pity him. Perhaps, in the end, both are required."

### Midgard (MEQ-19 bis MEQ-23)

> **MEQ-19 — Vidar's Reckoning** (Lv 36, Solo, Hersir Vidar)
> Description: Vidar recognizes Ragnar's handiwork — they were once shield-brothers. This is personal now.
> Objectives: 1. Speak with Hersir Vidar. 2. Hear his account of their shared past. 3. Decide how to support him.
> Opening (Vidar): "Ragnar. I should have known his hand in this the moment I saw the rune. We fought side by side once, before he broke and I didn't."
> Closing (Vidar): "You've heard it now. Whatever happens when we find him, know that this is mine to finish — but I won't turn away help."

> **MEQ-20 — The Iron Wolf's Den** (Lv 38, Solo, Hersir Vidar)
> Description: Scouting Ragnar's hidden hall reveals a corrupted guardian beast far beyond any warband raider.
> Objectives: 1. Scout the entrance to the hidden hall. 2. Observe the guardian without engaging. 3. Report back to Hersir Vidar.
> Closing (Vidar): "That's no ordinary wolf. Something's twisted it past anything natural. We'll need everyone we can muster."

> **MEQ-21 — Into the Ironbrood's Hold** (Lv 39, **Instanz #3**, Boss: The Iron Wolf)
> Description: The full assault on Ragnar's hall — defeating the corrupted guardian opens the way to him.
> Objectives: 1. Enter the hall with your group. 2. Advance through the outer chambers. 3. Defeat The Iron Wolf.
> Opening (Vidar): "It won't fall easy. Nothing guarding Ragnar ever does."
> Closing (Fundtext): a fang, cracked but still warm, torn from the beast.

> **MEQ-22 — The Wolf Unbound** (Lv 42, Solo, Hersir Vidar)
> Description: Beyond the fallen guardian lies the full truth of Ragnar's fall — betrayal meant as rescue, repaid with exile.
> Objectives: 1. Search the inner hall. 2. Recover records of Ragnar's history. 3. Report the truth to Hersir Vidar.
> Closing (Vidar): "I knew he broke his oath. I never knew why. Saving his men should have been honored, not punished. I don't know what that makes any of us, if this is true."

> **MEQ-23 — What Honor Costs** (Lv 45, Solo, Hersir Vidar)
> Description: Vidar wrestles with whether Ragnar's exile was ever just — the fight ahead no longer feels simple.
> Objectives: 1. Speak with Hersir Vidar. 2. Hear his doubts. 3. Stand with him regardless.
> Opening (Vidar): "If Ragnar was wronged, does that make what he's doing now any less dangerous? I don't have an answer. I only have a blade."
> Closing (Vidar): "Whatever the old halls decided, wrongly or rightly, doesn't change what he threatens now. We finish this. Together."

### Hibernia (HEQ-19 bis HEQ-23)

> **HEQ-19 — Aoife's Resolve** (Lv 36, Solo, Ceann Cogaidh Aoife)
> Description: Aoife wants to strike the Withered Circle directly — growing tension with Aengus' more cautious path.
> Objectives: 1. Speak with Ceann Cogaidh Aoife. 2. Hear her case for direct action. 3. Decide whether to back her plan or urge patience.
> Opening (Aoife): "Aengus wants to understand them. I want them stopped before they unmake another grove. Understanding can come after."
> Closing (Aoife): "You've heard me. Whatever you decide, decide quickly. The wood doesn't wait on councils."

> **HEQ-20 — The Bramble Threshold** (Lv 38, Solo, Ceann Cogaidh Aoife)
> Description: Scouting the entrance to Fintan's hollow reveals a guardian grown from corrupted wood and thorn.
> Objectives: 1. Scout the entrance to the verwucherte Höhle. 2. Observe the guardian without engaging. 3. Report back to Ceann Cogaidh Aoife.
> Closing (Aoife): "That thing was never an animal, and I don't think it was ever fully plant either. We'll need everyone we can muster to pass it."

> **HEQ-21 — Into the Rootbound Hollow** (Lv 39, **Instanz #3**, Boss: The Bramble Warden)
> Description: The full assault on the hollow's entrance — defeating the guardian opens the way to Fintan himself.
> Objectives: 1. Enter the hollow with your group. 2. Advance through the outer roots. 3. Defeat The Bramble Warden.
> Opening (Aoife): "It doesn't tire, and it doesn't bleed like anything living should. Cut through it anyway."
> Closing (Fundtext): a fragment of heartwood still pulses faintly, warm as living flesh.

> **HEQ-22 — The Warden Who Grew Wild** (Lv 42, Solo, Rí Aengus)
> Description: Beyond the fallen guardian lies the truth of Fintan — a guardian who went too far trying to protect what he loved.
> Objectives: 1. Search the inner hollow. 2. Recover records of Fintan's history. 3. Report the truth to Rí Aengus.
> Closing (Aengus): "He wished only to protect the land forever, and the land answered by unmaking him instead. I grieve for what he was, even as I fear what he has become."

> **HEQ-23 — The Wild and the Bound** (Lv 45, Solo, Rí Aengus)
> Description: Aengus wrestles with whether Fintan's warning against too much binding holds some truth.
> Objectives: 1. Speak with Rí Aengus. 2. Hear his doubts. 3. Reaffirm your resolve together.
> Opening (Aengus): "Perhaps he is not entirely wrong, that too much binding wounds the land as surely as too little. And perhaps that makes what he threatens no less dangerous."
> Closing (Aengus): "Balance, not extremity — that is what Hibernia has always sought. We do not seek to destroy what Fintan protects. We seek only to stop him from destroying it himself."

**Umsetzungs-Checkliste (Akt 4, alle 3 Reiche):** siehe generische Liste oben, alle 5 Punkte 🔴.

## Akt 5 (Level 47–50): Die Bastion der Kill-Zone — Finale aller drei Reiche

### Albion (AEQ-24 bis AEQ-26)

> **AEQ-24 — Muster for the Bastion** (Lv 47, Solo, Lord Ector, Burgvogt Kay)
> Description: Ector and Kay unite Albion's forces for the final march on the Broken Oath's stronghold.
> Objectives: 1. Speak with Lord Ector and Burgvogt Kay together. 2. Help muster Albion's forces. 3. Prepare for the march to the Bastion.
> Opening (Ector): "Whatever doubts divided us, they end here. Albion marches as one, or not at all."
> Opening (Kay): "About time. Let's finish what Osric started and Alaric intends to end."
> Closing (Ector): "The muster is complete. Rest tonight, if you can. Tomorrow, we march on the Bastion itself."

> **AEQ-25 — The Last Vigil** (Lv 49, Solo, Lord Ector, Burgvogt Kay)
> Description: A quiet night before the assault — Ector and Kay each offer the player a personal token.
> Objectives: 1. Speak with Lord Ector at the vigil fire. 2. Speak with Burgvogt Kay. 3. Rest before the dawn march.
> Opening (Ector): "Take this — my father's, and his before him. I would rather it protect someone still willing to fight than gather dust in a vault."
> Opening (Kay): "Don't get killed tomorrow. That's not sentiment, that's an order. But... good luck, all the same."
> Closing (Erzähltext): The camp falls quiet before the dawn march. Whatever comes at the Bastion, Albion faces it together.

> **AEQ-26 — The Hollow Warden** (Lv 50, **FINALE — Instanz #4, Gruppe, Endgegner**, Boss: Sir Alaric)
> Description: The full assault on the Bastion of the Kill-Zone — the final confrontation with Sir Alaric, the Hollow Warden.
> Objectives: 1. Storm the Bastion with your group. 2. Fight through the Broken Oath's last defenders. 3. Defeat Sir Alaric.
> Opening (Alaric): "Centuries I have stood watch over a seal that will not let me rest. You come to defend it further? Then you come to prolong my suffering — and the land's."
> Closing (Alaric, defeated): "...Perhaps this is the peace I sought, after all. Guard it better than I did, if you can. Guard it kinder."
> Closing (Lord Ector, after): "The seal holds, and holds true. Whatever Alaric was, he is answered now — not with hatred, but with an ending he could not grant himself. Albion owes you a debt it cannot fully repay."

### Midgard (MEQ-24 bis MEQ-26)

> **MEQ-24 — The Long Hunt** (Lv 47, Solo, Jarl Skadi, Hersir Vidar)
> Description: Skadi and Vidar unite Midgard's warriors for the final march against The Ironbrood.
> Objectives: 1. Speak with Jarl Skadi and Hersir Vidar together. 2. Help muster Midgard's warriors. 3. Prepare for the march to the Bastion.
> Opening (Skadi): "Whatever this began as, it ends as Midgard's fight, together. No more lone hunts."
> Opening (Vidar): "This one's mine to finish. But I'll not pretend I can finish it alone."
> Closing (Skadi): "The hall stands ready. Rest while you can — the Bastion will not wait for us to be rested."

> **MEQ-25 — The Last Toast** (Lv 49, Solo, Jarl Skadi, Hersir Vidar)
> Description: A quiet feast before the assault — Skadi and Vidar each offer the player a personal token.
> Objectives: 1. Join Jarl Skadi at the hall-feast. 2. Speak with Hersir Vidar. 3. Rest before the dawn march.
> Opening (Skadi): "Drink. Whatever tomorrow brings, tonight we are still whole, still ourselves."
> Opening (Vidar): "Take this. Better in your hands than left to rust in mine, if tomorrow goes poorly."
> Closing (Erzähltext): The hall grows quiet as the fires burn low. Tomorrow, Midgard marches as one.

> **MEQ-26 — Ragnar Half-Sworn** (Lv 50, **FINALE — Instanz #4, Gruppe, Endgegner**, Boss: Ragnar Half-Sworn)
> Description: The full assault on the Bastion — the final confrontation between Vidar and his once shield-brother Ragnar.
> Objectives: 1. Storm the Bastion with your group. 2. Fight through the Ironbrood's last defenders. 3. Defeat Ragnar Half-Sworn.
> Opening (Ragnar): "Vidar. Come to finish what the elders started, have you? Or come to ask why, at last?"
> Closing (Vidar, to Ragnar): "I should have asked years ago. I'm asking now — was it worth everything it cost you?"
> Closing (Ragnar, falling): "...Ask me again, brother, when you've carried the weight I have. Until then — hold your oath better than I held mine."
> Closing (Jarl Skadi, after): "Half-sworn or not, he was Midgard once. We honor what he was, and answer what he became. That is enough."

### Hibernia (HEQ-24 bis HEQ-26)

> **HEQ-24 — The Gathering Wood** (Lv 47, Solo, Rí Aengus, Ceann Cogaidh Aoife)
> Description: Aengus and Aoife unite Hibernia's warriors for the final march against The Withered Circle.
> Objectives: 1. Speak with Rí Aengus and Ceann Cogaidh Aoife together. 2. Help muster Hibernia's warriors. 3. Prepare for the march to the Bastion.
> Opening (Aengus): "Whatever divided our counsel, it ends here. Hibernia moves as one, in defense of what we hold dear."
> Opening (Aoife): "Finally. Let's finish what the wood itself has been warning us of."
> Closing (Aengus): "The gathering is complete. Rest, if the night allows it. Tomorrow, we march to the Bastion together."

> **HEQ-25 — The Last Rite** (Lv 49, Solo, Rí Aengus, Ceann Cogaidh Aoife)
> Description: A quiet blessing rite before the assault — Aengus and Aoife each offer the player a personal token.
> Objectives: 1. Join Rí Aengus at the blessing rite. 2. Speak with Ceann Cogaidh Aoife. 3. Rest before the dawn march.
> Opening (Aengus): "Take this — a token blessed by the land itself, or what remains willing to bless anything, these days."
> Opening (Aoife): "Stay sharp tomorrow. And... stay alive. I'd rather not train another recruit this season."
> Closing (Erzähltext): The rite fire burns low as night deepens. Tomorrow, Hibernia marches as one toward the Bastion.

> **HEQ-26 — Fintan the Rootbound** (Lv 50, **FINALE — Instanz #4, Gruppe, Endgegner**, Boss: Fintan the Rootbound)
> Description: The full assault on the Bastion — the final confrontation with Fintan, the guardian who grew wild.
> Objectives: 1. Storm the Bastion with your group. 2. Fight through the Withered Circle's last defenders. 3. Defeat Fintan the Rootbound.
> Opening (Fintan): "You come to preserve a wound, calling it a seal. I come to let the land breathe free at last, whatever the cost."
> Closing (Fintan, defeated): "...Perhaps free was never the word. Perhaps only... quiet, at last. Tend the land better than I did, in the end."
> Closing (Rí Aengus, after): "The seal holds, and the land breathes easier for it. Fintan sought to protect what he loved and lost himself in the seeking. May his rest be gentler than his vigil was. Hibernia will not forget what you have done here."

**Umsetzungs-Checkliste (Akt 5, alle 3 Reiche):** siehe generische Liste oben, alle 5 Punkte 🔴.

---

## Status

🟢 **Alle 103 Einträge inhaltlich fertig** (2026-07-22) — alle drei Epic-Questlines (AEQ/MEQ/HEQ-01 bis -26, inkl. aller drei Finale-Bosskämpfe), alle 18 Nebenquests (ASQ/MSQ/HSQ) und alle 7 Frontier-Punkt-NPCs (FNQ-01–07) haben jetzt Titel/Beschreibung/Ziele/Dialog. Von Claude direkt generiert statt über Copilot, auf Bitte des Nutzers ("mach alles fertig"). Inhaltlich als erster Entwurf zu verstehen (Ton/Balance ggf. später anpassen), nicht als finaler Text. Kein Eintrag hat Engine-Fortschritt — das Quest-Grundsystem selbst existiert noch nicht (siehe SYSTEMS.md Abschnitt 3, Task #14) und ist damit die eigentliche nächste Hürde, nicht der Content mehr.
