{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.username = "cristian";
  home.homeDirectory = "/home/cristian";

  home.packages = [
    pkgs.fastfetch
    pkgs.nixfmt
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "Cristian Widenhouse";
      email = "cgwidenhouse@gmail.com";
    };

  };

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ];
  };

  # Do not touch
  home.stateVersion = "25.11";
}
