{
  services = {
    # KDE
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    # Disable X11, printing
    xserver.enable = false;
    printing.enable = false;
  };
}
