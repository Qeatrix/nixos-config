{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Default Font
    overpass

    # Utilities
    cpupower-gui

    # Gnome Integraded Apps
    evince

    # Other Apps
    f3d ## 3D Viewer
    amberol ## Music Player
    gnome.gnome-boxes
    libdecor # Wayland client-side decorations
  ];
}
