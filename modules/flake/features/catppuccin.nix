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

    # Harmless / does nothing if SDDM not enabled
    catppuccin.sddm = {
      enable = true;
      clockEnabled = false;
      inherit (theme) flavor accent;
    };

    catppuccin.plymouth = {
      enable = true;
      inherit (theme) flavor;
    };
  };

  flake.homeModules.catppuccin =
    { pkgs, ... }:

    {
      imports = [ inputs.catppuccin.homeModules.catppuccin ];

      catppuccin = {
        enable = true;
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
