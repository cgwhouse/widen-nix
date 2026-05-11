{ pkgs, osConfig, ... }:

let
  # Path to the widen-nix repo, relative to $HOME
  # NOTE: This does require that this repo be at a well-known path, but this
  # is standard convention for me, so will do it to satisfy VS Code
  widenNixPath = "repos/widen-nix";
in
{
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        christian-kohler.path-intellisense
        asvetliakov.vscode-neovim
      ];

      userSettings = {
        # Nix Meta
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.serverSettings" = {
          nixd.formatting.command = [ "nixfmt" ];
        };

        # Neovim extension
        "extensions.experimental.affinity" = {
          "asvetliakov.vscode-neovim" = 1;
        };
        "vscode-neovim.compositeKeys" = {
          "jk" = {
            "command" = "vscode-neovim.escape";
          };
        };
        # Defaults minus c/e/k so VS Code's Ctrl+C copy, Ctrl+E quick open,
        # and Ctrl+K chord prefix aren't intercepted by the extension.
        # Review on extension upgrades — these replace defaults wholesale.
        "vscode-neovim.ctrlKeysForInsertMode" = [
          "a"
          "d"
          "h"
          "j"
          "m"
          "o"
          "r"
          "t"
          "u"
          "w"
        ];
        "vscode-neovim.ctrlKeysForNormalMode" = [
          "a"
          "b"
          "d"
          "f"
          "h"
          "i"
          "j"
          "l"
          "m"
          "o"
          "r"
          "t"
          "u"
          "v"
          "w"
          "x"
          "y"
          "z"
          "/"
          "]"
          "right"
          "left"
          "up"
          "down"
          "backspace"
          "delete"
        ];
      };
    };
  };

  # Workspace-scoped VS Code settings for this repo. Note that there is a bit
  # of duplication compared to the user-scoped settings above, to prevent VS Code
  # from clobbering the user settings with the workspace settings
  home.file."${widenNixPath}/.vscode/settings.json".text = builtins.toJSON {
    "nix.serverSettings" = {
      nixd = {
        formatting.command = [ "nixfmt" ];
        options.nixos.expr = ''(builtins.getFlake "''${workspaceFolder}").nixosConfigurations.${osConfig.networking.hostName}.options'';
      };
    };
  };
}
