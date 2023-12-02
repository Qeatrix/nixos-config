# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  programs.pantheon-tweaks.enable = true;

  services = {

    ## Graphics
    xserver = {
      displayManager = {
        lightdm.enable = true;
        lightdm.greeters.pantheon.enable = true;
      };
      desktopManager.pantheon.enable = true;
    };
  };
}

