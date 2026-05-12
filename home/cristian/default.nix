{ pkgs, ... }:

{
  imports = [
    ./direnv.nix
    ./firefox.nix
    ./ghostty.nix
    ./git.nix
    ./neovim.nix
    ./plasma.nix
    ./vscode.nix
    ./zsh.nix
  ];

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
    # neovim
    ripgrep
  ];

  # Do not touch
  home.stateVersion = "26.05";
}
