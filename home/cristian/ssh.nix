{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks."*" = { };
    extraConfig = "SetEnv TERM=xterm-256color";

    # Personal host blocks
    includes = [ "/run/agenix/ssh-matchblocks" ];
  };
}
