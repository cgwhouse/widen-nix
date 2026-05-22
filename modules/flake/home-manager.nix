{ config, inputs, ... }:

{
  flake.nixosModules.home-manager = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };

      users.cristian = {
        imports = [
          ../../home/cristian
          config.flake.homeModules.catppuccin
        ];
      };
    };
  };
}
