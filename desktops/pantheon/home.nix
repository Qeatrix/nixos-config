{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Utilities
    gnome.dconf-editor

    pantheon.elementary-gtk-theme
    pantheon.elementary-screenshot

    xdotool
  ];
}
