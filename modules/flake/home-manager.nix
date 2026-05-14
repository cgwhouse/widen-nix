{ config, inputs, ... }:

{
  flake.nixosModules.home-manager = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
      sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];

      users.cristian = {
        imports = [
          ../../home/cristian
          config.flake.homeModules.catppuccin
        ];
      };
    };
  };
}
