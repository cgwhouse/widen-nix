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

    # Harmless / does nothing if SDDM not enabled, i.e. when using Niri + greetd instead
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

        # Sets home.pointerCursor (name + package) to the catppuccin cursor.
        # niri reads the theme name from there in desktop/niri/home.nix.
        cursors.enable = true;
      };

      # home.pointerCursor.size has no default; set one so GTK/niri agree.
      home.pointerCursor.size = 24;

      home.packages = [
        (pkgs.catppuccin-kde.override {
          flavour = [ theme.flavor ];
          accents = [ theme.accent ];
        })
      ];
    };
}
