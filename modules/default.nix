{ inputs, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./boot.nix
    ./fonts.nix
    ./locale.nix
    ./networking.nix
    ./nix-settings.nix
    ./packages.nix
    ./plasma.nix
    ./shell.nix
    ./users.nix
  ];
}
