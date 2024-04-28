{
  pkgs,
  user,
  stateVersion,
  ...
}: {
  imports = [
    ./overlays
    ./programs
    ./desktops/hyprland
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = stateVersion;
  };

  programs.home-manager.enable = true;
}
