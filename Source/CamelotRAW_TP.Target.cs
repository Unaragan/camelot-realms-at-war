using UnrealBuildTool;
using System.Collections.Generic;

public class CamelotRAW_TPTarget : TargetRules
{
	public CamelotRAW_TPTarget(TargetInfo Target) : base(Target)
	{
		Type = TargetType.Game;
		DefaultBuildSettings = BuildSettingsVersion.Latest;
		IncludeOrderVersion = EngineIncludeOrderVersion.Latest;

		ExtraModuleNames.Add("CamelotRAW_TP");
	}
}
