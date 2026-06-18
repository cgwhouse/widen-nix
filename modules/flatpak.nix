{
  services.flatpak.enable = true;

  #flatpak install flathub com.discordapp.Discord

  services.flatpak.packages = [
    #{ appId = "com.brave.Browser"; origin = "flathub";  }
    "com.discordapp.Discord"
    #"im.riot.Riot"
  ];
}
