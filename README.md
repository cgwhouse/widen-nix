# widen-nix

Rewritten because I've decided that my top priority is readability, and I'm willing to do things a little clunkier in pursuit of that goal.

_This config expects to be placed at $HOME/repos/widen-nix (see `vscode.nix` for more details). Open to suggestions on how to improve that._

Friendly reminder for whenever `secrets.nix` needs to be updated (probably due to adding a new host):

```sh
# Root / host key
cat /etc/ssh/ssh_host_ed25519_key.pub

# User key
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""
cat ~/.ssh/id_ed25519.pub
```

## TODO

- hardware acceleration
