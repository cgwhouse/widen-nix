{
  imports = [
    ./direnv.nix
    ./firefox.nix
    ./ghostty.nix
    ./git.nix
    ./neovim.nix
    ./nix-index.nix
    ./packages.nix
    ./profile.nix
    ./starship.nix
    ./zsh.nix
  ];

  programs.home-manager.enable = true;

  home.username = "cristian";
  home.homeDirectory = "/home/cristian";

  home.stateVersion = "26.05";
}
