{ ... }:

{
  imports = [
    ./hardware.nix
    ./vm-guest.nix
    ../../modules/nixos
  ];

  networking.hostName = "widen-nix-vm";

  # Do not touch
  system.stateVersion = "26.05";
}
