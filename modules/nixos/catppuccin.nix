{ config, lib, ... }:

{
  catppuccin.sddm = {
    enable = true;
    flavor = "mocha";
    accent = "green";
    clockEnabled = false;
  };

  catppuccin.plymouth = {
    enable = true;
    flavor = "mocha";
  };

  # Upstream catppuccin/nix bug: the `.plymouth` files ship with a hardcoded
  # ImageDir=/usr/share/... which doesn't exist on NixOS.
  # Patch the installed files post-build to point at $out.
  # boot.plymouth.themePackages = lib.mkForce [
  #   (config.catppuccin.sources.plymouth.overrideAttrs (old: {
  #     postInstall = (old.postInstall or "") + ''
  #       for d in "$out"/share/plymouth/themes/*/; do
  #         name=$(basename "$d")
  #         substituteInPlace "$d$name.plymouth" \
  #           --replace-fail '/usr/share/plymouth/themes' "$out/share/plymouth/themes"
  #       done
  #     '';
  #   }))
  # ];
}
