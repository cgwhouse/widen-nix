{ pkgs, theme, ... }:

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
      sansSerif = [ theme.fonts.sans ];
      monospace = [ theme.fonts.mono ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
