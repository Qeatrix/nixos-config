{
  description = "System config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    nix-gaming.url = "github:fufexan/nix-gaming";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland/v0.39.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xdghypr = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    flake-parts,
    ...
  } @ inputs: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
    stateVersion = "24.05";
    system = "x86_64-linux";
    builder = import ./lib/builder.nix { inherit inputs stateVersion; };
  in
    {
      nixosConfigurations = {
        qnt = builder.mkHost {
          hostname = "qnt";
          user = "quartix";
        };
      };

      homeConfigurations = {
        "quartix" = builder.mkHome {user = "quartix";};
      };
    };
}
