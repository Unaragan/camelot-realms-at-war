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

🟡 Neu angelegt (2026-07-22) — bündelt den bereits generierten Ector/Kay-Content (vorher in PROMPTS.md) und legt den Umsetzungs-Tracker für alle bekannten Quest-IDs (AEQ, FNQ) an. Content für AEQ-04 bis AEQ-20 und FNQ-01 bis FNQ-07 steht noch aus. Kein Eintrag hat bisher Engine-Fortschritt — das Quest-Grundsystem selbst existiert noch nicht (siehe SYSTEMS.md Abschnitt 3).
