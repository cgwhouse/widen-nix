{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.username = "cristian";
  home.homeDirectory = "/home/cristian";

  programs.git = {
    enable = true;
    userName = "Cristian Widenhouse";
    userEmail = "cgwidenhouse@gmail.com";
  };

  # Do not touch
  home.stateVersion = "25.11";
}
