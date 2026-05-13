{
  boot = {
    plymouth.enable = true;
    consoleLogLevel = 0;
    initrd.verbose = false;

    kernelParams = [
      "quiet"
      "splash"
      "udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];
  };
}
