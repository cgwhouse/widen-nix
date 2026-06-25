{ ... }:

{
  programs.chromium = {
    enable = true;

    
    extensions = [
# uBlock Origin Lite
      "ddkjiahejlhfcafbddmgiahcphecmpfh" 
# Privacy Badger
      "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" 
# Bitwarden
      "nngceckbapebfimnlniiiahkandclblb" 
# floccus
      "fnaicdffflnofjppbagibeoednhnbjhg" 
# SponsorBlock
      "mnjggcdmjocbbbhaepdhchncahnbgone" 
# DeArrow
      "enamippconapkdmgfgjchkhakpfinmaj" 
# BetterTTV
      "ajopnjidmegmdimjlfnijceegpefgped" 
    ];

    defaultSearchProviderEnabled = true;
    defaultSearchProviderSearchURL = "https://www.startpage.com/do/search?query={searchTerms}";

    extraOpts = {
      "DefaultSearchProviderName" = "Startpage";

      # Telemetry / data collection off
      "MetricsReportingEnabled" = false;
      "UrlKeyedAnonymizedDataCollectionEnabled" = false;
      "SpellCheckServiceEnabled" = false;
      "SearchSuggestEnabled" = false;

      "PasswordManagerEnabled" = false;
      "AutofillAddressEnabled" = false;
      "AutofillCreditCardEnabled" = false;

      # Disable more Google stuff
      "BrowserSignin" = 0;
      "SyncDisabled" = true;
      "SafeBrowsingProtectionLevel" = 0;

# Simple homepage
      "NewTabPageLocation" = "about:blank";
      "DefaultBrowserSettingEnabled" = false;
      "PromotionalTabsEnabled" = false;
      "BackgroundModeEnabled" = false;
    };
  };
}
