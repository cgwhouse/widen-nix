{
  # Better error message when a command isn't on PATH
  programs = {
    nix-index = {
      enable = true;
      enableZshIntegration = true;
    };

    command-not-found.enable = false;
  };
}
