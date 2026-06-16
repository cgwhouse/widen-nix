{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    git
    fastfetch
    nixfmt
    nixfmt-tree
  ];
}
