# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  services = {

    ## Graphics
    xserver = {
      windowManager.fvwm2.enable = true;
    };
  };

  # Setup XDG Portals  
  xdg.portal = {
   enable = true;
   config.common = {
    default = [
      "gtk"
     ];
   };
   extraPortals = with pkgs; [
     xdg-desktop-portal
     xdg-desktop-portal-gtk
   ];
  };
}

