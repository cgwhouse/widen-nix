{
  imports = [
    ./hardware.nix
    ../../modules/default.nix
    ../../modules/optional/vm-guest.nix
  ];

  networking.hostName = "widen-nix-vm";
  system.stateVersion = "26.05";
}
