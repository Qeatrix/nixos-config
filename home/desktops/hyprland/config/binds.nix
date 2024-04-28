{
  config,
  pkgs,
  inputs,
  ...
}:
let
  mod = "SUPER";

  terminal = config.systemd.user.sessionVariables.TERMINAL;
  screenshotarea = "grimblast --notify --freeze copy area";
  cliphist = "cliphist list | rofi -dmenu | cliphist decode | wl-copy";
  launcher = "rofi -show";

  workspaces = builtins.concatLists (builtins.genList (x: let
    ws = let c = (x + 1) / 10;
    in builtins.toString (x + 1 - (c * 10));
    in [
      "${mod}, ${ws}, workspace, ${toString (x + 1)}"
      "${mod}SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
    ])
  10);
in {
  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        "SUPERSHIFT, C, killactive"
        "SUPER, F, fullscreen"
        "SUPER, V, togglefloating"

        "SUPERSHIFT, left, movewindow, l"
        "SUPERSHIFT, right, movewindow, r"
        "SUPERSHIFT, up, movewindow, u"
        "SUPERSHIFT, down, movewindow, d"
        "SUPER, P, pin"

        # Group windows
        "SUPER, G, togglegroup"
        "SUPER, TAB, changegroupactive, f"
        "SUPERSHIFT, TAB, changegroupactive, b"

        # Special workspace
        "SUPER, O, togglespecialworkspace, magic"
        "SUPERSHIFT, O, movetoworkspace, special:magic"

        # Move focus
        "SUPER, j, layoutmsg, cyclenext"
        "SUPER, k, layoutmsg, cycleprev"

        # Cycle through workspaces
        "SUPERALT, up, workspace, m-1"
        "SUPERALT, down, workspace, m+1"

        # Terminal
        "SUPER, Return, exec, ${terminal}"

        # Notifications
        #

        # Picker
        "SUPER, P, exec, hyprpicker | wl-copy"

        # Screenshot
        "SUPER, Print, exec, ${screenshotarea}"

        # Launcher
        "SUPER, D, exec, ${launcher}"

        # Clipboard history managment
        "SUPERCTRL, V, exec, ${cliphist}"
      ] ++ workspaces;

      binde = [
        # Audio
        "SUPER, Q, exec, ${pkgs.pamixer}/bin/pamixer --decrease 5"
        "SUPER, E, exec, ${pkgs.pamixer}/bin/pamixer --increase 5"
        "SUPER, B, exec, ${pkgs.pamixer}/bin/pamixer --default-source --toggle-mute"
      ];
    };

    extraConfig = ''
      bind = SUPERSHIFT, S, submap, resize

      submap = resize
      binde = SUPERSHIFT, l, resizeactive, 20 0
      binde = SUPERSHIFT, h, resizeactive, -20 0
      binde = SUPERSHIFT, k, resizeactive, 0 -20
      binde = SUPERSHIFT, j, resizeactive, 0 20
      bind = , escape, submap, reset
      submap = reset
    '';
  };
}
