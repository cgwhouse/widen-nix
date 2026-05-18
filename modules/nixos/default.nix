{ lib, ... }:

let
  isModule = name: type: type == "regular" && lib.hasSuffix ".nix" name && name != "default.nix";
  moduleNames = builtins.attrNames (lib.filterAttrs isModule (builtins.readDir ./.));
in
{
  imports = map (n: ./. + "/${n}") moduleNames;
}
