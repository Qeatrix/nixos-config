{ pkgs, ... }:

{
  # System Customization
 environment.systemPackages = with pkgs; [
    # Font
    cascadia-code
    meslo-lgs-nf

    # Theme
    adw-gtk3

    # Cursor
    apple-cursor
  ];
}
