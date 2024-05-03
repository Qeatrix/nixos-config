{
  pkgs,
  config,
  ...
}: {
  home = {
    pointerCursor = {
      package = pkgs.apple-cursor;
      name = "macOS-Monterey";
      size = 16;
      gtk.enable = true;
      x11.enable = true;
    };

    sessionVariables = {
      XCURSOR_SIZE = 16;
      XCURSOR_THEME = config.home.pointerCursor.name;
    };
  };
}
