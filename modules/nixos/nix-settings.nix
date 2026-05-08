{ pkgs, ... }:

{

# Allow unfree packages
  nixpkgs.config.allowUnfree = true;

nix = {
settings = {
# Enable Flakes
experimental-features = [
    "nix-command"
    "flakes"
  ];
  
  auto-optimise-store = true;
};

# Some more automatic cleanup
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
