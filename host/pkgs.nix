{ pkgs, ... }: let
  callPackage = pkgs.callPackage;
  in {
    nixpkgs.overlays = [(final: prev: {
        localpkgs = {
          platinum = callPackage ../assets/themes/platinum {};
        };
    })];
  }
