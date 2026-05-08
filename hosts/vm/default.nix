{ ... }:

{
  imports = [
    ./hardware.nix
    ../../modules/nixos
    ../../modules/nixos/vm-guest.nix
  ];

  networking.hostName = "widen-nix-vm";

  # Do not touch
  system.stateVersion = "25.11";
}
