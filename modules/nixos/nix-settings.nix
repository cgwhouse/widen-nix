{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      # Automatic cleanup
      auto-optimise-store = true;

      # Enable Flakes
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Wheel members can use remote builders, override caches, etc.
      trusted-users = [
        "root"
        "@wheel"
      ];

      # Silence the "Git tree is dirty" warning during local dev
      warn-dirty = false;
    };

    # More automatic cleanup
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };

  # Keep the journal from eating disk on long-running machines
  services.journald.extraConfig = ''
    SystemMaxUse=500M
    SystemKeepFree=1G
    MaxRetentionSec=1month
  '';

  environment.systemPackages = with pkgs; [
    vim
    curl
    wget
  ];
}
