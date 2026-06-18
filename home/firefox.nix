{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.cristian = {
      id = 0;
      isDefault = true;

      extensions = {
        force = true;

        # See repo linked in flake.nix to figure out how these are named
        packages = with pkgs.firefox-addons; [
          ublock-origin
          privacy-badger
          bitwarden
          floccus
          sponsorblock
          dearrow
          betterttv
          canvasblocker
        ];
      };

      # Default to StartPage for search
      search = {
        force = true;
        default = "Startpage";
        engines.Startpage = {
          urls = [ { template = "https://www.startpage.com/do/search?query={searchTerms}"; } ];
          definedAliases = [ "@sp" ];
        };
      };

      settings = {
        # DRM
        "media.eme.enabled" = true;
        "media.gmp-widevinecdm.enabled" = true;

        # Simple homepage
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showWeather" = false;

        # Disable Pocket + Telemetry
        "extensions.pocket.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.server" = "";
        "app.shield.optoutstudies.enabled" = false;
        "browser.discovery.enabled" = false;

        # Disable built-in password manager
        "signon.rememberSignons" = false;
        "signon.autofillForms" = false;
      };
    };
  };
}
