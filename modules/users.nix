{ pkgs, ... }:

{
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
