{

imports =
    [ 
      ./hardware-configuration.nix
      ../modules/configuration.nix
    ];

  networking.hostName = "widen-nix-vm";
}
