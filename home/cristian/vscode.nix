{
  pkgs,
  osConfig,
  inputs,
  ...
}:

let
  # Path to the widen-nix repo, relative to $HOME
  # NOTE: This does require that this repo be at a well-known path
  widenNixPath = "repos/widen-nix";

  # Extensions not in nixpkgs, pulled from the VS Code Marketplace
  marketplace =
    inputs.nix-vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace;
in
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Nix Meta
        jnoortheen.nix-ide
        christian-kohler.path-intellisense

        # General
        asvetliakov.vscode-neovim
        jgclark.vscode-todo-highlight
        streetsidesoftware.code-spell-checker
        esbenp.prettier-vscode
        anthropic.claude-code
        eamodio.gitlens

        # .NET
        ms-dotnettools.csdevkit
        ms-dotnettools.csharp
        ms-dotnettools.vscode-dotnet-runtime
        csharpier.csharpier-vscode

        # Python
        ms-python.python
        ms-python.black-formatter
        ms-python.isort

        # Markup
        yzhang.markdown-all-in-one
        davidanson.vscode-markdownlint
        yzane.markdown-pdf
        redhat.vscode-xml
        redhat.vscode-yaml

        # Containers
        ms-azuretools.vscode-docker
        ms-azuretools.vscode-containers

        # Need to get these two from the flake instead
        marketplace.cvbge.escape-string
        marketplace.ms-azure-devops.azure-pipelines
      ];

      userSettings = {
        # General
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmDelete" = false;
        "telemetry.telemetryLevel" = "off";
        "terminal.integrated.initialHint" = false;

        # Disable Copilot
        "github.copilot.enable" = {
          "*" = false;
          "plaintext" = false;
          "markdown" = false;
          "scminput" = false;
        };

        # Nix Meta
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.serverSettings" = {
          nixd.formatting.command = [ "nixfmt" ];
        };

        # Fonts
        "editor.fontSize" = 15;
        "editor.fontLigatures" = true;
        "editor.fontFamily" = "FiraCode Nerd Font";

        # Theming bits (applied by catppuccin.nix global enable)
        "window.titleBarStyle" = "custom";
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "catppuccin-mocha";
        "catppuccin.accentColor" = "green";
        "editor.semanticHighlighting.enabled" = true;
        "terminal.integrated.minimumContrastRatio" = 1;

        # TODO Highlight
        "todohighlight.keywords" = [
          {
            "text" = "NOTE:";
            "backgroundColor" = "green";
            "color" = "white";
          }
          {
            "text" = "XXX:";
            "backgroundColor" = "blue";
            "color" = "white";
          }
        ];

        # Python stuff
        "[python]" = {
          "editor.defaultFormatter" = "ms-python.black-formatter";
          "editor.codeActionsOnSave" = {
            "source.organizeImports" = "explicit";
          };
        };
        "isort.args" = [
          "--profile"
          "black"
        ];

        # Other formatter defaults
        "[json]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };

        "[jsonc]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };

        "[markdown]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
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

        # Global Dictionary
        "cSpell.userWords" = [
          "Cristian"
          "Widenhouse"
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
        options.home-manager.expr = ''(builtins.getFlake "''${workspaceFolder}").nixosConfigurations.${osConfig.networking.hostName}.options.home-manager.users.type.getSubOptions [ ]'';
      };
    };

    "cSpell.enabled" = false;
  };
}
