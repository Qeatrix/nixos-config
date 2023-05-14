{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Utilities
    flameshot
    st
    dmenu
    xclip
    gnome.gnome-system-monitor
    winetricks
  ];
  
  # Setup Monitors
  programs.autorandr.enable = true;
}
