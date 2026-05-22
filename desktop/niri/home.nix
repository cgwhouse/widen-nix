{ config, inputs, ... }:

{
  imports = [
    # niri.homeModules.niri is auto-imported by niri-flake's NixOS module
    # when home-manager runs as a NixOS module — don't re-import here.
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
  ];

  programs.niri.settings = {
    binds = with config.lib.niri.actions; {
      "Mod+Return".action = spawn "ghostty";
      "Mod+B".action = spawn "firefox";
      "Mod+Alt+C".action = close-window;
    };
  };

  programs.dank-material-shell = {
    enable = true;
    # systemd.enable and niri.enableSpawn are mutually exclusive per DMS docs.
    systemd.enable = true;
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableClipboardPaste = true;

    niri = {
      # Keybinds flow via niri.includes (DMS default); don't also enableKeybinds.
      enableSpawn = false; # mutually exclusive with systemd.enable above
    };
  };
}
