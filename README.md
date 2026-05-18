# widen-nix

My NixOS config. Flakes + Home Manager + Dendritic pattern.

Due to reasons, this config expects to be placed at $HOME/repos/widen-nix (see `vscode.nix`)

## TODO

- Fonts
- Finish remaining VS Code config
- Get a sense of dev environment / working with a repo
- Steam, Discord, Spotify
- steam second drive
- virt-manager
- more browser stuff, browser config
- hardware acceleration

## New Host Setup

- Perform standard install

- Add git and rebuild, then clone this repo to the expected location:

  ```sh
  mkdir -p ~/repos/widen-nix
  git clone https://github.com/cgwhouse/widen-nix ~/repos/widen-nix
  ```

- Create a new branch and switch to it

- Create a new directory under `hosts`, then copy `hardware-configuration.nix` into it:

  ```sh
  HOSTNICKNAME=example
  ```

  ```sh
  mkdir ~/repos/widen-nix/hosts/$HOSTNICKNAME
  cp /etc/nixos/hardware-configuration.nix ~/repos/widen-nix/hosts/$HOSTNICKNAME/hardware.nix
  ```

- Copy `default.nix` from a pre-existing host and make any necessary edits (e.g. `networking.hostName`)

- Add a new block to `modules/flake/hosts.nix`

- Stage / commit all of these changes so far, then temporarily remove `modules/nixos/agenix-secrets.nix`

- Rebuild using the flake this time, and reboot after for good measure:

  ```sh
  sudo nixos-rebuild switch --flake .#<NAME_OF_FLAKE>
  ```

- Restore `agenix-secrets.nix`

- Update `secrets.nix` with the new host's SSH public keys:

  ```sh
  # Root / host key
  cat /etc/ssh/ssh_host_ed25519_key.pub

  # User key
  ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""
  cat ~/.ssh/id_ed25519.pub
  ```

- Push all of these changes to the remote

- Pull down this branch onto a machine that already has authorization, then re-key secrets to include the newly created host in addition:

  ```sh
  agenix -r
  ```

- Commit everything, pull everything back down to the new machine, and rebuild one more time with `pkgup`. Then, reboot again

- Run `pkgcl` so we are starting with our clean slate, then `nix-index`
