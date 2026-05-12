{
  # When a command isn't on PATH, suggest the nixpkgs attribute that provides it
  # instead of the default "command not found" message.
  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.command-not-found.enable = false;
}
