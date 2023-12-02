{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Basic WM Components
    dzen2

    ## Fonts
    proggyfonts
    liberation_ttf
    terminus_font_ttf


    # Browser
    firefox
    chromium

    # Media
    pulsemixer
    playerctl
    alsa-oss # Fix the OpenAL on Prism Launcher

    # Clipboard
    xsel
    xclip

    # Image Managment
    feh
    maim
    xdotool
    slop

    # Terminal
    st

    # Launcher
    dmenu
    rofi

    # Display
    arandr
    sct
    xcompmgr

    # File Managment
    ranger
    ueberzug # Render Images In Terminal

    # Passwords
    bitwarden-cli
    pinentry

    # Desktop Capture
    obs-studio-plugins.obs-vaapi
    linuxKernel.packages.linux_xanmod_latest.v4l2loopback
  ];


  nixpkgs.overlays = [
    (self: super:
      {
        st = super.st.overrideAttrs (old: {
          patches = (old.patches or [ ]) ++ [
            ./patches/st-scrollback-0.8.5.diff
            # ./patches/st-scrollback-mouse-altscreen-0.8.diff
            ./patches/st-hidecursor-0.8.3.diff
          ];
        });
      }
    )
  ];
}
