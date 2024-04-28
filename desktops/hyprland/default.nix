# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{

  programs = {
    hyprland = {
      enable = true;
      enableNvidiaPatches = true;
    };

    waybar = {
      enable = true;
      package = pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    };

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
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

  environment.variables = {
    # This will become a global environment variable
    "LIBVA_DRIVER_NAME" = "nvidia";
    "XDG_SESSION_TYPE" = "wayland";
    "GBM_BACKEND" = "nvidia-drm";
    "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
    "WLR_NO_HARDWARE_CURSORS" = "1";
  };
}

