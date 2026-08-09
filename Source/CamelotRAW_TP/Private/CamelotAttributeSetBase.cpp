#include "CamelotAttributeSetBase.h"
#include "GameplayEffectExtension.h"
#include "AbilitySystemComponent.h"

void UCamelotAttributeSetBase::PostGameplayEffectExecute(const FGameplayEffectModCallbackData& Data)
{
	Super::PostGameplayEffectExecute(Data);

	if (Data.EvaluatedData.Attribute.GetName() != TEXT("Health"))
	{
		return;
	}

	if (Data.Target.GetNumericAttribute(Data.EvaluatedData.Attribute) <= 0.f)
	{
		OnOutOfHealth.Broadcast();
	}
}
