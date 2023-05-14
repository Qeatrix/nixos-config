{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Utilities
    cpupower-gui
    gnome.gnome-tweaks
    gnome-extension-manager
  ];
}
