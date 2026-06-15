{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      font-family = "FiraCode Nerd Font";
      font-size = 13.0;
      background-opacity = 0.9;
      shell-integration-features = "sudo,ssh-env";
    };
  };
}
