{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-size = 13.0;
      background-opacity = 0.9;
      shell-integration-features = "sudo";
    };
  };

  # Plasma: set default terminal application + shortcut
  programs.plasma = {
    configFile.kdeglobals.General = {
      TerminalService = "com.mitchellh.ghostty.desktop";
      TerminalApplication = "ghostty";
    };

    shortcuts = {
      "services/com.mitchellh.ghostty.desktop"."_launch" = "Meta+Return";
    };
  };
}
