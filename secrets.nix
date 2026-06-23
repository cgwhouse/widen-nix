let
  vm-host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHYJb48NNm9pQxyV4EHaSESYqeNnjdwVHveLBSihaECS root@widen-nix-vm";
  vm-cristian = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIErAEBoTq0DfxlO+EnkPTZ4jv3I7tcPY789CcvZbSg5x cristian@widen-nix-vm";

  all = [
    vm-host
    vm-cristian
  ];
in
{
  "secrets/ssh-matchblocks.age".publicKeys = all;
}
