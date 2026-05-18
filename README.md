# widen-nix

My NixOS config. Flakes + Home Manager + Dendritic pattern.

Due to reasons, this config expects to be placed at $HOME/repos/widen-nix (see `vscode.nix`)

## TODO

- Solidify new host setup instructions, full end-to-end test
- Fonts
- Finish remaining VS Code config
- Get a sense of dev environment / working with a repo
- Steam, Discord, Spotify
- steam second drive
- virt-manager
- more browser stuff, browser config
- hardware acceleration

## New Host Setup (WIP)

- Perform standard install
- Add git and openssh and rebuild, then clone this repo to the expected location:

  ```sh
  mkdir ~/repos/widen-nix
  git clone https://github.com/cgwhouse/widen-nix ~/repos/widen-nix
  ```

- Create a new directory under `hosts`, then copy `hardware-configuration.nix` into it:

  ```sh
  $HOSTNICKNAME=example

  mkdir ~/repos/widen-nix/hosts/$HOSTNICKNAME
  cp /etc/nixos/hardware-configuration.nix ~/repos/widen-nix/hosts/$HOSTNICKNAME/hardware.nix
  ```

- Copy `default.nix` from a pre-existing host and make any necessary edits (e.g. `networking.hostName`)

- Add a block to `modules/flake/hosts.nix`, should be able to copy everything and just change the name of the flake itself

- Temporarily remove `modules/nixos/agenix-secrets.nix`

- Rebuild, using the flake this time, and reboot after for good measure:

  ```sh
  # TODO: test this and put the correct command
  ```

- Restore `agenix-secrets.nix`

- Update `secrets.nix` with SSH public keys:

  ```sh
  # Root / host key
  cat /etc/ssh/ssh_host_ed25519_key.pub

  # User key
  ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""
  cat ~/.ssh/id_ed25519.pub
  ```

- Re-key secrets:

  ```sh
  agenix -r
  ```

- Commit everything and rebuild one more time with `pkgup`, then reboot again

- Run `pkgcl` so we are starting with our clean slate, then `nix-index`

### Provision agenix secrets (OLD)

Each secret needs **two recipients**: a _host_ identity so the system can decrypt at activation, and a _personal_ identity so you can decrypt for editing as your normal user. `age` accepts raw SSH pubkeys directly — no `ssh-to-age` conversion needed.

1. Make sure `services.openssh` has generated the host key (`/etc/ssh/ssh_host_ed25519_key{,.pub}` exist after first activation). Then read the pubkey:

   ```sh
   cat /etc/ssh/ssh_host_ed25519_key.pub
   ```

2. Generate a personal SSH key for cristian (if there isn't one) and grab its pubkey:

   ```sh
   ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""
   cat ~/.ssh/id_ed25519.pub
   ```

   `agenix -e` will pick this up automatically from `~/.ssh/id_ed25519` — no `-i` flag needed.

3. Paste both pubkeys into `secrets.nix` (at the repo root — agenix expects `./secrets.nix` in the cwd) as the `vm-host` and `cristian-vm` recipients, and add them to each `publicKeys` list. Commit.

4. From the repo root, create or edit each encrypted secret:

   ```sh
   nix run github:ryantm/agenix -- -e secrets/ssh-matchblocks.age
   ```

   Plaintext for `ssh-matchblocks.age` is an OpenSSH config snippet (`Host` / `HostName` / `User` / `IdentityFile` blocks).

5. Sanity-check that the host can decrypt before rebuilding:

   ```sh
   sudo nix shell nixpkgs#age -c age -d -i /etc/ssh/ssh_host_ed25519_key secrets/ssh-matchblocks.age
   ```

   Should print the plaintext. If it errors with "no identity matched any of the recipients", the host pubkey in `secrets.nix` doesn't match the current host key — re-copy and re-encrypt.

After committing the `.age` file and rebuilding, `/run/agenix/ssh-matchblocks` is populated on every boot and pulled into `~/.ssh/config` via `Include`. Day-to-day, `agenix -e <file>` works as cristian without sudo.

When you add another host: capture its host SSH pubkey and its editor's personal SSH pubkey, add both as recipients to whichever secrets that host should be able to use, then `agenix -r` to rekey.
