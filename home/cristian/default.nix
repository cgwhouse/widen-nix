{ lib, pkgs, ... }:

let
  isModule = name: type: type == "regular" && lib.hasSuffix ".nix" name && name != "default.nix";
  moduleNames = builtins.attrNames (lib.filterAttrs isModule (builtins.readDir ./.));
in
{
  imports = map (n: ./. + "/${n}") moduleNames;

  home = {
    username = "cristian";
    homeDirectory = "/home/cristian";
  };

  home.packages = with pkgs; [
    # Nix meta
    nh
    nixd
    nixfmt
    nixfmt-tree

    fastfetch
    ripgrep
    spotify

    # Icon theme, selected per-DE in desktop/plasma and desktop/niri.
    # catppuccin palette + green folder accent -> "Colloid-Green-Catppuccin-Dark"
    (colloid-icon-theme.override {
      colorVariants = [ "green" ];
      schemeVariants = [ "catppuccin" ];
    })
  ];

  # Do not touch
  home.stateVersion = "26.05";
}
