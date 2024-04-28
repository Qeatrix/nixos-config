# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{

  environment.systemPackages = with pkgs; [
    vala-panel
  ];

  services = {

    ## Graphics
    xserver = {
      desktopManager.xfce = {
        enable = true;
        enableXfwm = true;
      };
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

  nixpkgs.overlays = [
    (final: prev: {
      vala-panel = (prev.callPackage ./vala-panel.nix {});
    })
  ];
}

