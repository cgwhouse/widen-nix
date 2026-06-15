{
  flake.nixosModules.plasma = {
    imports = [ ../../../desktop/plasma/system.nix ];

    home-manager.users.cristian.imports = [ ../../../desktop/plasma/home.nix ];
  };

  flake.homeModules.plasma = ../../../desktop/plasma/home.nix;
}
