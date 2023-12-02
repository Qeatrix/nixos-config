{ config, pkgs, user, ... }:

{
  home.packages = with pkgs; [
    # Internet
    librewolf

    # Social
    telegram-desktop
    armcord

    # Security
    bitwarden

    # Virtual
    podman
    toolbox
    distrobox

    # Utilities
    gparted
    pavucontrol

    # Notes
    obsidian

    # Tools
    git
    wget
    xclip
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
    lua-language-server
    figma-agent
    nodejs
    vimHugeX
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
