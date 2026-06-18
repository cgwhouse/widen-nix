{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    pciutils
    vim
    wget

    # git
    # fastfetch
    # nixfmt
    # nixfmt-tree
  ];
}
