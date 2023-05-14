{ config, pkgs, user, ... }:

{
  # System Customization
  ## Cursor
  gtk.enable = true;
  gtk.cursorTheme.package = pkgs.vanilla-dmz;
  gtk.cursorTheme.name = "Vanilla-DMZ";
  gtk.theme.package = pkgs.vanilla-dmz;
  gtk.theme.name = "Vanilla-DMZ";
  
  home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
  home.pointerCursor = {
    x11.enable = true;
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
    size = 24;
  };
}