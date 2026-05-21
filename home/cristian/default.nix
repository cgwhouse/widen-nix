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
    git-credential-manager
    ripgrep

    spotify
  ];

  # Do not touch
  home.stateVersion = "26.05";
}
