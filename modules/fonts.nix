{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    fontconfig.defaultFonts = {
      serif = [ "Lora" ];
      sansSerif = [ "Ubuntu Nerd Font" ];
      monospace = [ "FiraCode Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
