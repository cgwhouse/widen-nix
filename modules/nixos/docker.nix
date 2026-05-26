{
  virtualisation.docker = {
    enable = true;


daemon.settings = 
{
  "log-driver" = "json-file";

  "log-opts" = {
    "max-size"= "10m";
    "max-file" = "3";
  };
};
    # daemon.settings = {
    #   pruning = {
    #     enabled = true;
    #     interval = "24h";
    #   };
    # };
  };
}
