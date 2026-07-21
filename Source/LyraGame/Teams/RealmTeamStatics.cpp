// Copyright Epic Games, Inc. All Rights Reserved.

#include "RealmTeamStatics.h"

#include "Engine/World.h"
#include "GameFramework/Actor.h"
#include "Teams/LyraTeamSubsystem.h"

#include UE_INLINE_GENERATED_CPP_BY_NAME(RealmTeamStatics)

bool URealmTeamStatics::AssignTeam(AActor* Actor, int32 TeamId)
{
	if (!Actor)
	{
		return false;
	}

	if (ULyraTeamSubsystem* TeamSubsystem = Actor->GetWorld()->GetSubsystem<ULyraTeamSubsystem>())
	{
		return TeamSubsystem->ChangeTeamForActor(Actor, TeamId);
	}

	return false;
}
