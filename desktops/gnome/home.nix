{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Utilities
    cpupower-gui
    gnome.gnome-tweaks
    gnome-extension-manager

    # Extensions
    gnomeExtensions.pano
    gnomeExtensions.blur-my-shell
    gnomeExtensions.rounded-window-corners

    # Gnome Integraded Apps
    evince

    # Other Apps
    f3d ## 3D Viewer
    amberol ## Music Player
    gnome.gnome-boxes
    libdecor # Wayland client-side decorations
  ];
}
