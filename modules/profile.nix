{ lib, pkgs, ... }:

let
  user = "cristian";
  picture = ../assets/profile.png;
  userFile = pkgs.writeText "accountsservice-${user}" ''
    [User]
    Icon=/var/lib/AccountsService/icons/${user}
  '';
in
lib.optionalAttrs (builtins.pathExists picture) {
  systemd.tmpfiles.rules = [
    "C+ /var/lib/AccountsService/icons/${user} 0644 root root - ${picture}"
    "C+ /var/lib/AccountsService/users/${user} 0644 root root - ${userFile}"
  ];
}
