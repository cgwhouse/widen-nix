{ inputs, pkgs, ... }:

let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
  programs.firefox = {
    enable = true;

    profiles.cristian = {
      id = 0;
      isDefault = true;

      extensions.packages = with addons; [
        ublock-origin
        privacy-badger
        bitwarden
        floccus
        sponsorblock
        dearrow
        betterttv
        canvasblocker
      ];

      search = {
        force = true;
        default = "Startpage";
        engines.Startpage = {
          urls = [ { template = "https://www.startpage.com/do/search?query={searchTerms}"; } ];
          definedAliases = [ "@sp" ];
        };
      };

      settings = {
        "media.eme.enabled" = true;
        "media.gmp-widevinecdm.enabled" = true;

        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showWeather" = false;

        "extensions.pocket.enabled" = false;

        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.server" = "";
        "app.shield.optoutstudies.enabled" = false;
        "browser.discovery.enabled" = false;

        "signon.rememberSignons" = false;
        "signon.autofillForms" = false;
      };
    };
  };
}
