{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Cristian Widenhouse";
        email = "cgwidenhouse@gmail.com";
      };

      # Needed for git-credential-manager
      credential = {
        credentialStore = "cache";
        helper = "manager";
        "https://github.com".username = "cgwhouse";
      };
    };
  };
}
