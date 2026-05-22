{ lib, inputs, ... }:

let
  theme = {
    flavor = "mocha";
    accent = "green";
  };

  cap = s: (lib.toUpper (builtins.substring 0 1 s)) + (builtins.substring 1 (-1) s);
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
      };

      home.packages = [
        (pkgs.catppuccin-kde.override {
          flavour = [ theme.flavor ];
          accents = [ theme.accent ];
        })

        pkgs.catppuccin-cursors."${theme.flavor}${cap theme.accent}"
      ];
    };
}
