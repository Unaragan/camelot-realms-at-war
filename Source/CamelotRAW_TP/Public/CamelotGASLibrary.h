#pragma once

#include "CoreMinimal.h"
#include "Kismet/BlueprintFunctionLibrary.h"
#include "CamelotGASLibrary.generated.h"

class UAbilitySystemComponent;
class UAttributeSet;

// Vanilla GAS does not expose InitAbilityActorInfo or attribute-set attachment to
// Blueprint. These wrappers are the sole reason this project has a C++ module at all
// (see CLAUDE.md "Nicht verhandelbare Regeln" - Blueprint-first exception clause).
UCLASS()
class CAMELOTRAW_TP_API UCamelotGASLibrary : public UBlueprintFunctionLibrary
{
	GENERATED_BODY()

public:
	UFUNCTION(BlueprintCallable, Category = "Camelot|GAS")
	static void InitAbilitySystem(UAbilitySystemComponent* AbilitySystemComponent, AActor* OwnerActor, AActor* AvatarActor);

	UFUNCTION(BlueprintCallable, Category = "Camelot|GAS")
	static UAttributeSet* AddAttributeSet(UAbilitySystemComponent* AbilitySystemComponent, AActor* Owner, TSubclassOf<UAttributeSet> AttributeSetClass);
};
