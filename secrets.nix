# Recipient list for `agenix -e`. Plaintext — safe to commit.
# Replace the placeholders with real age pubkeys before editing any .age file.
#
# vm-host:      run on the VM: nix run nixpkgs#ssh-to-age -- < /etc/ssh/ssh_host_ed25519_key.pub
# cristian-dev: run on this dev host:
#                 mkdir -p ~/.config/age
#                 nix run nixpkgs#age -- -k > ~/.config/age/keys.txt
#                 nix run nixpkgs#age -- -y ~/.config/age/keys.txt
let
  vm-host = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAeDRamBXD78beSvm0KTKSoOaqHUu54qMw+SFusmUb38 root@widen-nix-vm";

  all = [ vm-host ];
in
{
  "secrets/ssh-matchblocks.age".publicKeys = all;
}
