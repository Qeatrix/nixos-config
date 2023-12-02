{
  description = "A very basic flake";


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      user = "quartix";
      location = "$HOME/.setup";
      hostname = "qnt";

    in
    {

      nixosConfigurations = (
        import ./host {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs home-manager user hostname;
        }
      );
    };
}
