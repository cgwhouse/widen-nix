{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks."*" = { };

    # Personal host blocks live in an agenix-encrypted file. The decrypted
    # plaintext is an OpenSSH config snippet at the path below; modern
    # OpenSSH silently skips a missing Include, so this is safe pre-bootstrap.
    includes = [ "/run/agenix/ssh-matchblocks" ];

    extraConfig = "SetEnv TERM=xterm-256color";
  };
}
