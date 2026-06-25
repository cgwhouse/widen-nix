{ pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    package = pkgs.chromium.override { enableWideVine = true; };

    commandLineArgs = [
      "--ozone-platform-hint=auto"
      "--password-store=basic"
    ];
  };

  # See modules/chromium.nix for everything else
}
