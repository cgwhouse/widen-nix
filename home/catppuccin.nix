{ inputs, pkgs, ... }:

{
  imports = [ inputs.catppuccin.homeModules.catppuccin ];

  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "mocha";
    accent = "green";

    # Sets home.pointerCursor (name + package) to the catppuccin cursor,
    # niri reads the theme name from there
    cursors.enable = true;
  };

  # pointerCursor.size has no default
  home.pointerCursor.size = 24;

  home.packages = with pkgs; [
    (catppuccin-kde.override {
      flavour = [ "mocha" ];
      accents = [ "green" ];
    })
  ];
}
