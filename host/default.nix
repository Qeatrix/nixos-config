{ inputs, nixpkgs, home-manager, user, hostname, ... }:

let 
  system = "x86_64-linux";                                  # System architecture
  lib = nixpkgs.lib;
in
{
  plasma = lib.nixosSystem {
    inherit system;
    modules = [
      ../conf
      ../desktops/plasma
      ./configuration.nix

      
      home-manager.nixosModules.home-manager {
        home-manager.users.${user} = {
        home.stateVersion = "22.11";
          imports = [
            ./home.nix
            ../desktops/plasma/home.nix
            ../modules
          ];
        };
      }
    ];
  };
  
  dwm = lib.nixosSystem {
    inherit system;
    modules = [
      ../conf
      ../desktops/dwm
      ./configuration.nix
      
      home-manager.nixosModules.home-manager {
        home-manager.users.${user} = {
        home.stateVersion = "22.11";
          imports = [
            ./home.nix
            ../desktops/dwm/home.nix
            ../modules
          ];
        };
      }
    ];
  };
  
  gnome = lib.nixosSystem {
    inherit system;
    modules = [
      ../conf
      ../desktops/gnome
      ./configuration.nix

      
      home-manager.nixosModules.home-manager {
        home-manager.users.${user} = {
        home.stateVersion = "22.11";
          imports = [
            ./home.nix
            ../desktops/gnome/home.nix
            ../modules
          ];
        };
      }
    ];
  };
}

