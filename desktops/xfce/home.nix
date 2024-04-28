{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pcmanfm
    pantheon.elementary-code
    roxterm
    xarchiver
  ];

  gtk.enable = true;
  qt.enable = true;
}
