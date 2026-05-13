{
  # Declarative ~/.ssh/config. Hostnames, addresses, and IdentityFile *paths*
  # live here in git; the private keys themselves are copied manually during
  # provisioning (see README).
  programs.ssh = {
    enable = true;

    matchBlocks = {
      # TODO: replace with real entries when migrating from existing ~/.ssh/config.
      # "server-1" = {
      #   hostname = "1.2.3.4";
      #   user = "cristian";
      #   identityFile = "~/.ssh/id_server-1";
      # };
    };
  };
}
