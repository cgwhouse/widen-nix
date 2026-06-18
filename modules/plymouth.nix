{
  boot = {
    plymouth.enable = true;
    consoleLogLevel = 0;
    initrd.verbose = false;

    # Let plymouth start as early as possible
    initrd.systemd.enable = true;

    kernelParams = [
      "quiet"
      "splash"
      "udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];
  };
}

