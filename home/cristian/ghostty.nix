{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      font-size = 13.0;
      background-opacity = 0.9;
      theme = "Catppuccin Mocha";
      shell-integration-features = "sudo";
    };
  };
}
