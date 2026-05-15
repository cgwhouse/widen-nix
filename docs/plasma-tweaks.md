# Tweaking KDE Plasma settings

Workflow for translating a UI toggle in KDE System Settings into the right
`programs.plasma.*` option in this repo.

## The loop

1. **Make the change in the UI.** Open System Settings on the VM, flip the toggle,
   confirm it works the way you want.

2. **Run `rc2nix`** to get the Nix equivalent:
   ```sh
   nix run github:nix-community/plasma-manager -- rc2nix
   ```
   It reads your current `~/.config/{plasmarc,plasma-org.kde.plasma.desktop-appletsrc,kdeglobals,kwinrc,kscreenlockerrc,powermanagementprofilesrc,...}` and prints an equivalent `programs.plasma.*` snippet to stdout.

   To isolate just what your UI change touched, run `rc2nix` once before and
   once after, then diff:
   ```sh
   nix run github:nix-community/plasma-manager -- rc2nix > /tmp/before.nix
   # ... make UI change ...
   nix run github:nix-community/plasma-manager -- rc2nix > /tmp/after.nix
   diff /tmp/before.nix /tmp/after.nix
   ```

3. **Prefer high-level options** over what `rc2nix` spits out. plasma-manager
   has typed wrappers for common areas — `powerdevil`, `kscreenlocker`,
   `shortcuts`, `workspace`, `panels`, `input.*`, `session.*`, etc. Check
   <https://github.com/nix-community/plasma-manager/tree/trunk/modules> for the
   current list; if your setting is covered there, use the typed option
   instead of the raw `configFile` form. The typed options compose better and
   survive plasma-manager upgrades.

4. **Fall back to `configFile`** for anything not yet wrapped:
   ```nix
   programs.plasma.configFile.<filename>.<group>.<key> = "value";
   ```
   This writes directly to `~/.config/<filename>` — same effect as what
   `rc2nix` produces.

5. **Drop the snippet** into the right home-manager file. Feature-first:
   - power/lock/idle → [home/cristian/plasma.nix](../home/cristian/plasma.nix)
   - shortcuts → same file
   - a brand-new topic area large enough to deserve its own file → new
     `home/cristian/plasma-<topic>.nix`

6. **Rebuild and verify** — the UI should now reflect the Nix-managed value
   even after a logout/login or `rm -rf ~/.config/plasma*`.

## Notes

- Leave `programs.plasma.overrideConfig` at its default (`false`) while
  iterating. With override on, plasma-manager fully owns the listed files and
  blows away anything you set in the UI — which means `rc2nix` has nothing to
  diff from.
- Once you've locked in a configuration and don't want UI drift, flip
  `overrideConfig = true;` so the Nix snippet is the source of truth.
- For settings that *only* show up in `~/.config/<file>` after you change them
  in the UI (some Plasma defaults are implicit), make the change first then
  inspect the file — the key may not exist until you've touched it once.
