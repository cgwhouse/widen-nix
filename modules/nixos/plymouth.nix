{
  boot = {
    plymouth.enable = true;
    consoleLogLevel = 0;
    initrd.verbose = false;

    # systemd-in-initrd lets plymouth start as early as possible,
    # before any kernel/initrd text would flash on screen.
    initrd.systemd.enable = true;

    kernelParams = [
      "quiet"
      "splash"
      "udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];
  };
}
