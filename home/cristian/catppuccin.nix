{ pkgs, ... }:

{
  catppuccin = {
    enable = true;
    accent = "green";
    flavor = "mocha";
  };

  # 1. Install the theme package
  home.packages = [
    (pkgs.catppuccin-kde.override {
      flavour = [ "mocha" ];
      accents = [ "green" ];
    })
  ];

  # 2. Configure via plasma-manager
  programs.plasma = {
    workspace = {
      # This sets the "Global Theme"
      lookAndFeel = "catppuccin-mocha-green";

      # Optional: Fine-tune individual components
      # colorScheme = "CatppuccinMochaGreen";
      # theme = "catppuccin-mocha-blue"; # The "Plasma Style"
      # cursorTheme = "catppuccin-mocha-blue-cursors";
    };
  };
}
