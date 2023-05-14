# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);


  services = {

    ## Graphics
    xserver = {
      displayManager = {
        gdm.enable = true;
      };
      desktopManager.gnome.enable = true;
    };
  };
}

