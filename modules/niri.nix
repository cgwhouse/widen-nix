{
  programs = {
    niri.enable = true;
    dux-shell.enable = true;
  };

  services.displayManager.dux-greeter = {
    enable = true;
    compositor.name = "niri";
  };
}
