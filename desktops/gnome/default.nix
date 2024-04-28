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


  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  services = {

    ## Graphics
    xserver = {
      displayManager = {
        gdm.enable = true;
        defaultSession = "gnome";
      };
      desktopManager.gnome.enable = true;
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

  environment.variables = {
    # This will become a global environment variable
    "QT_STYLE_OVERRIDE" = "kvantum";
  };
}

