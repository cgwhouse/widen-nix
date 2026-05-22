{ pkgs, ... }:

{
  programs.niri.enable = true;

  services.displayManager.sddm.enable = false;
  services.greetd = {
    enable = true;
    settings.default_session.command =
      "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd niri-session";
  };
}
