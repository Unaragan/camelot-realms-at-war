#include "CamelotRAW_TP.h"
#include "Modules/ModuleManager.h"

#if WITH_EDITOR
#include "Engine/Engine.h"
#include "Misc/CoreDelegates.h"
#include "Misc/Paths.h"
#include "Misc/App.h"
#include "HAL/PlatformProcess.h"
#endif

class FCamelotRAW_TPModule : public FDefaultGameModuleImpl
{
public:
	virtual void StartupModule() override
	{
#if WITH_EDITOR
		// Auto-start the Unreal MCP server on editor launch (Codex desktop sessions
		// connect to it) - the previously documented ini-based autostart
		// ([Startup] ConsoleAutoStartCommand) does not actually run (verified via log: no
		// trace of it firing, port never opens). OnPostEngineInit fires once the engine -
		// including the MCP plugin's HTTP server subsystem - is fully initialized, which is
		// exactly the timing ConsoleAutoStartCommand/-ExecCmds can race against.
		FCoreDelegates::GetOnPostEngineInit().AddLambda([]()
		{
			if (GEngine)
			{
				GEngine->Exec(nullptr, TEXT("ModelContextProtocol.StartServer"));
#if PLATFORM_WINDOWS
                // Open Codex for interactive editor launches, including .uproject double-click.
                // Never launch desktop apps during cooking/commandlets/unattended builds.
                if (!IsRunningCommandlet() && !FApp::IsUnattended())
                {
                    const FString Script = FPaths::ConvertRelativePathToFull(
                        FPaths::Combine(FPaths::ProjectDir(), TEXT("tools/open-codex.ps1")));
                    if (FPaths::FileExists(Script))
                    {
                        const FString Args = FString::Printf(
                            TEXT("-NoProfile -NonInteractive -WindowStyle Hidden -ExecutionPolicy Bypass -File \"%s\""), *Script);
                        FProcHandle Helper = FPlatformProcess::CreateProc(
                            TEXT("C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"),
                            *Args, true, true, true, nullptr, 0, nullptr, nullptr);
                        if (Helper.IsValid()) { FPlatformProcess::CloseProc(Helper); }
                    }
                }
#endif
			}
		});
#endif
	}
};

IMPLEMENT_PRIMARY_GAME_MODULE(FCamelotRAW_TPModule, CamelotRAW_TP, "CamelotRAW_TP");
