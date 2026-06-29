{ inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Provides pkgs.firefox-addons used in firefox.nix
  nixpkgs.overlays = [ inputs.firefox-addons.overlays.default ];

  nix = {

    # Enable Flakes
    settings.experimental-features =

      [
        "nix-command"
        "flakes"
      ];

    # Automatic garbage collect + store optimize
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };

    # Niceness when compiling stuff
    daemonCPUSchedPolicy = "idle";
    daemonIOSchedClass = "idle";
  };

  # Keep the journal from eating disk
  services.journald.extraConfig = ''
    SystemMaxUse=500M
    SystemKeepFree=1G
    MaxRetentionSec=1month
  '';
}
