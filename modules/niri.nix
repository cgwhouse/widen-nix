{ options, pkgs, ... }:

{
  programs = {
    niri = {
      enable = true;

      # Temp workaround for libdisplay-info dependency issue
      package = options.programs.niri.package.default.override {
        libdisplay-info = pkgs.libdisplay-info.overrideAttrs (finalAttrs: {
          version = "0.3.0";
          src = pkgs.fetchFromGitLab {
            domain = "gitlab.freedesktop.org";
            owner = "emersion";
            repo = "libdisplay-info";
            rev = finalAttrs.version;
            hash = "sha256-nXf2KGovNKvcchlHlzKBkAOeySMJXgxMpbi5z9gLrdc=";
          };
        });
      };
    };

    dms-shell.enable = true;
  };

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
  };
}
