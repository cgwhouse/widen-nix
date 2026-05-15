{ lib, ... }:

let
  sshSecret = ../../secrets/ssh-matchblocks.age;
in
lib.optionalAttrs (builtins.pathExists sshSecret) {
  age.secrets.ssh-matchblocks = {
    file = sshSecret;
    owner = "cristian";
    group = "users";
    mode = "0400";
  };
}
