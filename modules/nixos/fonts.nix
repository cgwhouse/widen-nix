{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      nerd-fonts.ubuntu
      nerd-fonts.fira-code
      noto-fonts-color-emoji

      # Just in case I never need a Serif font
      lora
    ];

    fontconfig.defaultFonts = {
      serif = [ "Lora" ];
      sansSerif = [ "Ubuntu Nerd Font" ];
      monospace = [ "FiraCode Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
