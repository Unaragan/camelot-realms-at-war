using UnrealBuildTool;
using System.Collections.Generic;

public class CamelotRAW_TPEditorTarget : TargetRules
{
	public CamelotRAW_TPEditorTarget(TargetInfo Target) : base(Target)
	{
		Type = TargetType.Editor;
		DefaultBuildSettings = BuildSettingsVersion.Latest;
		IncludeOrderVersion = EngineIncludeOrderVersion.Latest;

		ExtraModuleNames.Add("CamelotRAW_TP");
	}
}
