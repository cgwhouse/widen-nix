{ pkgs, ... }:

{
  # Make zsh available as a system shell
  programs.zsh.enable = true;
  environment.shells = with pkgs; [ zsh ];

  users = {
    defaultUserShell = pkgs.zsh;

    users.cristian = {
      isNormalUser = true;
      description = "Cristian Widenhouse";
      extraGroups = [
        "docker"
        "networkmanager"
        "wheel"
      ];
    };
  };
}
