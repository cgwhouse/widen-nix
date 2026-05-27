{ pkgs, inputs, ... }:

let
  niriPkgs = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.niri = {
    enable = true;
    # Currently needed for KDL `include` support, which DMS relies on,
    # could remove in the future
    package = niriPkgs.niri-unstable;
  };

  # Needed for XWayland
  environment.systemPackages = [ niriPkgs.xwayland-satellite-stable ];

  # Display Manager
  services = {
    displayManager.sddm.enable = false;

    greetd = {
      enable = true;
      settings.default_session.command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
    };

    # Needed for user avatar / profile pic
    accounts-daemon.enable = true;
  };

  # DMS ships its own polkit agent, we don't need the Niri one
  systemd.user.services.niri-flake-polkit.enable = false;
}
