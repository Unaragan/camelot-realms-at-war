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
| MEQ-07 | 11 | Ulf's Vanishing Ore | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-08 | 13 | The Half-Sworn Rune | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-09 | 15 | Erik's Trail | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-10 | 16 | Wolves Among Wolves — **Instanz #1** (Boss: Erik, First of the Ironbrood) | **Gruppe** | 🟢 fertig (unten) | 🔴 |
| MEQ-11 | 18 | What the Wolves Left Behind | Solo | 🟢 fertig (unten) | 🔴 |
| MEQ-12 | 20 | Grenzland-Scharmützel (BG-Debüt) | **Gruppe/RvR** | 🟢 fertig (unten) | 🔴 |
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
| HEQ-07 | 11 | Cormac's Stolen Iron | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-08 | 13 | The Old Grove-Keeper's Rite | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-09 | 15 | Eamon's Trail | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-10 | 16 | The Withering Circle — **Instanz #1** (Boss: Eamon the Withered) | **Gruppe** | 🟢 fertig (unten) | 🔴 |
| HEQ-11 | 18 | What the Roots Remember | Solo | 🟢 fertig (unten) | 🔴 |
| HEQ-12 | 20 | Grenzland-Scharmützel (BG-Debüt) | **Gruppe/RvR** | 🟢 fertig (unten) | 🔴 |
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

---

## Status

🟡 Erweitert (2026-07-22) — alle drei Epic-Questlines auf 26 Stufen ausgebaut (vorher je 20), mit vier benannten Instanz-Bossen + Loot-Konzept pro Reich (siehe "Instanzen-Übersicht"). 103 Einträge insgesamt, davon **55 mit fertigem Content**: kompletter Akt 1 + Akt 2 aller drei Reiche (AEQ-01–12, MEQ-01–12, HEQ-01–12), alle 18 Nebenquests (ASQ/MSQ/HSQ), plus FNQ-05 — von Claude direkt generiert statt über Copilot, auf Bitte des Nutzers ("mach alles fertig"). Wird fortgesetzt (Akt 3–5 + restliche FNQ). Kein Eintrag hat bisher Engine-Fortschritt — das Quest-Grundsystem selbst existiert noch nicht (siehe SYSTEMS.md Abschnitt 3, Task #14).
