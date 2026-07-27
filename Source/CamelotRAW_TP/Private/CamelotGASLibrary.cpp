#include "CamelotGASLibrary.h"
#include "AbilitySystemComponent.h"

void UCamelotGASLibrary::InitAbilitySystem(UAbilitySystemComponent* AbilitySystemComponent, AActor* OwnerActor, AActor* AvatarActor)
{
	if (AbilitySystemComponent)
	{
		AbilitySystemComponent->InitAbilityActorInfo(OwnerActor, AvatarActor);
	}
}

UAttributeSet* UCamelotGASLibrary::AddAttributeSet(UAbilitySystemComponent* AbilitySystemComponent, AActor* Owner, TSubclassOf<UAttributeSet> AttributeSetClass)
{
	if (!AbilitySystemComponent || !Owner || !AttributeSetClass)
	{
		return nullptr;
	}
	// GetOrCreateAttributeSubobject is protected (only meant for the ASC's own owner class to call
	// internally). AddSpawnedAttribute is the public API for registering a runtime-created AttributeSet
	// instance, which is what a Blueprint-callable wrapper needs.
	UAttributeSet* NewAttributeSet = NewObject<UAttributeSet>(Owner, AttributeSetClass);
	AbilitySystemComponent->AddSpawnedAttribute(NewAttributeSet);
	return NewAttributeSet;
}
