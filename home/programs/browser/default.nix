{
  pkgs,
  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableFirefoxScreenshots = true;
        DisableFirefoxAccounts = true;
        PasswordManagerEnabled = false;
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never";
        DisplayMenuBar = "default-off";
        SearchBar = "unified";
      };
    };

    profiles = {
      quartix = {
        name = "quartix";
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          sponsorblock
          ublock-origin
          simple-translate
          languagetool
        ];

        search = {
          force = true;
          default = "DuckDuckGo";
        };

        settings = {
          "general.smoothScroll" = true;
          "devtools.chrome.enabled" = true;
          "media.hardware-video-decoding.enabled" = true;
        };

        extraConfig = ''
          user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
          user_pref("media.ffmpeg.vaapi.enabled", true);
        '';
      };
    };
  };
}
