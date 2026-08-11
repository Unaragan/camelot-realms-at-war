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

	// MaxHealth is a Blueprint-defined variable on the subclass, not a C++ property, so it's
	// looked up by name here rather than through a typed getter. MaxHealth reading 0 means it
	// hasn't been initialized yet (e.g. the same GameplayEffect is still applying its Health
	// modifier before its MaxHealth modifier) - skip clamping in that case rather than zeroing
	// Health out against a not-yet-set cap.
	if (FProperty* MaxHealthProperty = Data.EvaluatedData.Attribute.GetAttributeSetClass()->FindPropertyByName(TEXT("MaxHealth")))
	{
		const FGameplayAttribute MaxHealthAttribute(MaxHealthProperty);
		const float MaxHealth = Data.Target.GetNumericAttribute(MaxHealthAttribute);
		if (MaxHealth > 0.f)
		{
			const float CurrentHealth = Data.Target.GetNumericAttribute(Data.EvaluatedData.Attribute);
			const float ClampedHealth = FMath::Clamp(CurrentHealth, 0.f, MaxHealth);
			if (ClampedHealth != CurrentHealth)
			{
				Data.Target.SetNumericAttributeBase(Data.EvaluatedData.Attribute, ClampedHealth);
			}
		}
	}

	if (Data.Target.GetNumericAttribute(Data.EvaluatedData.Attribute) <= 0.f)
	{
		OnOutOfHealth.Broadcast();
	}
}
