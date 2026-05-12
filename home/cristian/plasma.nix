{ ... }:

{
  programs.plasma = {
    enable = true;

    input.keyboard.numlockOnStartup = "on";
    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";

    # Default applications
    configFile.kdeglobals.General = {
      TerminalService = "com.mitchellh.ghostty.desktop";
      TerminalApplication = "ghostty";
    };

    shortcuts = {
      "services/com.mitchellh.ghostty.desktop"."_launch" = "Meta+Return";

      kwin = {
        "Window Close" = [
          "Meta+Alt+C"
          "Alt+F4"
        ];
      };
    };
  };
}
