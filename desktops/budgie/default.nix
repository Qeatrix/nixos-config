# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nvidia-vaapi-driver
    egl-wayland
    libsForQt5.qtstyleplugin-kvantum
  ];

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  services = {

    ## Graphics
    xserver = {
      displayManager = {
        lightdm.enable = true;
      };
      desktopManager.budgie.enable = true;
    };
  };

  hardware.opengl = {
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl

      # Test
      nvidia-vaapi-driver
    ];
  };
}

