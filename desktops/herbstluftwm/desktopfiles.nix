{ config, pkgs, ... }: {
  home.packages = with pkgs;
    let
      chrome-figma = makeDesktopItem {
        name = "Figma Bundle";
        desktopName = "Figma Bundle";
        genericName = "Figma In Chrome";
        exec =
          ''runfigma'';
        icon = ../../assets/icons/runfigma.svg;
        # categories = [ "Media" ];
      };

      chrome-discord = makeDesktopItem {
        name = "Discord Bundle";
        desktopName = "Discord Bundle";
        genericName = "Discord In Chrome";
        exec = ''
          ${config.programs.google-chrome.package}/bin/google-chrome-stable --ozone-platform-hint=wayland --app="https://discord.com"'';
        icon = ../../assets/icons/rundiscord.svg;
        # categories = [ "Media" ];
      };
    in
    [ chrome-figma chrome-discord ];
}
