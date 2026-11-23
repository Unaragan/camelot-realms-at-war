# Archive: Refurbished content

Outsourced from SYSTEMS.md/SETUP.md in the course of the architecture change (2026-07-26/27, see README.md "Architecture change" and CLAUDE.md). Contains Lyra-specific implementation details and C++/Lyra build stumbling blocks that are no longer directly applicable with the change to the third person template + manually retrofitted GAS, but could remain useful as a reference (e.g. if parts of the GAS pattern are reused 1:1, or if a C++ module is added again).

**No longer updating** – new findings belong in SYSTEMS.md/SETUP.md, not here.

---

## From SYSTEMS.md

### 2d. known limitation: pure blueprint project (no C++ module) — historical, before Lyra switch

Applied to the first, discarded prototype (before Lyra): the project ran as a pure blueprint project without its own C++ module. `InitAbilityActorInfo` was unavailable (not BlueprintCallable without C++ module). `GetOuterObject → CastToActor` instead of `GetAvatarActorFromActorInfo`.

During the Lyra phase (Lyra herself was a C++ project) overtaken with the switch to the third person template (blueprint variant, no `Source/`-folder) the project is again a pure blueprint project – so this restriction could become relevant again, if `InitAbilityActorInfo` Or something like that is needed.

**First concrete use of the C++ exception rule during the Lyra phase (2026-07-21):** `RealmTeamStatics` – A slim blueprint function library wrapper `ULyraTeamSubsystem::ChangeTeamForActor`Lyra-specific, omitted with the change.

### Death & Respawn-Handling — Lyra-specific implementation

**Original principle (remains valid, see SYSTEMS.md):** no new own code where avoidable, existing engine/framework building blocks reuse.

**Lyra-specific building blocks that have been used (no longer available after switching):**
- `LyraHealthSet` with `OnOutOfHealth`-Delegates
- `ULyraHealthComponent` - orchestrated the complete death sequence ()`StartDeath()`/`FinishDeath()`, State tags `Lyra.Death.Dying`/`Lyra.Death.Dead`)
- `GA_Hero_Death` – Pre-built GameplayAbility for Ragdoll/Deactivation
- `ULyraPlayerSpawningManagerComponent` – Respawn timing/spawn point selection

**Result (2026-07-21, implemented with BP_TestKnight and verified by PIE):**
- HealthComponent was about `LyraCharacterWithAbilities → LyraCharacter` already existing, but never initialized ()`ALyraCharacterWithAbilities` sets the ASC directly instead of over the `PawnExtensionComponent`, whereby `HealthComponent->InitializeWithAbilitySystem()` never ran. fixed by explicit appeal in `EventBeginPlay`.
- Respawn system: `OriginalTransform` in `BeginPlay` cached, `RespawnDelaySeconds` instance-editable (default 5 s), `OnDeathStarted` Stop auto-attack timer and plan respawn on the surviving opponent.fresh instance spawns at the original position after the timer expires.
- Target finding during respawn had to be retracted manually ()`SetOpponentActor` set on both sides), because a short overlap window (corpse not yet destroyed) led to the wrong target detection.
- Found bug: `RespawnDelaySeconds=0` for both instances placed, because the class default was set only after they were already placed (UE freezes adopted values per instance).

**PIE test result:** Observed complete duel to death, Respawn after 5s with full health and freshly granted skills worked reliably.

**Known limitation:** In the case of near-simultaneous two-way deaths, each side depends on the survival of the others to plan the respawn — not architecturally secured, but uncritical for the 2-player test setup at that time.

### Reference implementation v2: Knight prototype on Lyra basis (2026-07-21)

Underneath `/Game/Characters/TestKnights/` (no longer present in the project):
- **`BP_TestKnight`** – GAS test character base with `LyraAbilitySystemComponent`, `LyraHealthSet`, `LyraCombatSet`BeginPlay (server-side): Health/MaxHealth on 250, grants both attack capabilities, automatically finds the other placed knight as the target.
- **`GA_TestKnight_MeleeBase`** – Basic Ability (subclass of `LyraGameplayAbility`ServerOnly with `ApplyMeleeAttack` (damage + angle check) and `ApplyMeleeHeal` (Healing).
- **`GA_Attack1`/`GA_Attack2`** Attack1 = 25 damage, Attack2 = 15 damage + 15 self-healing.
- Used Lyra’s existing modular SetByCaller GameplayEffects`GE_Damage_Basic_SetByCaller`/`GE_Heal_SetByCaller`, based on `LyraDamageExecution`/`LyraHealExecution`).
- Back check: `Transformation|GetHorizontalDotProductTo`, at ≤ -0.5 (120° back cone) only the damage portion doubles.

**PIE test results** (Level) `/ShooterTests/Maps/L_ShooterTest_Basic`): Frontal exactly 25/15 damage, doubled in the back cone (50/30), healing unchanged at 15.

### Reference implementation v3: Paladin as a real, playable Lyra Experience (2026-07-22 to 2026-07-24)

To be renamed `BP_Paladin`, full integration into the Lyra Experience system. `/Game/Characters/Paladin/`, Level `/Game/Maps/L_PaladinTest`, Experience `B_Experience_PaladinTest` (Everything is no longer present in the project).

- **Own Experience/PawnData chain:** `PawnData_Paladin`, `AbilitySet_Paladin`, `InputData_Paladin`Two content validation errors found: `AbilitySet_Paladin` Referenced illegally `/ShooterCore/Game/Respawn/GA_SpawnEffect`, `InputData_Paladin` illegal `/ShooterCore/Input/Actions/IA_Melee` Lyra does not allow project-owned content to cross-reference to GameFeature plugin content. `GA_Paladin_SpawnEffect`/`IA_Paladin_Strike` plus their own `IMC_Paladin`.
- **ShooterCore plugin family completely deactivated** (`ShooterCore`, `ShooterMaps`, `TopDownArena`, `ShooterExplorer`, `ShooterTests`) – the old test level `L_ShooterTest_Basic` belonged to `ShooterTests` He brought a strange default experience with him.
- **Important find – double initialization of GAS between Duel Dummy and Player Pawn:** `BP_Paladin`s `BeginPlay` had its own manual init logic for the Duel Dummies, collided with Lyra's automatic initialization of the actual possessed player pawn over `AbilitySet_Paladin` + `HeroComponent` (Fehler: "Health component ... has already been initialized with an ability system").
  - Obvious but faulty first attempt: manual logic with `IsPlayerControlled()` gaten — did not work reliably since Possession at `BeginPlay` has not yet been completed.
  - Functioning fix: `DelayUntilNextTick` before the `IsPlayerControlled()`-Check.
- **Mesh/Animation:** Lyras standard mannequin mesh plus `ABP_Mannequin_Base` assigned. **Did not work in the end** (see addendum below and Issue #14) – ultimately one of the main triggers for the change of architecture.

#### Addendum (2026-07-26): Frozen animation — diagnosis at `ABP_Mannequin_Base`

Live diagnosed by MCP (symptom: all paladin instances in the standalone PIE window in identical, frozen reference pose). [GitHub Issue #14](https://github.com/Unaragan/camelot-realms-at-war/issues/14) (now closed, overtaken by architectural change).

- **Diagnosed cause:** `ABP_Mannequin_Base`s Locomotion-States deliver their pose via `LinkedAnimLayer`-Nodes (interface) `ALI_ItemAnimLayers`), intended for a weapon-equip system (ShooterCore, deactivated), which at runtime per `LinkAnimClassLayers()` Without this system, `instanceClass` on all nodes `None`, fallback to a completely empty self-implementation. `BS_MM_Rifle_Jog_Leans`Blend-Space in `Start`/`Cycle`/`Pivot`.
- **Tested fix:** `instanceClass` of all 10 `LinkedAnimLayer`-Nodes on `ABP_UnarmedAnimLayers` Set up, Blend-Space `BS_MM_Unarmed_Jog_Walk` First reported as "verified" (motion-blur screenshot), but stopped **not** Several direct user tests continued to show completely frozen or purely sliding motion without animation.
- **Final assessment:** Lyra’s Experience/PawnData/LinkedAnimLayer system is structurally difficult to reliably verify via MCP property/log checks (distributed runtime wiring instead of directly inspectable states) – this was the decisive reason for the architecture change to the third person template.
- **Close combat animation for `GA_Paladin_Strike`:** `AN_Melee` was only one `AnimNotify`-marker, not animation. `AM_MM_Rifle_Melee` (gun-piston swing) `PlayMontageAndWait` Built-in — coarse placeholder, obsolete with the changeover.

### First reference implementation (knight prototype, discarded — before Lyra switch)

Successfully implemented and verified by PIE (status 2026-07-19), under `/Game/Knights/` (no longer present in the project):
- `BP_KnightAttributeSet` – Health/MaxHealth 250
- `GE_MeleeDamageHeal` Reusable GameplayEffect with two set-by-caller magnitudes (“Damage”, “Healing”)
- `BP_KnightAttackAbilityBase` (ServerOnly) with server-side 120° back angle check via dot product
- `GA_KnightAttack1` (25 Damage), `GA_KnightAttack2` (15 Damage + 15 Self-Healing, Healing Percentage Deliberately DOES NOT Double in Back Attack)
- `BP_Sword` (ChildActorComponent on hand_r-Socket), `BP_Knight` (Character with ASC, Primitive Body, Team Colors)

Confirmed test results: frontal attack 1 = −25 HP, frontal attack 2 = target −15 HP/attacker +15 HP, back attack 1 = −50 HP (doubled), back attack 2 = target −30 HP (doubled) + healing still +15 HP (unchanged).

---

## From SETUP.md

### Lyra C++ build stumbling blocks (not applicable with third-person template, pure blueprint project)

| Error | Cause | Solution |
|---|---|---|
| `error CS0579: Doppeltes Attribut "AssemblyTitleAttribute"/"AssemblyVersionAttribute"` in `Lyra.Automation.AssemblyInfo.cs` The AutomationTool-Build | Stale generated .NET build cache under `Build/Scripts/obj/` (originates mainly after project shifts) | `Build/Scripts/obj/`, `Build/Scripts/bin/` and `Build/Scripts/uatobj/` delete (purely generated caches), then restart build |
| Live Coding: `Could not spawn process ...UnrealBuildAccelerator/x64/UbaCli.exe. Error: 267` for each module, "Failed to link patch (0.000s)" | The live coding hot patch step failed consistently because of this UBA help program (also completely deactivated with AV). | Deactivate Live Coding (Editor Preferences → General → Live Coding), completely close/restart editor after C++ changes |

### Old project name/path

Project was called in Lyra times `Camelot_RAW.uproject`, before a brief second copy under `Documents\Unreal Projects\CamelotRAW` (Cause of "Assets Missing in Git" Confusion). `D:\Claude\camelot-realms-at-war\CamelotRAW_TP.uproject`See SETUP.md.
