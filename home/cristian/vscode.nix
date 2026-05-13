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
        # General
        "explorer.confirmDragAndDrop" = false;

        # Nix Meta
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.serverSettings" = {
          nixd.formatting.command = [ "nixfmt" ];
        };

        # Theming bits (applied by catppuccin.nix global enable)
        "window.titleBarStyle" = "custom";
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "catppuccin-mocha";
        "catppuccin.accentColor" = "green";
        "editor.semanticHighlighting.enabled" = true;
        "terminal.integrated.minimumContrastRatio" = 1;

        # Neovim extension
        "extensions.experimental.affinity" = {
          "asvetliakov.vscode-neovim" = 1;
        };

        "vscode-neovim.compositeKeys" = {
          "jk" = {
            "command" = "vscode-neovim.escape";
          };
        };

        # Mostly preserve regular VS Code shortcuts
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
