# widen-nix

My NixOS config. Flakes + Home Manager + Dendritic pattern.

Due to reasons, this config expects to be placed at $HOME/repos/widen-nix (see `vscode.nix`)

## TODO

- Get a sense of dev environment / working with a repo
- Chromium
- hardware acceleration

## New Host Setup

- Perform a standard NixOS install

- Add `git` and `vim` to the system config, rebuild, then clone this repo to the expected location:

  ```sh
  mkdir -p ~/repos/widen-nix
  git clone https://github.com/cgwhouse/widen-nix ~/repos/widen-nix
  ```

- Create and check out a new branch

- Pick a host nickname and scaffold its directory under `hosts/`, copying in `hardware-configuration.nix`:

  ```sh
  HOSTNICKNAME=example
  mkdir ~/repos/widen-nix/hosts/$HOSTNICKNAME
  cp /etc/nixos/hardware-configuration.nix ~/repos/widen-nix/hosts/$HOSTNICKNAME/hardware.nix
  ```

- Copy `default.nix` from a pre-existing host and make any necessary edits (e.g. `networking.hostName`)

- Add a new block to `modules/flake/hosts.nix`

- Stage and commit the changes so far, then temporarily remove `modules/nixos/agenix-secrets.nix`

- Rebuild using the flake, then reboot for good measure:

  ```sh
  sudo nixos-rebuild switch --flake .#$HOSTNICKNAME
  sudo reboot
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

- Push the branch to the remote

- On a machine that's already authorized, pull the branch and re-key secrets to include the new host:

  ```sh
  agenix -r
  ```

- Commit and push, then back on the new host pull the changes and rebuild once more with `pkgup`, followed by another reboot

- Run `pkgcl` to start from a clean slate, then `nix-index`
