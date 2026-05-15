let
  vm-host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAeDRamBXD78beSvm0KTKSoOaqHUu54qMw+SFusmUb38 root@widen-nix-vm";
  vm-cristian = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHCbpu3fGG4TJobHZ57YA/ykqMxLp32sU+rM2mUs0bZh cristian@widen-nix-vm";

  all = [
    vm-host
    vm-cristian
  ];
in
{
  "secrets/ssh-matchblocks.age".publicKeys = all;
}
