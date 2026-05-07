{ pkgs, ... }:

{
  imports = [
    ./direnv.nix
    ./git.nix
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

    fastfetch
    git-credential-manager
    neovim
  ];

  # Do not touch
  home.stateVersion = "25.11";
}
