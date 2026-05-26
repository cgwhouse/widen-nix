{
  virtualisation.docker = {
    enable = true;

    daemon.settings = {
      # Log rotation
      "log-driver" = "json-file";
      "log-opts" = {
        "max-size" = "10m";
        "max-file" = "3";
      };
    };
  };
}
