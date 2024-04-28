{
  config,
  root,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;
      bezier = ["bezier, 0.05, 0.7, 0.1, 1" "workspace,0.17, 1.17, 0.3,1"];
      animation = [
        "border, 1, 2, default"
        "fade, 1, 2, bezier"
        "windows, 1, 4, bezier, popin 60%"
        "workspaces, 1, 5, workspace, slidefadevert 8%"
      ];
    };

    decoration = {
      rounding = 10;

      active_opacity = 1.0;
      inactive_opacity = 1.0;
      fullscreen_opacity = 1.0;

      drop_shadow = false;

      blur = {
        enabled = false;
        passes = 3;
        size = 16;
      };
    };

    workspace = [
      "9, monitor:HDMI-A-1, default:true"
    ];

    exec-once = [
      "xrandr --output DP-2 --primary"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
    ];

    general = {
      gaps_in = 12;
      gaps_out = 20;
      border_size = 3;
      "col.inactive_border" = "rgba(181825ee)";
      "col.active_border" = "rgba(89b4faee)";
      layout = "master";
    };

    input = {
      kb_layout = "us,ru";
      kb_options = "caps:none, grp:win_space_toggle";
      accel_profile = "flat";
      sensitivity = -0.2;
    };

    misc = {
      disable_autoreload = false;
      disable_hyprland_logo = true;
      force_default_wallpaper = 0;
    };

    monitor = [
     "DP-2, 3440x1440@165, 0x0, 1"
     "HDMI-A-1, 1920x1080@75, 3440x0, 1"
    ];
  };
}
