{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (colloid-icon-theme.override {
      colorVariants = [ "green" ];
      schemeVariants = [ "catppuccin" ];
    })
    fastfetch
    git-credential-manager
    nh
    nixd
    nixfmt
    nixfmt-tree
    ripgrep
    spotify
  ];
}
