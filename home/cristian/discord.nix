{ lib, pkgs, ... }:

{
  home.packages = [ pkgs.discord ];

  # Persist whatever Discord decides to put into settings.json,
  # but make sure the skip update thing is included
  home.activation.discordSkipHostUpdate = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    settings="$HOME/.config/discord/settings.json"
    mkdir -p "$(dirname "$settings")"
    if [ -f "$settings" ]; then
      ${pkgs.jq}/bin/jq '. + {SKIP_HOST_UPDATE: true}' "$settings" > "$settings.tmp" \
        && mv "$settings.tmp" "$settings"
    else
      echo '{"SKIP_HOST_UPDATE": true}' > "$settings"
    fi
  '';
}
