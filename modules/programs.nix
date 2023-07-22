{ config, pkgs, user, ... }:

{
  home.packages = with pkgs; [
    # Internet
    google-chrome-dev

    # Social
    telegram-desktop

    # Professional Software
    darktable
    
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

    # Dev Env
    nodejs
    nodePackages.vls
    nodePackages.typescript-language-server

    (python3.withPackages(ps: with ps; [ torch ]))
  ];
}
