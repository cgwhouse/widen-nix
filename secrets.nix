# Recipient list for `agenix -e`. Plaintext — safe to commit.
# Replace the placeholders with real age pubkeys before editing any .age file.
#
# vm-host:      run on the VM: nix run nixpkgs#ssh-to-age -- < /etc/ssh/ssh_host_ed25519_key.pub
# cristian-dev: run on this dev host:
#                 mkdir -p ~/.config/age
#                 nix run nixpkgs#age -- -k > ~/.config/age/keys.txt
#                 nix run nixpkgs#age -- -y ~/.config/age/keys.txt
let
  vm-host = "age1ugya9nzencd7vsdq0k6vmufp4an9n0j3ddvfchqfsdvptm5x9qks4lg2xe";
  vm-personal = "age1gqw7ul3wwnexj20ah7yt8ydqd76r4anen3wm6z6nj6ga7yrr2dnq3jknz7";

  all = [
    vm-host
    vm-personal
  ];
in
{
  "secrets/ssh-matchblocks.age".publicKeys = all;
}
