# Recipient list for `agenix -e`. Plaintext — safe to commit.
# Replace the placeholders with real age pubkeys before editing any .age file.
#
# vm-host:      run on the VM: nix run nixpkgs#ssh-to-age -- < /etc/ssh/ssh_host_ed25519_key.pub
# cristian-dev: run on this dev host:
#                 mkdir -p ~/.config/age
#                 nix run nixpkgs#age -- -k > ~/.config/age/keys.txt
#                 nix run nixpkgs#age -- -y ~/.config/age/keys.txt
let
  vm-host = "age1REPLACEME_vm_host_pubkey";
  cristian-dev = "age1REPLACEME_personal_pubkey";

  all = [
    vm-host
    cristian-dev
  ];
in
{
  "ssh-matchblocks.age".publicKeys = all;
}
