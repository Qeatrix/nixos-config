# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  services = {

    ## Graphics
    xserver = {
      displayManager = {
        lightdm.enable = true;
        defaultSession = "plasma";
      };
      desktopManager.plasma5.enable = true;
    };
  };


  # Setup XDG Portals  
  xdg.portal = {
   enable = true;
   extraPortals = with pkgs; [
     xdg-desktop-portal
     xdg-desktop-portal-kde
     xdg-desktop-portal-gtk
   ];
   # wlr = {
   #   enable = true;
   #   settings = { # uninteresting for this problem, for completeness only
   #     screencast = {
   #       output_name = "HDMI-A-2";
   #       max_fps = 60;
   #       chooser_type = "simple";
   #       chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
   #     };
   #   };
   # };
  };
}

