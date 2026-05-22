{
  home.packages = [ pkgs.git-credential-manager ];

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Cristian Widenhouse";
        email = "cgwidenhouse@gmail.com";
      };

      # Needed for git-credential-manager
      credential = {
        credentialStore = "secretservice";
        helper = "manager";
        "https://github.com".username = "cgwhouse";
      };
    };
  };
}
