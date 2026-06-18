{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    dnsmasq
    lora
    nerd-fonts.ubuntu
    nerd-fonts.fira-code
    noto-fonts-color-emoji
    pciutils
    vim
    wget
  ];
}
