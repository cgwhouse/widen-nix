{ pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;

    # For shared folders
    qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  };

  programs.virt-manager.enable = true;

  users.users.cristian.extraGroups = [ "libvirtd" ];

  environment.systemPackages = with pkgs; [
    dnsmasq
  ];
}
