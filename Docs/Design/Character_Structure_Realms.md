# Character structure per kingdom (design preparation)

> **Status:** Design skeleton for later expansion. Not implemented, only documentation for folder structure preparation and asset naming per realm so that later classes/characters can be extended consistently.

## Vertical Slice vs. Final Version

**Vertical Slice (now):** Three classes per faction, all as blueprints, provisionally on **Common placeholder meshes/materials** (Mannequin skeleton, toon look). Structure:
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

**Final version (after release, not now):** Every empire gets **rich meshes/materials** Structure remains, but meshes are exchanged (see CLAUDE.md → Gameplay classes reference mesh/material as interchangeable variable).

## Realm Identity: Art Direction per group

From the Frontier Vision ()[OpenWorld_Frontier_3Realms_Vision.md](OpenWorld_Frontier_3Realms_Vision.md)) derived from:

### **Albion** — Chivalry, heavy armor, medieval English

- **Silhouette:** Full plate armor, long swords, shields, often horned helmets
- **Colours:** Red, silver, gold (precious stones, nobility)
- **Material:** Steel, leather, brocade, velvet
- **Movement:** Hard, dignified, measured steps, defensive
- **Weapons style:** Two-handed, shield+sword, rods for magic
- **Class differences:**
  - **Paladin:** Full plate, large plate, ritual
  - **Cleric:** Clothes over armor, religious symbols, staff
  - **Wizard:** Long robe, little armor, focus object (rod/crystal)

### **Midgard** — Nordic, Fellwerk/Fell, Viking Metalwork

- **Silhouette:** Less plate, more leather + fur coat, axe/hammer asymmetric
- **Colours:** Blue, white, brown, grey (ice, snow, iron)
- **Material:** Iron, bronze, leather, fur, bones
- **Movement:** Aggressive, fast, wide-ranging, offensive
- **Weapons style:** Two-handed (Ax), Dual Wield, shields with rune patterns
- **Class differences:**
  - **Berserkers:** Minimalist armor, fur coat, aggressive pose
  - **Shaman:** Leather, fur coat, shamanic totems, ritual
  - **Hunters:** Light armor, bow, mobile, hunting equipment

### **Hibernia** Celtic, nature, mystical

- **Silhouette:** Flowing garments, natural elements ( tendrils, leaves), organic asymmetry
- **Colours:** Green, gold, brown, white (oak, forest, stone)
- **Material:** Leather, linen, wood, stone, crystal
- **Movement:** Flowing, yet firmly rooted, mystical
- **Weapons style:** Dualwield, staffs (for Druids), close combat with nature focus
- **Class differences:**
  - **Champion:** Heavy leather armor, nature symbols, powerful
  - **Druid:** Flowing robe, nature totems, little armor
  - **Ranger:** Light armor, bow, nature camouflage clothing, mobile

## Blueprint Inheritance Architecture (Master + Specializations)

**Core principle:** A master character inherits all the common characteristics (movement, animations, GAS base, replication), and each class per realm inherits from the master and specializes only in skills/differences.

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
├── Palette override for Albion colors
└── (Animations erben vom Master)

BP_Cleric_Albion  → erbt vom Master
BP_Wizard_Albion  → erbt vom Master
```

## Blueprint assets (blueprint assets)

According to the model of **Content structure**:

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

## Blueprint naming convention

Format: `BP_[ClassName]_[RealmName]`

**Examples:**
- `BP_Paladin_Albion`
- `BP_Berserker_Midgard`
- `BP_Champion_Hibernia`

**Ability Blueprints (GAS):** `GA_[ClassName]_[AbilityName]`
- `GA_Paladin_HolyStrike`
- `GA_Berserker_RageAttack`
- `GA_Druid_Heal`

**Attribute sets:** `AS_[ClassName]`
- `AS_Paladin`
- `AS_Berserker`

## Implementation Roadmap

| Phase phase | What | Scope |
|---|---|---|
| Vertical Slice (now) | 3 classes (one per realm), all with placeholder meshes | Paladin, Berserker, Champion on Mannequin |
| by Vertical Slice | +3 classes (one per realm) | Cleric, Shaman, Druid |
| RvR-Core-Proof | +3 classes (final vertical slice suite) | Wizard, Hunter, Ranger |
| Final version (later) | +5 classes (specializations) + rich meshes | Rogue, Minstrel, Raider, Skald, Duelist + Custom meshes per realm |

## Open points

- **Mesh sources for final version:** Epic Paragon assets (free, 76 GB, non-versioned), Marketplace, or Custom-Art? (see CLAUDE.md/README.md)
- **Animation retargeting:** Mannequin skeleton for POC; for independent meshes, other skeletons may be required (applies to later)
- **UI branding per class:** Should class UI widgets (ability icons, buffs) be visually distinguishable, or uniform? (open, probably later after initial playtests)
- **Armor variants:** Should classes have visible Armor parts as swappable meshes, or just material override? (open for final version)
