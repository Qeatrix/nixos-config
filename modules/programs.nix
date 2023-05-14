{ config, pkgs, user, ... }:

{
  home.packages = with pkgs; [
    # Internet
    firefox
    
    # Security
    keepassxc
    bitwarden
    
    # Notes
    obsidian
    
    # Virtual
    podman
    distrobox
    
    # Utilities
    gparted
    pavucontrol
    
    # Tools
    git
    wget
    btop
    wireguard-tools
    jdk8
    wl-clipboard
  ];
}
