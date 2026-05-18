{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      nerd-fonts.ubuntu
      lora
      nerd-fonts.fira-code
      noto-fonts-color-emoji
    ];

    fontconfig.defaultFonts = {
      serif = [ "Lora" ];
      sansSerif = [ "Ubuntu" ];
      monospace = [ "FiraCode Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
