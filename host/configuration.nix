# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  
  networking = {
    hostName = "qnt";
    networkmanager.enable = true;    
  };


  # Set your time zone.
  time.timeZone = "Asia/Yekaterinburg";


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    helix
    killall
    btop
   ];
  

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users.quartix = {
      passwordFile = "/etc/nixos/secret.nix";
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
      shell = pkgs.bash;
    };
    
    mutableUsers = false;
  };

  
  services = {

    ## Graphics
    xserver = {
      enable = true;
      layout = "us,ru";
      xkbOptions = "grp:win_space_toggle";
      videoDrivers = [ "nvidia" ];
    };
    
    ## Audio Server
    pipewire = {
  	  enable = true;
  	  alsa.enable = true;
  	  alsa.support32Bit = true;
  	  pulse.enable = true;
    	# If you want to use JACK applications, uncomment this
    	#jack.enable = true;
    };
    
    flatpak.enable = true;
  };
  
  sound = {
    enable = true;
    mediaKeys.enable = true;
  };
  security.rtkit.enable = true;
  

  # Graphics Card Drivers
  hardware = {
    opengl.enable = true;
    opengl.driSupport32Bit = true;

    nvidia = {
      modesetting.enable = true;
      forceFullCompositionPipeline = true;
      powerManagement.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    
    bluetooth = {
      enable = true;
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


  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

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
  system.stateVersion = "22.11";
  

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
}

