{ inputs, ... }:

{
  imports = [
    inputs.niri.homeModules.niri
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

  # DMS ships its own polkit agent; disable niri-flake's KDE one to avoid conflict.
  systemd.user.services.niri-flake-polkit.enable = false;
}
