{
  services = {
    # KDE
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    # Disable X11
    xserver.enable = false;
  };

  # Force locale into SDDM so the greeter clock uses 12-hour format
  systemd.services.display-manager.environment = {
    LANG = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
}
