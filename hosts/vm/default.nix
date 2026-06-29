{
  imports = [
    ./hardware.nix
    ../../modules/default.nix
    ../../modules/optional/vm-guest.nix
  ];

  networking.hostName = "widen-nix-vm";

  system.stateVersion = "26.05";
  home-manager.users.cristian.home.stateVersion = "26.05";
}
