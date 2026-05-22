{ pkgs, ... }:

{
  programs.niri.enable = true;

  services.displayManager.sddm.enable = false;
  services.greetd = {
    enable = true;
    settings.default_session.command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
  };

  # DMS ships its own polkit agent; disable niri-flake's KDE one to avoid conflict.
  systemd.user.services.niri-flake-polkit.enable = false;
}
