{
  imports = [
    ./hardware.nix
    ../../modules/default.nix
    ../../modules/vm-guest.nix
  ];

  networking.hostName = "widen-nix-vm";
  system.stateVersion = "26.05";
}
