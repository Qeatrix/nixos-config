# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{

  services = {

    ## Graphics
    xserver = {
      displayManager = {
        startx.enable = true;
        defaultSession = "none+herbstluftwm";
      };

      windowManager.herbstluftwm.enable = true;
    };

    xserver.displayManager.sessionCommands = ''
      ${pkgs.xorg.xrdb}/bin/xrdb -merge <${pkgs.writeText "Xresources" ''
        ! =============================================================================
        ! XTerm settings
        ! =============================================================================

        ! Fonts
        XTerm*vt100.faceName: MesloLGSDZ Nerd Font Mono:size=9:antialias=true:style=Regular
        XTerm*vt100.boldFont: MesloLGSDZ Nerd Font Mono:size=9:antialias=true:style=Bold
        XTerm.scaleHeight: 1.0

        ! Dont automatically jump to the bottom on output, but do on keypress.
        XTerm*scrollTtyOutput: false
        XTerm*scrollKey: true
        XTerm*scrollBar: true
        !XTerm.vt100.scrollbar.width: 8


        XTerm*allowSendEvents: true
        XTerm*allowTitleOps: false
        XTerm*Title: x280
        XTerm.vt100.locale: false
        XTerm.vt100.utf8: true
        XTerm.vt100.backarrowKey: false
        XTerm.ttyModes: erase ^?

        XTerm*selectToClipboard: true
        XTerm*BorderWidth: 1

        ! Use white-on-black colors
        !XTerm.vt100.reverseVideo: false

        !! a muted palette for athena things like xterm, xfontsel, etc.
        !#define BG      #eae5ce
        !#define FG      #444444
        !##define FG      #000000
        !*.background:      BG
        !*.foreground:      FG
        !
        !*.scrollbar.background:    BG
        !*.scrollbar.foreground:    FG
        !*.scrollBar.minimumThumb:  50
        !*.scrollbar.width:    10
        !
        !*.borderColor:      BG
        !
        !! solarized (light)
        !
        !! black
        !*.color0:      FG
        !*.color8:      #333333
        !
        !! red
        !*.color1:      #dc322f
        !*.color9:      #cb4b16
        !
        !! green
        !*.color2:      #859900
        !*.color10:      #93a1a1
        !
        !! yellow
        !*.color3:      #b58900
        !*.color11:      #839496
        !
        !! blue
        !*.color4:      #268bd2
        !*.color12:      #657b83
        !
        !! magenta
        !*.color5:      #d33682
        !*.color13:      #6c71c4
        !
        !! cyan
        !*.color6:      #2aa198
        !*.color14:      #586e75
        !
        !! white (gray)
        !*.color7:      #d9d7cc
        !*.color15:      #e5e5e5

        ! XTerm already has 256 colors support
        ! We ask it to set the correct $TERM
        XTerm.termName: xterm-256color

        ! Make Alt key behave like in other terminals
        XTerm.vt100.metaSendsEscape: true

        ! Number of lines to save for scrolling
        XTerm.vt100.saveLines: 100000

        ! Increase-decrease font size using Ctrl-/+
        xterm*VT100.Translations: #override \
            Ctrl <Key> minus: smaller-vt-font() \n\
            Ctrl <Key> plus: larger-vt-font()

        ! normal copy and paste
        Ctrl Shift <Key>C: copy-selection(CLIPBOARD) \n\
        Ctrl Shift <Key>V: insert-selection(CLIPBOARD)
              ''}
    '';
  };


  # Setup XDG Portals  
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
    ];
  };
}

