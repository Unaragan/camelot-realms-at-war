// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "Kismet/BlueprintFunctionLibrary.h"

#include "RealmTeamStatics.generated.h"

#define UE_API LYRAGAME_API

class AActor;

/**
 * Thin Blueprint-callable wrapper around ULyraTeamSubsystem::ChangeTeamForActor, which is
 * C++-only in stock Lyra. Needed to assign a team to actors that implement
 * ILyraTeamAgentInterface directly (e.g. ALyraCharacter) but have no associated
 * PlayerState, such as self-contained AI test characters.
 */
UCLASS(MinimalAPI)
class URealmTeamStatics : public UBlueprintFunctionLibrary
{
	GENERATED_BODY()

public:
	// Assigns a team ID to the given actor via Lyra's ULyraTeamSubsystem. Authority only.
	UFUNCTION(BlueprintCallable, Category = "Teams")
	static UE_API bool AssignTeam(AActor* Actor, int32 TeamId);
};

#undef UE_API
