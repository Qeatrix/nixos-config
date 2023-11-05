{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Programs
    qutebrowser
    dmenu
    gnome.gnome-system-monitor

    ## Screenshot
    maim
    xdotool

    ## FM
    ranger
    ueberzug

    # Utility
    xclip
    xcompmgr
    clipmenu
    clipnotify
  ];


  # Setup Monitors
  programs.autorandr = {
    enable = true;
  };
}
