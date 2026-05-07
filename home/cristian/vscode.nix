{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
      ];

      # TODO: build out userSettings
      userSettings = {
        "files.autoSave" = "off";
      };
    };
  };
}
