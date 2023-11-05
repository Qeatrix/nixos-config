{ config, pkgs, user, ... }:

{
  # System Customization
  home.packages = with pkgs; [
    ## Font
    cascadia-code
    meslo-lgs-nf

    ## Theme
    whitesur-gtk-theme
    whitesur-icon-theme
  ];

  gtk.font.package = pkgs.dejavu_fonts;

  ## Cursor
  home.pointerCursor =
    let
      getFrom = url: hash: name: {
        gtk.enable = true;
        x11.enable = true;
        name = name;
        size = 16;
        package =
          pkgs.runCommand "moveUp" { } ''
            mkdir -p $out/share/icons
            ln -s ${pkgs.fetchzip {
              url = url;
              hash = hash;
            }} $out/share/icons/${name}
          '';
      };
    in
    getFrom
      "https://github.com/ful1e5/apple_cursor/releases/download/v2.0.0/macOS-Monterey.tar.gz"
      "sha256-MHmaZs56Q1NbjkecvfcG1zAW85BCZDn5kXmxqVzPc7M="
      "MacOS-Monterey";

  # home.file.".icons/default".source = "${pkgs.apple-cursor}/share/icons/MacOS-Monterey";
}
