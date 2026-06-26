{ inputs, pkgs, ... }:

{
  imports = [ inputs.catppuccin.homeModules.catppuccin ];

  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "mocha";
    accent = "green";

    # Disabled by default for some reason
    cursors.enable = true;
  };

  # pointerCursor.size has no default
  home.pointerCursor.size = 24;


}
