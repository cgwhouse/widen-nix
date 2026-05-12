{ ... }:

{
  programs.plasma = {
    enable = true;

    input.keyboard.numlockOnStartup = "on";
    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";

    shortcuts = {
      kwin = {
        "Window Close" = [
          "Meta+Alt+C"
          "Alt+F4"
        ];
      };
    };
  };
}
