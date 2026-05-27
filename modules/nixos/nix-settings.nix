{ inputs, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Needed so allowUnfree applies to FF extensions too
  nixpkgs.overlays = [ inputs.firefox-addons.overlays.default ];

  nix = {
    settings = {
      # Enable Flakes
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

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

  environment.systemPackages = with pkgs; [
    vim
    curl
    wget
    pciutils
  ];
}
