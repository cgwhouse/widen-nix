{ pkgs, ... }:

{
  programs.zsh.enable = true;
  environment.shells = with pkgs; [ zsh ];

  users = {
    defaultUserShell = pkgs.zsh;

    users.cristian = {
      isNormalUser = true;
      description = "Cristian Widenhouse";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };
}
