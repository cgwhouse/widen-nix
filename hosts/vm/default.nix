{ ... }:

{
  imports = [
    ./hardware.nix
    ../../modules/nixos
  ];

  networking.hostName = "widen-nix-vm";

  # Do not touch
  system.stateVersion = "26.05";
  
  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };
}
