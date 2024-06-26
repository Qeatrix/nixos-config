# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../modules
  ];

  services.logrotate.checkConfig = false;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "clearcpuid=514" ];
  # boot.initrd.kernelModules = [ "nvidia" ];
  # boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];


  networking = {
    hostName = "qnt";
    networkmanager.enable = true;
  };

  # For mount.cifs, required unless domain name resolution is not needed.
  fileSystems."/mnt/share" = {
    device = "//192.168.1.11/share";
    fsType = "cifs";
    options = [ "credentials=/etc/nixos/smb-secrets,uid=1000,gid=100" ];
  };


  # Set your time zone.
  time.timeZone = "Asia/Yekaterinburg";


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    # Text Editors
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    helix

    # Utils
    killall
    btop
    tbb
    cifs-utils

    # Nvidia Related
    gst_all_1.gstreamer
    # Common plugins like "filesrc" to combine within e.g. gst-launch
    gst_all_1.gst-plugins-base
    # Specialized plugins separated by quality
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    # Plugins to reuse ffmpeg to play almost every video format
    gst_all_1.gst-libav
    # Support the Video Audio (Hardware) Acceleration API
    gst_all_1.gst-vaapi

    nvidia-vaapi-driver
    nvidia-system-monitor-qt
    nvidia-docker

    ntfs3g

    linuxKernel.packages.linux_xanmod_latest.v4l2loopback
  ];

  environment.localBinInPath = true;
  fonts.fontDir.enable = true;

  programs.fish.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users.quartix = {
      hashedPasswordFile = "/etc/nixos/secret.nix";
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "docker" "vboxusers" ]; # Enable ‘sudo’ for the user.
    };

    defaultUserShell = pkgs.fish;
    mutableUsers = false;
  };


  services = {

    ## Graphics
    xserver = {
      enable = true;
      xkb.layout = "us,ru";
      xkb.options = "grp:alt_shift_toggle";
      videoDrivers = [ "nvidia" ];
      libinput.mouse.accelProfile = "flat";
      dpi = 85;
    };

    flatpak.enable = true;
    openssh.enable = true;
    dbus.implementation = "broker";

    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    blueman.enable = true;
  };


  # Graphics Card Drivers
  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
      driSupport = true;
      package = (config.boot.kernelPackages.nvidiaPackages.stable.overrideAttrs {
        src = pkgs.fetchurl {
          url = "https://us.download.nvidia.com/XFree86/Linux-x86_64/535.171.04/NVIDIA-Linux-x86_64-535.171.04.run";
          sha256 = "sha256-6PFkO0vJXYrNZaRHB4SpfazkZC8UkjZGYSDbKqlCQ3o=";
        };
      });
    };

    nvidia = {
      modesetting.enable = true;
      forceFullCompositionPipeline = false;
      powerManagement.enable = true;
      open = false;
      # package = config.boot.kernelPackages.nvidiaPackages.latest;
      # package = config.boot.kernelPackages.nvidiaPackages.stable;
      # package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;

      package = (config.boot.kernelPackages.nvidiaPackages.stable.overrideAttrs {
        src = pkgs.fetchurl {
          url = "https://us.download.nvidia.com/XFree86/Linux-x86_64/535.171.04/NVIDIA-Linux-x86_64-535.171.04.run";
          sha256 = "sha256-6PFkO0vJXYrNZaRHB4SpfazkZC8UkjZGYSDbKqlCQ3o=";
        };
      });
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
      hsphfpd.enable = false;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
        };
      };

    };

    pulseaudio.enable = false;
  };


  programs.dconf.enable = true;
  virtualisation.docker = {
    enable = false;
    enableNvidia = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  security.polkit.enable = true;


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).

  # nixpkgs.config.permittedInsecurePackages = [
  # "electron-21.4.0"
  # "python-2.7.18.6"
  # ];

  nix = {
    settings.auto-optimise-store = true;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  environment.sessionVariables = rec {
    EDITOR = "hx";
    COLORTERM = "truecolor";
    # FREETYPE_PROPERTIES = "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
    FREETYPE_PROPERTIES="autofitter:no-stem-darkening=0 autofitter:darkening-parameters=500,0,1000,400,1500,350,1700,0 truetype:interpreter-version=38";
  };
}

