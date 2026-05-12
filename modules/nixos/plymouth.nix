{
  # Catppuccin's NixOS module ships a Plymouth theme. The flavor here is
  # local to the plymouth submodule; the SDDM/HM scopes set their own.
  catppuccin.plymouth = {
    enable = true;
    flavor = "mocha";
  };

  boot = {
    plymouth.enable = true;

    # Quiet the verbose console output during boot so Plymouth gets the screen.
    # No effect on the VM beyond a slightly cleaner console.
    kernelParams = [
      "quiet"
      "splash"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };
}
