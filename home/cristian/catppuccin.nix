{ pkgs, ... }:

{
  # Globally set theme wherever possible via catppuccin.nix
  catppuccin = {
    enable = true;
    accent = "green";
    flavor = "mocha";
  };

  # Install Plasma global theme + cursor theme
  home.packages = [
    (pkgs.catppuccin-kde.override {
      flavour = [ "mocha" ];
      accents = [ "green" ];
    })
    pkgs.catppuccin-cursors.mochaGreen
  ];

  # Set themes in Plasma settings
  programs.plasma.workspace = {
    lookAndFeel = "Catppuccin-Mocha-Green";
    cursor.theme = "catppuccin-mocha-green-cursors";
  };
}
