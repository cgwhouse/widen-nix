# Recipient list for agenix. Each `.age` file lists the public keys that may
# decrypt it. Generate host keys after install:
#
#   ssh-keyscan -t ed25519 <host> | awk '{print $2 " " $3}'
#
# and your user key from `~/.ssh/id_ed25519.pub`. Then encrypt a secret with:
#
#   cd secrets && agenix -e foo.age
#
# and reference it from a NixOS module:
#
#   age.secrets.foo.file = ../secrets/foo.age;

let
  # Replace with your actual keys when you have them.
  cristian = "ssh-ed25519 AAAA_REPLACE_ME_user_key";
  widen-nix-vm = "ssh-ed25519 AAAA_REPLACE_ME_vm_host_key";

  users = [ cristian ];
  systems = [ widen-nix-vm ];
in
{
  # Example entry — uncomment and rename once you have a real secret:
  # "example.age".publicKeys = users ++ systems;
}
