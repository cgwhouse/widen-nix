{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "widenbot-droplet" = {
        hostname = "167.99.153.95";
        user = "root";
        identityFile = "~/.ssh/id_widenbot_droplet";
      };

      "buddha-pi5" = {
        hostname = "192.168.50.244";
        user = "root";
        identityFile = "~/.ssh/id_buddha_pi5";
      };

      "*" = { };
    };

    extraConfig = "SetEnv TERM=xterm-256color";
  };
}
