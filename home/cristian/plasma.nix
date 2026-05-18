{ ... }:

{
  programs.plasma = {
    enable = true;

    input.keyboard.numlockOnStartup = "on";
    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";

    # Disable auto power management stuff
    powerdevil.AC = {
      autoSuspend.action = "nothing";
      turnOffDisplay.idleTimeout = "never";
      dimDisplay.enable = false;
      powerButtonAction = "nothing";
    };

    kscreenlocker = {
      autoLock = false;
      lockOnResume = false;
      timeout = 0;
    };

    shortcuts = {
      kwin = {
        "Window Close" = [
          "Meta+Alt+C"
          "Alt+F4"
        ];
      };
    };

    fonts = {
      general = {
        family = "Ubuntu Nerd Font";
        pointSize = 13;
      };

      fixedWidth = {
        family = "FiraCode Nerd Font";
        pointSize = 13;
      };

      small = {
        family = "Ubuntu Nerd Font";
        pointSize = 11;
      };

      toolbar = {
        family = "Ubuntu Nerd Font";
        pointSize = 13;
      };

      menu = {
        family = "Ubuntu Nerd Font";
        pointSize = 13;
      };

      windowTitle = {
        family = "Ubuntu Nerd Font";
        pointSize = 13;
      };
    };
  };
}
