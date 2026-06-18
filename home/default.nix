{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  home.username = "cristian";
  home.homeDirectory = "/home/cristian";

  home.packages = with pkgs; [
    fastfetch
    git-credential-manager
    nh
    nixd
    nixfmt
    nixfmt-tree
    ripgrep
    spotify

    (colloid-icon-theme.override {
      colorVariants = [ "green" ];
      schemeVariants = [ "catppuccin" ];
    })
  ];

  home.stateVersion = "26.05";
}
