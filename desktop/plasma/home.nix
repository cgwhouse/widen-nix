{
  config,
  lib,
  inputs,
  ...
}:

let
  # Helper to do the capitalization that the Plasma theme needs
  cap = s: (lib.toUpper (builtins.substring 0 1 s)) + (builtins.substring 1 (-1) s);
in
{
  imports = [ inputs.plasma-manager.homeModules.plasma-manager ];

  programs.plasma = {
    enable = true;

    # General settings I usually do
    input.keyboard.numlockOnStartup = "on";
    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    configFile.kwinrc.TabBox.HighlightWindows = false;
    kscreenlocker.appearance.showMediaControls = false;

    # Set default terminal to ghostty
    configFile.kdeglobals.General = {
      TerminalService = "com.mitchellh.ghostty.desktop";
      TerminalApplication = "ghostty";
    };

    # Disable auto power management
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

    # My only custom keyboard shortcuts on Plasma
    shortcuts = {
      kwin = {
        "Window Close" = [
          "Meta+Alt+C"
        ];
      };

      "services/com.mitchellh.ghostty.desktop"."_launch" = "Meta+Return";
    };

    # Font settings
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

    # Theme
    workspace = {
      lookAndFeel = "Catppuccin-${cap config.catppuccin.flavor}-${cap config.catppuccin.accent}";
      cursor.theme = "catppuccin-${config.catppuccin.flavor}-${config.catppuccin.accent}-cursors";
      iconTheme = "Colloid-Green-Catppuccin-Dark";
    };

    # Tweaks to default bottom panel
    panels = [
      {
        floating = true;
        location = "bottom";
        lengthMode = "fit";
        opacity = "transparent";

        widgets = [
          {
            kickoff = {
              icon = "nix-snowflake";
              showButtonsFor = "powerAndSession";
              showActionButtonCaptions = false;
            };
          }
          "org.kde.plasma.pager"
          {
            iconTasks = {
              launchers = [
                "preferred://filemanager"
                "applications:com.mitchellh.ghostty.desktop"
                "applications:firefox.desktop"
                "applications:code.desktop"
              ];
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          {
            digitalClock = {
              date = {
                enable = true;
                format.custom = "ddd, MMM d";
                position = "belowTime";
              };
            };
          }
          {
            systemMonitor = {
              title = "Total CPU Use";
              displayStyle = "org.kde.ksysguard.piechart";
              sensors = [
                {
                  name = "cpu/all/usage";
                  color = "180,190,254";
                  label = "CPU %";
                }
              ];
              # Bug workaround: typed totalSensors/textOnlySensors emit double-escaped JSON
              settings.Sensors = {
                highPrioritySensorIds = ''["cpu/all/usage"]'';
                lowPrioritySensorIds = ''["cpu/all/cpuCount", "cpu/all/coreCount"]'';
                totalSensors = ''["cpu/all/usage"]'';
              };
            };
          }
          {
            systemMonitor = {
              title = "Memory Usage";
              displayStyle = "org.kde.ksysguard.piechart";
              sensors = [
                {
                  name = "memory/physical/used";
                  color = "166,227,161";
                  label = "Memory";
                }
              ];
              settings.Sensors = {
                highPrioritySensorIds = ''["memory/physical/used"]'';
                lowPrioritySensorIds = ''["memory/physical/total"]'';
                totalSensors = ''["memory/physical/usedPercent"]'';
              };
            };
          }
        ];
      }
    ];
  };
}
