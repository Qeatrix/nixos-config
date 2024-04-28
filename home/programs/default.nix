{
  pkgs,
  ...
}: {
  imports = [
    ./browser
    ./cmd
    ./discord
  ];

  home.packages = with pkgs; [
    prismlauncher
    zoxide
    tdesktop
    neovim
    nh
    wireguard-tools
    git

    # Libs
    glib
  ];
}
