{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    prismlauncher

    vkBasalt
    mangohud
    goverlay
  ];
}