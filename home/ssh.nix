{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    # Personal host blocks
    includes = [ "/run/agenix/ssh-matchblocks" ];
  };
}
