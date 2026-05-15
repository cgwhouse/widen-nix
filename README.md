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

### 2. Generate the host's age identity and provision agenix secrets

`services.openssh` generates `/etc/ssh/ssh_host_ed25519_key{,.pub}` on first activation. agenix reuses that key as the host's age identity, so once the file exists you can:

1. Derive the host's age pubkey:

   ```sh
   nix run nixpkgs#ssh-to-age -- < /etc/ssh/ssh_host_ed25519_key.pub
   ```

2. On your dev machine, generate a personal age key for *editing* secrets (`age-keygen` lives inside the `age` package, so use `nix shell ... -c` rather than `nix run`):

   ```sh
   mkdir -p ~/.config/age
   nix shell nixpkgs#age -c age-keygen -o ~/.config/age/keys.txt
   nix shell nixpkgs#age -c age-keygen -y ~/.config/age/keys.txt    # prints the pubkey
   ```

3. Paste both pubkeys into `secrets.nix` (at the repo root — agenix expects `./secrets.nix` in the cwd when you run `agenix -e`) and commit.
4. From the repo root, create or edit each encrypted secret:

   ```sh
   nix run github:ryantm/agenix -- -e secrets/ssh-matchblocks.age
   ```

   Plaintext for `ssh-matchblocks.age` is an OpenSSH config snippet (`Host` / `HostName` / `User` / `IdentityFile` blocks).

After committing the `.age` file and rebuilding, `/run/agenix/ssh-matchblocks` will be populated on every boot and pulled into `~/.ssh/config` via `Include`.

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
