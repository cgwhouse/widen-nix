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
    };

    # More automatic cleanup
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    curl
    wget
  ];
}
