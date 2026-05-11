{
  description = "Cristian's system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    plasma-manager = {
    url = "github:nix-community/plasma-manager";
    inputs.nixpkgs.follows = "nixpkgs";
    inputs.home-manager.follows = "home-manager";
  };
  };

  outputs =
    inputs@{ nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      mkHost =
        dir:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/${dir}

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
                home-manager.sharedModules = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];

              home-manager.users.cristian = import ./home/cristian;
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        widen-nix-vm = mkHost "vm";
        # Add future hosts here, e.g.:
        # widen-nix-laptop = mkHost "laptop";
      };

      formatter.${system} = pkgs.nixfmt;
    };
}
