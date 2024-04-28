{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pcmanfm
    roxterm
    xarchiver
  ];

  gtk.enable = true;
  qt.enable = true;
}
