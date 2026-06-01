{ inputs, ... }:

let
  theme = {
    flavor = "mocha";
    accent = "green";
  };
in
{
  flake.nixosModules.catppuccin = {
    imports = [ inputs.catppuccin.nixosModules.catppuccin ];

    catppuccin = {
      enable = true;
      autoEnable = true;
      cache.enable = true;
      inherit (theme) flavor accent;
    };

    # Disabled because the clock is 24hr format and I don't like it
    catppuccin.sddm.clockEnabled = false;
  };

  flake.homeModules.catppuccin =
    { pkgs, ... }:

    {
      imports = [ inputs.catppuccin.homeModules.catppuccin ];

      catppuccin = {
        enable = true;
        autoEnable = true;
        inherit (theme) flavor accent;

        # Sets home.pointerCursor (name + package) to the catppuccin cursor,
        # niri reads the theme name from there
        cursors.enable = true;
      };

      # pointerCursor.size has no default
      home.pointerCursor.size = 24;

      home.packages = with pkgs; [
        (catppuccin-kde.override {
          flavour = [ theme.flavor ];
          accents = [ theme.accent ];
        })
      ];
    };
}
