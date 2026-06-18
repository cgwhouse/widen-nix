{
  services = {
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };

  boot.initrd.kernelModules = [ "virtio_gpu" ];
}
