{ pkgs, inputs, ... }:

let
  niriPkgs = inputs.niri.packages.${pkgs.system};
in
{
  programs.niri = {
    enable = true;
    # niri-stable (v25.08) predates KDL `include` support, which DMS relies on
    # for its config-injection scheme. Track unstable to pick up v25.11+.
    package = niriPkgs.niri-unstable;
  };

  # niri ≥25.08 auto-spawns xwayland-satellite when it's on PATH.
  environment.systemPackages = [ niriPkgs.xwayland-satellite-stable ];

  services.displayManager.sddm.enable = false;
  services.greetd = {
    enable = true;
    settings.default_session.command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
  };

  # DMS ships its own polkit agent; disable niri-flake's KDE one to avoid conflict.
  systemd.user.services.niri-flake-polkit.enable = false;
}
