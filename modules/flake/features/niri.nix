{ inputs, ... }:

{
  flake.nixosModules.niri = {
    imports = [
      inputs.niri.nixosModules.niri
      ../../../desktop/niri/system.nix
    ];

    home-manager.users.cristian.imports = [ ../../../desktop/niri/home.nix ];
  };

  flake.homeModules.niri = ../../../desktop/niri/home.nix;
}
