{ config, inputs, ... }:

let
  mkSystem =
    modules:
    inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      inherit modules;
    };

  common = [
    config.flake.nixosModules.catppuccin
    config.flake.nixosModules.home-manager
    config.flake.nixosModules.agenix
  ];
in
{
  flake.nixosConfigurations = {
    widen-nix-vm = mkSystem (
      [
        ../../hosts/vm
        config.flake.nixosModules.plasma
      ]
      ++ common
    );
  };
}
