{

  imports = [
    ./hardware-configuration.nix
    ../../modules/configuration.nix
    ../../modules/vm-guest.nix
  ];

  networking.hostName = "widen-nix-vm";
  system.stateVersion = "26.05";
}
