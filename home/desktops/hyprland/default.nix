{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./config
    ./rofi
  ];

  home.packages = with pkgs; [
    kitty
    cliphist
    grimblast
    wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    systemd = {
      enable = true;
      extraCommands = lib.mkBefore [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };
}
