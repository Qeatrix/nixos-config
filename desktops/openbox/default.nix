# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{

  services = {

    ## Graphics
    xserver = {
      displayManager = {
        lightdm.enable = true;
        defaultSession = "none+openbox";
        # setupCommands = ''
        #     LEFT='HDMI-2'
        #     CENTER='HDMI-1'
        #     xrandr --output $LEFT --mode 1360x768 --pos 0x312 --output $CENTER --primary --mode 1920x1080 --pos 1366x0
        # '';
      };

      windowManager.openbox.enable = true;
    };
  };


  # Setup XDG Portals  
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
    ];
  };
}

