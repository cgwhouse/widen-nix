{ ... }:

{
  imports = [
    ./hardware.nix
    ../../modules/nixos
  ];

  networking.hostName = "widen-nix-vm";

  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };

  # For Plymouth to work on VM
  boot.initrd.kernelModules = [ "virtio_gpu" ];

  # Do not touch
  system.stateVersion = "26.05";
}
