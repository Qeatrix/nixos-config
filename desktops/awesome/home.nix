{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Browser
    firefox

    # Terminal
    alacritty

    # Media
    pulsemixer
    playerctl

    # Clipboard
    xclip

    # Image Managment
    feh
    maim
    xdotool
    slop

    # Launcher
    rofi

    # Display
    sct
    xcompmgr

    # File Managment
    ranger
    ueberzug # Render Images In Terminal

    # Passwords
    bitwarden-cli
    rbw # Unofficial bitwarden cli client
    rofi-rbw
    pinentry

    # Desktop Capture
    obs-studio-plugins.obs-vaapi
    linuxKernel.packages.linux_xanmod_latest.v4l2loopback
  ];


  # Setup Monitors
  programs.autorandr = {
    enable = true;
    # profiles = {
    #   "default" = {
    #     fingerprint = {
    #       HDMI-1 = "00ffffffffffff001e6d555b2fd30300041d010380301b78ea3135a5554ea1260c5054a54b00714f81809500b300a9c0810081c090402a4480a07038274030203500e00e1100001e000000fd00304b1e5512000a202020202020000000fc004c472046554c4c2048440a2020023a801871382d40582c4500e00e1100001e01ac020324f148900403011012131f230907078301000065030c001000681a00000101304b00023a801871382d40582c4500e00e1100001e000000000000000000000000000000000000011d007251d01e206e285500e00e1100001e8c0ad08a20e02d10103e9600e00e110000180000000000000000000000000000000000000082";
    #       HDMI-2 = "00ffffffffffff001e6dcd4b675400000214010380291778ea3276a4554d9c24115054a56a00314f454f614f01010101010101010101662150b051001b304070360096e51000001e0e1f008051001e304080370096e51000001c000000fd00384b1e3d09000a202020202020000000fc0057313934360a2020202020202001d002031b61230907078301000067030c002000802d43908402e2000f8c0ad08a20e02d10103e9600a05a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000029";
    #     };
    #     config = {
    #       HDMI-1.enable = true;
    #       HDMI-1 = {
    #         crtc = 0;
    #         mode = "1920x1080";
    #         position = "1360x0";
    #         primary = true;
    #         rate = "74.97";
    #       };

    #       HDMI-2.enable = true;
    #       HDMI-2 = {
    #         crtc = 1;
    #         mode = "1360x768";
    #         position = "0x312";
    #         rate = "60.02";
    #       };
    #     };
    #   };
  };

  services.picom = {
    enable = false;
    backend = "glx";
    settings =
      {
        glx-no-rebind-pixmap = true;
        xrender-sync-fence = true;
        refresh-rate = 165;
        # corner-radius = 10;
        xinerama-shadow-crop = true;
        blur = {
          method = "gaussian";
          size = 15;
          deviation = 5.0;
        };

        # animations = true;
        # animation-for-open-window = "zoom";
        # animation-for-transient-window = "slide-down";
        # animation-stiffness = 350;
        # animation-window-mass = 0.5;
        # animation-dampening = 26;
        # animation-for-workspace-switch-in = "slide-left";
        # animation-for-workspace-switch-out = "slide-right";
        # animation-delta = 10;
        # animation-force_steps = false;
        # animation-clamping = true;
      };

    activeOpacity = 1;

    shadowExclude = [
      "bounding_shaped && !rounded_corners"
    ];

    fade = false;
    fadeDelta = 5;
    opacityRules = [
      "100:class_g   *?= 'Chromium-browser'"
      "100:class_g   *?= 'Firefox'"
      "100:class_g   *?= 'gitkraken'"
      "100:class_g   *?= 'emacs'"
      "100:class_g   ~=  'jetbrains'"
      "100:class_g   *?= 'slack'"
    ];
    # extraArgs = [ "--experimental-backends" ];
    package = pkgs.picom.overrideAttrs (o: {
      src = pkgs.fetchFromGitHub {
        repo = "picom";
        owner = "pijulius";
        rev = "982bb43e5d4116f1a37a0bde01c9bda0b88705b9";
        sha256 = "YiuLScDV9UfgI1MiYRtjgRkJ0VuA1TExATA2nJSJMhM=";
      };
    });
  };
}
