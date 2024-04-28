{ config, pkgs, ... }: {
  home.packages = with pkgs;
    let
      chrome-youtube = makeDesktopItem {
        name = "Youtube Web";
        desktopName = "Youtube Web";
        genericName = "Youtube In Chrome";
        exec = ''
          ${config.programs.google-chrome.package}/bin/google-chrome-stable --ozone-platform-hint=wayland --app="https://youtube.com"'';
        icon = ../../assets/icons/runyoutube.svg;
        # categories = [ "Media" ];
      };

      chrome-figma = makeDesktopItem {
        name = "Figma Web";
        desktopName = "Figma Web";
        genericName = "Figma In Chrome";
        exec =
          ''runfigma'';
        icon = ../../assets/icons/runfigma.svg;
        # categories = [ "Media" ];
      };

      chrome-discord = makeDesktopItem {
        name = "Discord Web";
        desktopName = "Discord Web";
        genericName = "Discord In Chrome";
        exec = ''
          ${config.programs.google-chrome.package}/bin/google-chrome-stable --ozone-platform-hint=wayland --app="https://discord.com"'';
        icon = ../../assets/icons/rundiscord.svg;
        # categories = [ "Media" ];
      };

      chrome-reddit = makeDesktopItem {
        name = "Reddit Web";
        desktopName = "Reddit Web";
        genericName = "Reddit In Chrome";
        exec = ''
          ${config.programs.google-chrome.package}/bin/google-chrome-stable --ozone-platform-hint=wayland --app="https://reddit.com"'';
        icon = ../../assets/icons/rundiscord.svg;
        # categories = [ "Media" ];
      };
    in
    [ chrome-youtube chrome-figma chrome-discord chrome-reddit ];
}
