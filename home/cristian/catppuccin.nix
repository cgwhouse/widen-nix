{ pkgs, ... }:

{
  catppuccin = {
    enable = true;
    accent = "green";
    flavor = "mocha";
  };

  home.packages = [
    (pkgs.catppuccin-kde.override {
      flavour = [ "mocha" ];
      accents = [ "green" ];
    })
    pkgs.catppuccin-cursors.mochaGreen
  ];

  programs.plasma.workspace = {
    lookAndFeel = "Catppuccin-Mocha-Green";
    cursor.theme = "catppuccin-mocha-green-cursors";
  };
}
