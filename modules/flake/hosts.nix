{ config, inputs, ... }:

let
  theme = config.flake.lib.theme;

  mkSystem =
    modules:
    inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs theme; };
      inherit modules;
    };

  # All hosts will use these
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
        config.flake.nixosModules.niri
      ]
      ++ common
    );
  };
}
