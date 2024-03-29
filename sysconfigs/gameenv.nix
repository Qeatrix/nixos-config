{ config, pkgs, lib, ... }:

{
  programs = {
    # Needed to succesfully start Steam
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      # remotePlay.openFirewall = true;          # Ports for Stream Remote Play
    };
    gamemode.enable = true; # Better gaming performance
    # Steam: Right-click game - Properties - Launch options: gamemoderun %command%
    # Lutris: General Preferences - Enable Feral GameMode
    #                             - Global options - Add Environment Variables: LD_PRELOAD=/nix/store/*-gamemode-*-lib/lib/libgamemodeauto.so
  };

  boot.kernel.sysctl = {
    "vm.max_map_count" = 16777216;
    "fs.file-max" = 524288;
  };

  # boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  # boot.extraModulePackages = with config.boot.kernelPackages; [
  #   v4l2loopback
  # ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-runtime"
  ]; # Use Steam for Linux libraries

  networking = {
    extraHosts =
      ''
        127.0.0.1 modules-cdn.eac-prod.on.epicgames.com
      '';
  };
}
