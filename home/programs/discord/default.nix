{
  pkgs,
  root,
  ...
}:
let
  vesktop = pkgs.callPackage "${root}/pkgs/vesktop" {};
in {
  home.packages = with pkgs; [
    vesktop
  ];
}
