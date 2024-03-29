{ config, pkgs, user, ... }:

{
  home.packages = with pkgs; [
    # Internet
    firefox

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
    ## obsidian

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
    samba
    unzip
    figma-agent
    nodejs
    vimHugeX
    bottles
    blender
    glfw-wayland
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
