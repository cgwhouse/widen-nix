{ inputs, pkgs, ... }:

{
  imports = [ (inputs.import-tree ./.) ];

  programs.home-manager.enable = true;

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
  ];

  # Do not touch
  home.stateVersion = "26.05";
}
