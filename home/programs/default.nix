{
  pkgs,
  ...
}: {
  imports = [
    ./browser
    ./cmd
    ./discord
    ./nvim
    ./direnv
  ];

  home.packages = with pkgs; [
    # Design
    figma-linux
    figma-agent

    prismlauncher
    zoxide
    tdesktop
    wireguard-tools
    git
    unzip
    gparted
    wget

    # Libs
    glib
  ];
}
