{ lib, ... }:

let
  picture = ../assets/profile.png;
in
lib.optionalAttrs (builtins.pathExists picture) {
  home.file.".face".source = picture;
}
