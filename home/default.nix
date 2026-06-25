{
  imports = [
    ./chromium.nix
    ./direnv.nix
    ./firefox.nix
    ./ghostty.nix
    ./git.nix
    ./neovim.nix
    ./nix-index.nix
    ./packages.nix
    ./profile.nix
    ./ssh.nix
    ./starship.nix
    ./vscode.nix
    ./zsh.nix
  ];

  programs.home-manager.enable = true;

  home.username = "cristian";
  home.homeDirectory = "/home/cristian";
}
