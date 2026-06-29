{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      lora
      nerd-fonts.fira-code
      nerd-fonts.ubuntu
      noto-fonts-color-emoji
    ];

    fontconfig.defaultFonts = {
      serif = [ "Lora" ];
      sansSerif = [ "Ubuntu Nerd Font" ];
      monospace = [ "FiraCode Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
