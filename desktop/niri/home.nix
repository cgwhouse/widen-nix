{
  config,
  inputs,
  pkgs,
  ...
}:

let
  catppuccinTheme = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/dankmaterialshell/main/catppuccin.json";
    hash = "sha256-3wRf5KBzJ7IUpZGJ10BCIhDfd6b6tUcj8YJ4Q1Cg0a8=";
  };

  wallpaper = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/zhichaoh/catppuccin-wallpapers/main/os/nix-magenta-blue-1920x1080.png";
    hash = "sha256-CsBF3h4p0EEawF9aNDzm9DN+YoxyEnicc9n0oC8FCfs=";
  };
in
{
  imports = [
    # NOTE: niri.homeModules.niri is auto-imported by the NixOS module
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
  ];

  programs.dank-material-shell = {
    enable = true;

    # Use the systemd service instead of enableSpawn
    systemd.enable = true;
    niri.enableSpawn = false;

    # High-level DMS features
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableClipboardPaste = true;

    session.wallpaperPath = "${wallpaper}";

    # Other settings via DMS UI
    settings = {
      use24HourClock = false;
      weatherEnabled = true;
      useFahrenheit = true;
      useAutoLocation = true;

      fontFamily = "Ubuntu Nerd Font";

      # Theme
      currentThemeName = "custom";
      currentThemeCategory = "custom";
      customThemeFile = "${catppuccinTheme}";
      registryThemeVariants.catppuccin.dark = {
        flavor = "mocha";
        accent = "green";
      };
    };
  };

  # Icon theme
  gtk = {
    enable = true;
    iconTheme.name = "Colloid-Green-Catppuccin-Dark";
  };

  # Prevents Catppuccin icon theme from colliding
  catppuccin.gtk.icon.enable = false;

  programs.niri.settings = {
    hotkey-overlay.skip-at-startup = true;

    # Cursor theme
    cursor = {
      theme = config.home.pointerCursor.name;
      size = config.home.pointerCursor.size;
    };

    binds = with config.lib.niri.actions; {
      # My custom binds
      "Mod+Return".action = spawn "ghostty";
      "Mod+B".action = spawn "firefox";
      "Mod+Alt+C".action = close-window;
      "Mod+Space".action = spawn "dms" "ipc" "spotlight" "toggle";
      "Mod+Alt+L".action = spawn "dms" "ipc" "lock" "lock";

      ### Everything below is lifted from the defaults ###

      "XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
      "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";

      "Mod+Left".action = focus-column-left;
      "Mod+Down".action = focus-window-down;
      "Mod+Up".action = focus-window-up;
      "Mod+Right".action = focus-column-right;
      "Mod+H".action = focus-column-left;
      "Mod+J".action = focus-window-down;
      "Mod+K".action = focus-window-up;
      "Mod+L".action = focus-column-right;

      "Mod+Ctrl+Left".action = move-column-left;
      "Mod+Ctrl+Down".action = move-window-down;
      "Mod+Ctrl+Up".action = move-window-up;
      "Mod+Ctrl+Right".action = move-column-right;
      "Mod+Ctrl+H".action = move-column-left;
      "Mod+Ctrl+J".action = move-window-down;
      "Mod+Ctrl+K".action = move-window-up;
      "Mod+Ctrl+L".action = move-column-right;

      "Mod+Home".action = focus-column-first;
      "Mod+End".action = focus-column-last;
      "Mod+Ctrl+Home".action = move-column-to-first;
      "Mod+Ctrl+End".action = move-column-to-last;

      "Mod+Shift+Left".action = focus-monitor-left;
      "Mod+Shift+Down".action = focus-monitor-down;
      "Mod+Shift+Up".action = focus-monitor-up;
      "Mod+Shift+Right".action = focus-monitor-right;
      "Mod+Shift+H".action = focus-monitor-left;
      "Mod+Shift+J".action = focus-monitor-down;
      "Mod+Shift+K".action = focus-monitor-up;
      "Mod+Shift+L".action = focus-monitor-right;

      "Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
      "Mod+Shift+Ctrl+Down".action = move-column-to-monitor-down;
      "Mod+Shift+Ctrl+Up".action = move-column-to-monitor-up;
      "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
      "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
      "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
      "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
      "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;

      "Mod+Page_Down".action = focus-workspace-down;
      "Mod+Page_Up".action = focus-workspace-up;
      "Mod+U".action = focus-workspace-down;
      "Mod+I".action = focus-workspace-up;
      "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
      "Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;
      "Mod+Ctrl+U".action = move-column-to-workspace-down;
      "Mod+Ctrl+I".action = move-column-to-workspace-up;

      "Mod+Shift+Page_Down".action = move-workspace-down;
      "Mod+Shift+Page_Up".action = move-workspace-up;
      "Mod+Shift+U".action = move-workspace-down;
      "Mod+Shift+I".action = move-workspace-up;

      "Mod+1".action = focus-workspace 1;
      "Mod+2".action = focus-workspace 2;
      "Mod+3".action = focus-workspace 3;
      "Mod+4".action = focus-workspace 4;
      "Mod+5".action = focus-workspace 5;
      "Mod+6".action = focus-workspace 6;
      "Mod+7".action = focus-workspace 7;
      "Mod+8".action = focus-workspace 8;
      "Mod+9".action = focus-workspace 9;

      "Mod+Ctrl+1".action.move-column-to-workspace = 1;
      "Mod+Ctrl+2".action.move-column-to-workspace = 2;
      "Mod+Ctrl+3".action.move-column-to-workspace = 3;
      "Mod+Ctrl+4".action.move-column-to-workspace = 4;
      "Mod+Ctrl+5".action.move-column-to-workspace = 5;
      "Mod+Ctrl+6".action.move-column-to-workspace = 6;
      "Mod+Ctrl+7".action.move-column-to-workspace = 7;
      "Mod+Ctrl+8".action.move-column-to-workspace = 8;
      "Mod+Ctrl+9".action.move-column-to-workspace = 9;

      "Mod+Comma".action = consume-window-into-column;
      "Mod+Period".action = expel-window-from-column;

      "Mod+R".action = switch-preset-column-width;
      "Mod+F".action = maximize-column;
      "Mod+Shift+F".action = fullscreen-window;
      "Mod+C".action = center-column;

      "Mod+Minus".action = set-column-width "-10%";
      "Mod+Equal".action = set-column-width "+10%";
      "Mod+Shift+Minus".action = set-window-height "-10%";
      "Mod+Shift+Equal".action = set-window-height "+10%";

      "Print".action.screenshot = { };
      "Ctrl+Print".action.screenshot-screen = { };
      "Alt+Print".action.screenshot-window = { };

      "Mod+Shift+E".action = quit;
      "Mod+Shift+P".action = power-off-monitors;
    };
  };

}
