{ config, pkgs, user, ... }:

{
  # System Customization
  ## Font
  home.packages = with pkgs; [
    meslo-lgs-nf
    apple-cursor
  ];
  
  ## Cursor
  gtk = {
    enable = true;
    cursorTheme.package = pkgs.apple-cursor;
    cursorTheme.name = "MacOS-Monterey";
    theme.package = pkgs.apple-cursor;
    theme.name = "MacOS-Monterey";
  };
  
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.apple-cursor;
    name = "MacOS-Monterey";
    size = 16;
  };

  home.file.".icons/default".source = "${pkgs.apple-cursor}/share/icons/MacOS-Monterey";
}