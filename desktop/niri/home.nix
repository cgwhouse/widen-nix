{
  config,
  inputs,
  pkgs,
  theme,
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

  defaultBinds = import ./default-binds.nix { inherit config; };
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
      launcherLogoMode = "os";

      fontFamily = theme.fonts.sans;

      # Theme
      currentThemeName = "custom";
      currentThemeCategory = "custom";
      customThemeFile = "${catppuccinTheme}";
      registryThemeVariants.catppuccin.dark = {
        inherit (config.catppuccin) flavor accent;
      };
    };
  };

  # Icon theme
  gtk = {
    enable = true;
    iconTheme.name = theme.iconTheme;
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

    binds =
      defaultBinds
      // (with config.lib.niri.actions; {
        "Mod+Return".action = spawn "ghostty";
        "Mod+B".action = spawn "firefox";
        "Mod+Alt+C".action = close-window;
        "Mod+Space".action = spawn "dms" "ipc" "spotlight" "toggle";
        "Mod+Alt+L".action = spawn "dms" "ipc" "lock" "lock";
      });
  };

}
