{ config, inputs, ... }:
{
  flake.nixosConfigurations.widen-nix-vm = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs; };
    modules = [
      ../../hosts/vm
      config.flake.nixosModules.catppuccin
      config.flake.nixosModules.home-manager
    ];
  };

  # widen-nix-desktop (bare-metal) — wire up after a vanilla NixOS install:
  #   1. Copy /etc/nixos/hardware-configuration.nix from the freshly installed
  #      system into hosts/desktop/hardware.nix (same workflow used for vm).
  #   2. Create hosts/desktop/default.nix mirroring hosts/vm/default.nix, but:
  #        - set networking.hostName = "widen-nix-desktop"
  #        - drop services.qemuGuest, services.spice-vdagentd
  #        - replace boot.initrd.kernelModules = [ "virtio_gpu" ] with the GPU's
  #          KMS driver (amdgpu / nouveau / i915) — plymouth needs it in initrd
  #   3. Uncomment the block below.
  #
  # flake.nixosConfigurations.widen-nix-desktop = inputs.nixpkgs.lib.nixosSystem {
  #   system = "x86_64-linux";
  #   specialArgs = { inherit inputs; };
  #   modules = [
  #     ../../hosts/desktop
  #     config.flake.nixosModules.catppuccin
  #     config.flake.nixosModules.home-manager
  #   ];
  # };
}
