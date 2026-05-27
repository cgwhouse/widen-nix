{
  flake.nixosModules.gaming = {
    { pkgs, ... }:

    programs.steam.enable = true;
    programs.gamemode.enable = true;
    
home.packages = with pkgs; [
       protonplus 
      ];
  };
}
