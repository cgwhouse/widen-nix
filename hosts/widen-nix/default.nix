{ ... }:

{
  imports = [
    ./hardware.nix
    ../../modules/nixos
  ];

  networking.hostName = "widen-nix";

  # Do not touch
  system.stateVersion = "25.11";
}
