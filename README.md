# widen-nix

My NixOS config

## Fresh install bootstrap

Steps to run once on a freshly-installed host (after `nixos-install` and first boot). The flake builds and activates without any of these, but a few subsystems need a one-time manual nudge before they're fully usable.

### 1. Build the `nix-index` database

`nix-index` powers `command-not-found` lookups and similar. The database is not built on activation — it has to be populated manually:

```sh
nix-index
```

This takes a few minutes the first time and pulls a lot. No scheduled refresh is wired up; re-run after major channel bumps.

### 2. Provision agenix secrets

`services.openssh` generates `/etc/ssh/ssh_host_ed25519_key{,.pub}` on first activation. agenix uses that SSH key as the host's identity, and `age` accepts the raw SSH pubkey directly as a recipient — no `ssh-to-age` conversion needed.

1. Read the host's SSH pubkey:

   ```sh
   cat /etc/ssh/ssh_host_ed25519_key.pub
   ```

   The value looks like `ssh-ed25519 AAAAC3Nz... root@widen-nix-vm`.

2. Paste it into `secrets.nix` (at the repo root — agenix expects `./secrets.nix` in the cwd when you run `agenix -e`) as the `vm-host` recipient, then commit.

3. From the repo root, create or edit each encrypted secret:

   ```sh
   nix run github:ryantm/agenix -- -e secrets/ssh-matchblocks.age
   ```

   Plaintext for `ssh-matchblocks.age` is an OpenSSH config snippet (`Host` / `HostName` / `User` / `IdentityFile` blocks).

4. Sanity-check that the host can decrypt before rebuilding:

   ```sh
   sudo nix shell nixpkgs#age -c age -d -i /etc/ssh/ssh_host_ed25519_key secrets/ssh-matchblocks.age
   ```

   Should print the plaintext. If it errors with "no identity matched any of the recipients", the recipient in `secrets.nix` doesn't match the current host key — re-copy the pubkey and re-encrypt.

After committing the `.age` file and rebuilding, `/run/agenix/ssh-matchblocks` is populated on every boot and pulled into `~/.ssh/config` via `Include`.

### 3. Drop in a profile picture (optional)

Place a square PNG at `home/cristian/assets/profile.png` and rebuild. `~/.face` gets symlinked automatically; SDDM and KDE will pick it up.

## TODO

- Finish VS Code config
- Get a sense of dev environment / working with a repo
- Steam, Discord, Spotify
- virt-manager
- browser config
- hardware acceleration
- DRM on Chromium
