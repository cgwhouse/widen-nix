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

  programs.plasma = {
    # enable = true;

    # Set default terminal application
    configFile.kdeglobals.General = {
      TerminalService = "com.mitchellh.ghostty.desktop";
      TerminalApplication = "ghostty";
    };

    shortcuts = {
      "services/com.mitchellh.ghostty.desktop"."_launch" = "Meta+Return";
    };
  };
}
