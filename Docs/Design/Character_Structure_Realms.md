# Character-Struktur pro Reich (Design-Vorbereitung)

> **Status:** Design-Skelett für späteren Ausbau. Nicht implementiert, nur Dokumentation für die Vorbereitung der Ordnerstruktur und Asset-Naming pro Reich, damit später die Klassen/Charaktere konsistent erweitert werden können.

## Einordnung: Vertical Slice vs. Endversion

**Vertical Slice (jetzt):** Drei Klassen pro Fraktion, alle als Blueprints, vorläufig auf **gemeinsamen Placeholder-Meshes/Materialien** (Mannequin-Skeleton, Toon-Look). Struktur:
```
Content/Camelot/Characters/
  Shared/              # Gemeinsam genutzt über alle Reiche
    Materials/         # Toon-Materials, Outline-Effekte
    Animations/        # Retargeted auf Mannequin-Skeleton
  Albion/
    BP_Paladin_Albion
    BP_Cleric_Albion
    BP_Wizard_Albion
  Midgard/
    BP_Berserker_Midgard
    BP_Shaman_Midgard
    BP_Hunter_Midgard
  Hibernia/
    BP_Champion_Hibernia
    BP_Druid_Hibernia
    BP_Ranger_Hibernia
```

**Endversion (nach Release, nicht jetzt):** Jedes Reich bekommt **reichseigene Meshes/Materialien** statt Placeholders. Struktur bleibt, aber Meshes werden ausgetauscht (siehe CLAUDE.md → Gameplay-Klassen referenzieren Mesh/Material als austauschbare Variable).

## Reich-Identität: Art Direction pro Fraktion

Aus der Frontier-Vision ([OpenWorld_Frontier_3Realms_Vision.md](OpenWorld_Frontier_3Realms_Vision.md)) abgeleitet:

### **Albion** — Ritterlich, schwere Rüstung, mittelalterlich-englisch

- **Silhouette:** Volle Plattenrüstung, lange Schwerter, Schilde, oft gehörnte Helme
- **Farben:** Rot, Silber, Gold (Edelsteine, Adel)
- **Material:** Stahl, Leder, Brokat, Samt
- **Bewegung:** Schwer, würdevoll, gemessene Schritte, defensiv
- **Waffen-Stil:** Zwei-Händer, Schild+Schwert, Stäbe für Zauber
- **Klassen-Unterschiede:**
  - **Paladin:** Vollplatte, Großschild, rituell
  - **Cleric:** Gewand über Rüstung, religiöse Symbole, Stab
  - **Wizard:** Lange Robe, wenig Rüstung, Fokus-Objekt (Stab/Kristall)

### **Midgard** — Nordisch, Fellwerk/Fell, Wikingermetalwork

- **Silhouette:** Weniger Platte, mehr Leder + Fellmantel, Axt/Hammer, asymmetrisch
- **Farben:** Blau, Weiß, Braun, Grau (Eis, Schnee, Eisen)
- **Material:** Eisen, Bronze, Leder, Fell, Knochen
- **Bewegung:** Aggressiv, schnell, weit ausholend, offensiv
- **Waffen-Stil:** Zwei-Händer (Axt), Dual Wield, Schilde mit Runenmuster
- **Klassen-Unterschiede:**
  - **Berserker:** Minimalistische Rüstung, Fellmantel, aggressive Pose
  - **Shaman:** Leder, Fellmantel, Schamanische Totems, rituell
  - **Hunter:** Leichte Rüstung, Bogen, Beweglich, Jagdausrüstung

### **Hibernia** — Keltisch, Natur, mystisch

- **Silhouette:** Fließende Gewänder, Natur-Elemente (Ranken, Blätter), organische Asymmetrie
- **Farben:** Grün, Gold, Braun, Weiß (Eiche, Wald, Stein)
- **Material:** Leder, Leinen, Holz, Stein, Kristall
- **Bewegung:** Fließend, zugleich fest verwurzelt, mystisch
- **Waffen-Stil:** Dualwield, Stäbe (für Druiden), Nahkampf mit Natur-Fokus
- **Klassen-Unterschiede:**
  - **Champion:** Schwere Lederrüstung, Natur-Symbole, kraftvoll
  - **Druid:** Fließendes Gewand, Natur-Totems, wenig Rüstung
  - **Ranger:** Leichte Rüstung, Bogen, Natur-Tarnkleidung, mobil

## Blueprint-Vererbungs-Architektur (Master + Spezialisierungen)

**Kern-Prinzip:** Ein Master-Character erbt alle gemeinsamen Eigenschaften (Bewegung, Animationen, GAS-Base, Replikation). Jede Klasse pro Reich erbt vom Master und spezialisiert nur die Fähigkeiten/Unterschiede.

```
BP_Character_Master
├── Shared Locomotion (Walk, Run, Idle, Strafe, Jump)
├── Shared Combat Animations (Block, Hit, Death)
├── GAS-Ability-System-Base (ASC, AttributeSets, Abilities)
├── Replication-Setup
├── UI-Framework
└── Mesh/Material-Variablen (austauschbar)

   ↓ erbt
   
BP_Paladin_Albion
├── Klassen-spezifische GAS-Abilities (HolyStrike, etc.)
├── Paladin-Attribute-Set
├── Palette-Override für Albion-Farben
└── (Animations erben vom Master)

BP_Cleric_Albion  → erbt vom Master
BP_Wizard_Albion  → erbt vom Master
```

## Ordner-Struktur (Blueprint-Assets)

Nach dem Muster der **Content-Struktur**:

```
Content/Camelot/Characters/
├── Shared/
│   ├── BP_Character_Master           # ← MASTER-BLUEPRINT
│   │   └── GAS-Setup, Bewegung, Replication
│   ├── Animations/
│   │   ├── Locomotion/              # Walk, Run, Idle, Strafe
│   │   ├── Combat/                  # Attack, Block, Hit, Death
│   │   └── Emotes/                  # Sit, Kneel, Cheer, etc.
│   ├── Materials/
│   │   ├── M_CharacterBase_Toon     # Basis Toon-Shader
│   │   ├── M_CharacterOutline       # Outline-Effekt
│   │   └── M_CharacterUI            # Faction-Farben-Overlay
│   └── VFX/
│       ├── Impacts/                 # Hit-Feedback, Blood
│       └── Abilities/                # Generic Particle-Effekte
│
├── Albion/
│   ├── Meshes/                       # (Placeholder: gemeinsam bis Endversion)
│   ├── BP_Paladin_Albion             # erbt von BP_Character_Master
│   │   ├── Abilities/                # GAS-Ability-Blueprints (klassen-spezifisch)
│   │   └── Attributes/               # AS_Paladin (spezialisiert)
│   ├── BP_Cleric_Albion
│   └── BP_Wizard_Albion
│
├── Midgard/
│   ├── Meshes/
│   ├── BP_Berserker_Midgard          # erbt von BP_Character_Master
│   ├── BP_Shaman_Midgard
│   └── BP_Hunter_Midgard
│
└── Hibernia/
    ├── Meshes/
    ├── BP_Champion_Hibernia          # erbt von BP_Character_Master
    ├── BP_Druid_Hibernia
    └── BP_Ranger_Hibernia
```

## Blueprint-Naming-Konvention

Format: `BP_[ClassName]_[RealmName]`

**Beispiele:**
- `BP_Paladin_Albion`
- `BP_Berserker_Midgard`
- `BP_Champion_Hibernia`

**Ability-Blueprints (GAS):** `GA_[ClassName]_[AbilityName]`
- `GA_Paladin_HolyStrike`
- `GA_Berserker_RageAttack`
- `GA_Druid_Heal`

**Attribute-Sets:** `AS_[ClassName]`
- `AS_Paladin`
- `AS_Berserker`

## Umsetzungs-Roadmap

| Phase | Was | Scope |
|---|---|---|
| Vertical Slice (jetzt) | 3 Klassen (eine pro Realm), alle mit Placeholder-Meshes | Paladin, Berserker, Champion auf Mannequin |
| Nach Vertical Slice | +3 Klassen (je eine pro Realm) | Cleric, Shaman, Druid |
| Nach RvR-Core-Proof | +3 Klassen (finale Vertical Slice Suite) | Wizard, Hunter, Ranger |
| Endversion (später) | +5 Klassen (Spezialisierungen) + reichseigene Meshes | Rogue, Minstrel, Raider, Skald, Duelist + Custom-Meshes pro Realm |

## Offene Punkte

- **Mesh-Quellen für Endversion:** Epic Paragon-Assets (kostenlos, 76 GB, nicht versioniert), Marketplace, oder Custom-Art? (siehe CLAUDE.md/README.md)
- **Animation-Retargeting:** Mannequin-Skeleton für POC; bei eigenständigen Meshes ggf. andere Skeletons nötig (gilt für später)
- **UI-Branding pro Klasse:** Sollten Klassen-UI-Widgets (Ability-Icons, Buffs) visual unterscheidbar sein, oder einheitlich? (offen, wahrscheinlich später nach ersten Playtests)
- **Rüstungs-Varianten:** Sollten Klassen sichtbare Armor-Teile als swappable Meshes haben, oder nur Material-Überschreibung? (offen für Endversion)
