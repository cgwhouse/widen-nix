{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    pciutils
    vim
    wget
  ];
}
