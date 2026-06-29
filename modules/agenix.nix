{
  pkgs,
  lib,
  inputs,
  ...
}:

let
  sshSecret = ../secrets/ssh-matchblocks.age;
in
{
  imports = [ inputs.agenix.nixosModules.default ];

  environment.systemPackages = [
    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  age.secrets = lib.optionalAttrs (builtins.pathExists sshSecret) {
    ssh-matchblocks = {
      file = sshSecret;
      owner = "cristian";
      group = "users";
      mode = "0400";
    };
  };
}
