{
  imports = [
    ./git.nix
    ./packages.nix
    ./starship.nix
    ./zsh.nix
  ];

  programs.home-manager.enable = true;

  home.username = "cristian";
  home.homeDirectory = "/home/cristian";

  home.stateVersion = "26.05";
}
