{ pkgs, ... }:

{
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
}
