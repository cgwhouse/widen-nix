{ config, inputs, ... }:

{
  flake.nixosConfigurations.widen-nix-vm = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs; };
    modules = [
      ../../hosts/vm
      config.flake.nixosModules.catppuccin
      config.flake.nixosModules.home-manager
      config.flake.nixosModules.agenix
    ];
  };
}
