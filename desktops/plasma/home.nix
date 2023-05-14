{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Media
    haruna
    
    # Utilities
    libsForQt5.filelight
    libsForQt5.kate
  ];
}
