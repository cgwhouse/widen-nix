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
      theme = "eastwood";

    initContent = ''
fastfetch
    '';
    };

    shellAliases = {
      c = "clear && fastfetch";

      pkgsy = "nix flake update";
      pkgup = "nh os switch .";
      pkgcl = "nh clean all";
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
}
