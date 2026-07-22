# Quests: Content & Umsetzungsstand

Zentrale Sammelstelle für **fertig ausformulierten Quest-Content** und den **Stand der Umsetzung im Spiel** — getrennt von den Design-Konzept-Dokumenten (die Prämissen/Story-Struktur bleiben dort, wo sie entstanden sind) und getrennt von [PROMPTS.md](../../PROMPTS.md) (die nur die wiederverwendbaren Anfrage-Vorlagen enthält, nicht die Ergebnisse).

## Wie diese Datei benutzt wird

- **Story-Konzepte/Prämissen** leben weiter in ihren Quelldokumenten: [Albion_Epic_Questline.md](Albion_Epic_Questline.md) (Stufen AEQ-01 bis AEQ-20), [Frontier_NPCs_and_Questlines.md](Frontier_NPCs_and_Questlines.md) (Punkt-NPCs FNQ-01 bis FNQ-07), [NPC_NAMES.md](../../NPC_NAMES.md) (Reichsführungs-Hooks). Hier **nicht** duplizieren.
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

## Master-Index

### Albion Epic Questline (AEQ, Level 1–50) — siehe [Albion_Epic_Questline.md](Albion_Epic_Questline.md)

| ID | Lv | Titel | Typ | Content | Engine |
|---|---|---|---|---|---|
| AEQ-01 | 1 | The Silent Frontier | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-02 | 2 | Shadows Across the Border | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-03 | 3 | To the Borderlands | Solo | 🟢 fertig (unten) | 🔴 |
| AEQ-04 | 5 | First Blood | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-05 | 8 | A Soldier's Instinct | Solo | ⚪ Prompt bereit (Albion_Epic_Questline.md) | 🔴 |
| AEQ-06 | 10 | Eleanor's Missing Wagons | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-07 | 13 | The Old Ward-Keeper's Journal | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-08 | 16 | Recruits of the Watch | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| AEQ-09 | 20 | Grenzland-Scharmützel (BG-Debüt) | **Gruppe/RvR** | ⚪ nur Prämisse | 🔴 |
| AEQ-10 | 23 | Lord Ector's Suspicion | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-11 | 26 | What the Archives Hide | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-12 | 28 | Baldwin's Last Watch | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| AEQ-13 | 30 | Umkämpftes Hochland (BG-Debüt #2) | **Gruppe/RvR** | ⚪ nur Prämisse | 🔴 |
| AEQ-14 | 33 | The Vanishing Ward-Stone | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-15 | 36 | Kay's Warpath | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-16 | 39 | Into the Hollow | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| AEQ-17 | 42 | The Leader's Name | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-18 | 45 | The Price of an Oath | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-19 | 47 | Muster for the Bastion | Solo | ⚪ nur Prämisse | 🔴 |
| AEQ-20 | 50 | The Hollow Warden (Finale) | **Gruppe, Endgegner** | ⚪ nur Prämisse | 🔴 |

### Midgard Epic Questline (MEQ, Level 1–50) — siehe [Midgard_Epic_Questline.md](Midgard_Epic_Questline.md)

| ID | Lv | Titel | Typ | Content | Engine |
|---|---|---|---|---|---|
| MEQ-01 | 1 | Trial of the First Blade | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-02 | 2 | Prove Your Worth | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-03 | 3 | The Hersir's Summons | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-04 | 5 | Blood on the Ice | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-05 | 8 | Gunnar's Watch | Solo | ⚪ Prompt bereit (Midgard_Epic_Questline.md) | 🔴 |
| MEQ-06 | 10 | Ulf's Vanishing Ore | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-07 | 13 | The Half-Sworn Rune | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-08 | 16 | Wolves Among Wolves | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| MEQ-09 | 20 | Grenzland-Scharmützel (BG-Debüt) | **Gruppe/RvR** | ⚪ nur Prämisse | 🔴 |
| MEQ-10 | 23 | Skadi's Doubt | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-11 | 26 | The Unbound Oath | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-12 | 28 | Gunnar's Last Stand | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| MEQ-13 | 30 | Umkämpftes Hochland (BG-Debüt #2) | **Gruppe/RvR** | ⚪ nur Prämisse | 🔴 |
| MEQ-14 | 33 | The Silent Fjord | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-15 | 36 | Vidar's Reckoning | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-16 | 39 | Into the Ironbrood's Hold | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| MEQ-17 | 42 | The Wolf Unbound | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-18 | 45 | What Honor Costs | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-19 | 47 | The Long Hunt | Solo | ⚪ nur Prämisse | 🔴 |
| MEQ-20 | 50 | Ragnar Half-Sworn (Finale) | **Gruppe, Endgegner** | ⚪ nur Prämisse | 🔴 |

### Hibernia Epic Questline (HEQ, Level 1–50) — siehe [Hibernia_Epic_Questline.md](Hibernia_Epic_Questline.md)

| ID | Lv | Titel | Typ | Content | Engine |
|---|---|---|---|---|---|
| HEQ-01 | 1 | The Fading Grove | Solo | ⚪ Prompt bereit (Hibernia_Epic_Questline.md) | 🔴 |
| HEQ-02 | 2 | Whispers in the Root | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-03 | 3 | Aoife's Trial | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-04 | 5 | First Skirmish | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-05 | 8 | Niav's Silence | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-06 | 10 | Cormac's Stolen Iron | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-07 | 13 | The Old Grove-Keeper's Rite | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-08 | 16 | The Withering Circle | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| HEQ-09 | 20 | Grenzland-Scharmützel (BG-Debüt) | **Gruppe/RvR** | ⚪ nur Prämisse | 🔴 |
| HEQ-10 | 23 | Aengus' Fear | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-11 | 26 | The Rootbound Rite | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-12 | 28 | Niav's Vigil | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| HEQ-13 | 30 | Umkämpftes Hochland (BG-Debüt #2) | **Gruppe/RvR** | ⚪ nur Prämisse | 🔴 |
| HEQ-14 | 33 | The Drowned Dolmen | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-15 | 36 | Aoife's Resolve | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-16 | 39 | Into the Rootbound Hollow | **Gruppe** | ⚪ nur Prämisse | 🔴 |
| HEQ-17 | 42 | The Warden Who Grew Wild | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-18 | 45 | The Wild and the Bound | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-19 | 47 | The Gathering Wood | Solo | ⚪ nur Prämisse | 🔴 |
| HEQ-20 | 50 | Fintan the Rootbound (Finale) | **Gruppe, Endgegner** | ⚪ nur Prämisse | 🔴 |

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
| FNQ-05 | Hibernia | Schreinhüterin Niav, Schrein | ⚪ Prompt bereit (Frontier_NPCs_and_Questlines.md) | 🔴 |
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

---

## Status

🟡 Erweitert (2026-07-22) — bündelt den bereits generierten Ector/Kay-Content (vorher in PROMPTS.md) und trackt jetzt alle bekannten Quest-IDs: Albion-Epic (AEQ), Midgard-Epic (MEQ, neu), Hibernia-Epic (HEQ, neu), Nebenquests aller drei Reiche (ASQ/MSQ/HSQ, neu) und Frontier-Punkt-NPCs (FNQ). 79 Einträge insgesamt, davon 3 (AEQ-01–03) mit fertigem Content. Kein Eintrag hat bisher Engine-Fortschritt — das Quest-Grundsystem selbst existiert noch nicht (siehe SYSTEMS.md Abschnitt 3, Task #14).
