#include "CamelotRAW_TP.h"
#include "Modules/ModuleManager.h"

#if WITH_EDITOR
#include "Engine/Engine.h"
#include "Misc/CoreDelegates.h"
#endif

class FCamelotRAW_TPModule : public FDefaultGameModuleImpl
{
public:
	virtual void StartupModule() override
	{
#if WITH_EDITOR
		// Auto-start the Unreal MCP server on editor launch (Claude Code terminal sessions
		// connect to it) - the previously documented ini-based autostart
		// ([Startup] ConsoleAutoStartCommand) does not actually run (verified via log: no
		// trace of it firing, port never opens). OnPostEngineInit fires once the engine -
		// including the MCP plugin's HTTP server subsystem - is fully initialized, which is
		// exactly the timing ConsoleAutoStartCommand/-ExecCmds can race against.
		FCoreDelegates::OnPostEngineInit.AddLambda([]()
		{
			if (GEngine)
			{
				GEngine->Exec(nullptr, TEXT("ModelContextProtocol.StartServer"));
			}
		});
#endif
	}
};

IMPLEMENT_PRIMARY_GAME_MODULE(FCamelotRAW_TPModule, CamelotRAW_TP, "CamelotRAW_TP");
