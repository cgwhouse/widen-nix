{ pkgs, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "cristian";
    homeDirectory = "/home/cristian";
  };

  home.packages = [
    pkgs.fastfetch
    pkgs.nixfmt
    pkgs.nixd
    pkgs.neovim
    pkgs.git-credential-manager
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "extract"
        "git"
        "sudo"
      ];
      theme = "eastwood";
    };

    shellAliases = {
      c = "clear && fastfetch";
      pkgup = "sudo nixos-rebuild switch --flake /home/cristian/repos/widen-nix#widen-nix";
    };

    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
      ignorePatterns = [
        "rm *"
        "pkill *"
        "cp *"
      ];
    };
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "Cristian Widenhouse";
      email = "cgwidenhouse@gmail.com";
    };
  };

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ];

    profiles.default.userSettings = {

      "files.autoSave" = "off";

    };
  };

  # Do not touch
  home.stateVersion = "25.11";
}
