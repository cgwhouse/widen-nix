{ config, inputs, ... }:

let
  theme = config.flake.lib.theme;
in
{
  imports = [ inputs.home-manager.flakeModules.home-manager ];

  flake.nixosModules.home-manager = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs theme; };

      users.cristian = {
        imports = [
          ../../home/cristian
          config.flake.homeModules.catppuccin
        ];
      };
    };
  };
}
