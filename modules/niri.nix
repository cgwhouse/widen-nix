{
programs = {
niri.enable = true;
dms-shell.enable = true;
};

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
  };
}
