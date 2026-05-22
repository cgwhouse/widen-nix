{ inputs, ... }:

{
  imports = [
    # niri.homeModules.niri is auto-imported by niri-flake's NixOS module
    # when home-manager runs as a NixOS module — don't re-import here.
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
  ];

  programs.niri.settings = {
    # Flesh out keybinds, outputs, and layout when the bare-metal host is set up.
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
      enableKeybinds = true;
      enableSpawn = false;
    };
  };
}
