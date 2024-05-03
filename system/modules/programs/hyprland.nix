{
  inputs,
  ...
}: {
  imports = [inputs.hyprland.nixosModules.default];
  home-manager.sharedModules = [inputs.hyprland.homeManagerModules.default];

  environment.sessionVariables = {
    "NIXOS_OZONE_WL" = 1;

    "HYPRCURSOR_SIZE" = "16";
    "HYPRCURSOR_THEME" = "macOS-Monterey";

    "MOZ_ENABLE_WAYLAND" = 1;

    "XDG_CURRENT_DESKTOP" = "Hyprland";
    "XDG_SESSION_DESKTOP" = "Hyprland";
    "XDG_SESSION_TYPE" = "wayland";

    "GDK_BACKEND" = "wayland";

    "QT_QPA_PLATFORM" = "wayland;xcb";
    "QT_AUTO_SCREEN_SCALE_FACTOR" = 1;
    "QT_WAYLAND_DISABLE_WINDOWDECORATION" = 1;

    "GBM_BACKEND" = "nvidia-drm";
    "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
    "LIBVA_DRIVER_NAME" = "nvidia";
    "__GL_GSYNC_ALLOWED" = 1;
    "WLR_DRM_NO_ATOMIC" = 1;
    "NVD_BACKEND" = "direct";

    "WLR_NO_HARDWARE_CURSORS" = 1;
    "WLR_RENDERER" = "vulkan";

    "_JAVA_AWT_WM_NONEREPARENTING" = 1;

    "ELECTRON_OZONE_PLATFORM_HINT" = "auto";
  };
}
