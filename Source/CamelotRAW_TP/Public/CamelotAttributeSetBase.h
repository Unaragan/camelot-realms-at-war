#pragma once

#include "CoreMinimal.h"
#include "AttributeSet.h"
#include "CamelotAttributeSetBase.generated.h"

DECLARE_DYNAMIC_MULTICAST_DELEGATE(FCamelotOnOutOfHealth);

// PostGameplayEffectExecute is a plain C++ virtual, not a BlueprintNativeEvent, so a
// Blueprint-defined AttributeSet (e.g. AS_PaladinAttributes) has no way to react to its
// own attribute changes. This base class is the minimal bridge for that - the unavoidable
// C++ the Blueprint-first exception clause covers (see CLAUDE.md). Attributes themselves
// stay as Blueprint-defined FGameplayAttributeData variables on the subclass; this base
// only watches whichever attribute is named "Health" and broadcasts once it reaches zero.
UCLASS()
class CAMELOTRAW_TP_API UCamelotAttributeSetBase : public UAttributeSet
{
	GENERATED_BODY()

public:
	UPROPERTY(BlueprintAssignable, Category = "Camelot|GAS")
	FCamelotOnOutOfHealth OnOutOfHealth;

	virtual void PostGameplayEffectExecute(const struct FGameplayEffectModCallbackData& Data) override;
};
