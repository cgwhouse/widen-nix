{
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
    };

# Run fastfetch when a new shell starts
    initContent = ''
      fastfetch
    '';

    shellAliases = {
      c = "clear && fastfetch";

      pkgsy = "nix flake update";
      pkgup = "nh os switch .";
      pkgcl = "nh clean all";
    };

    # Suggested from NixOS wiki
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
}
