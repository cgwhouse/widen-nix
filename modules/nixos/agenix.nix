{ inputs, pkgs, ... }:

{
  environment.systemPackages = [
    inputs.agenix.packages.${pkgs.system}.default
  ];

  # age.secrets.<name>.file = ../../secrets/<name>.age;
  # Decrypted secrets land in /run/agenix/<name> at activation time.
}
