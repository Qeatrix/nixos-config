{ config, pkgs, user, ... }:

{
  home.packages = with pkgs; [
    # Internet
    google-chrome-dev

    # Social
    telegram-desktop
    armcord

    # Professional Software
    darktable
    gimp

    # Security
    keepassxc
    bitwarden

    # Virtual
    podman
    toolbox
    distrobox

    # Utilities
    gparted
    pavucontrol
    pcmanfm

    # Notes
    obsidian

    # Tools
    git
    wget
    btop
    nvtop-nvidia
    lm_sensors
    wireguard-tools
    jdk8
    wl-clipboard
    gperftools
    feh
    samba
    unzip
    # (python3.withPackages (ps: with ps; [ torch ]))
  ];

  programs = {
    direnv = {
      enable = true;
      enableFishIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    bash.enable = true; # see note on other shells below
  };
}
