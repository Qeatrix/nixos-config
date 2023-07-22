{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Utilities
    # flameshot
    st
    dmenu
    xclip
    gnome.gnome-system-monitor
    winetricks
    xcompmgr
    clipmenu
    clipnotify

    ## Screenshot
    maim
    xdotool

    ## FM
    ranger
    ueberzug
  ];
  

  # Setup Monitors
  programs.autorandr = {
    enable = true;
    profiles = {
      "default" = {
        fingerprint = {
          HDMI-1 = "00ffffffffffff001e6d555b2fd30300041d010380301b78ea3135a5554ea1260c5054a54b00714f81809500b300a9c0810081c090402a4480a07038274030203500e00e1100001e000000fd00304b1e5512000a202020202020000000fc004c472046554c4c2048440a2020023a801871382d40582c4500e00e1100001e01ac020324f148900403011012131f230907078301000065030c001000681a00000101304b00023a801871382d40582c4500e00e1100001e000000000000000000000000000000000000011d007251d01e206e285500e00e1100001e8c0ad08a20e02d10103e9600e00e110000180000000000000000000000000000000000000082";
          HDMI-2 = "00ffffffffffff001e6dcd4b675400000214010380291778ea3276a4554d9c24115054a56a00314f454f614f01010101010101010101662150b051001b304070360096e51000001e0e1f008051001e304080370096e51000001c000000fd00384b1e3d09000a202020202020000000fc0057313934360a2020202020202001d002031b61230907078301000067030c002000802d43908402e2000f8c0ad08a20e02d10103e9600a05a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000029";
        };
        config = {
          HDMI-1.enable = true;
          HDMI-1 = {
            crtc = 0;
            mode = "1920x1080";
            position = "1360x0";
            primary = true;
            rate = "74.97";
          };
          
          HDMI-2.enable = true;
          HDMI-2 = {
            crtc = 1;
            mode = "1360x768";
            position = "0x312";
            rate = "60.02";
          };
        };
      };
    };
  };

  nixpkgs.overlays = [ (self: super:
    {
      st = super.st.overrideAttrs (old: {
        patches = (old.patches or []) ++ [
          # (super.fetchpatch {
          #   url = "https://st.suckless.org/patches/scrollback/st-scrollback-0.8.5.diff";
          #   hash = "ZZAbrWyIaYRtw+nqvXKw8eXRWf0beGNJgoupRKsr2lc";
          # })
          ./patches/st-scrollback-0.8.5.diff
          ./patches/st-hidecursor-0.8.3.diff
        ];
      });
    }
  ) ];
}
