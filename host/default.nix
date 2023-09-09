{ inputs, nixpkgs, home-manager, user, hostname, ... }:

let 
  system = "x86_64-linux";
  lib = nixpkgs.lib;
  defaultStateVersion = "23.05";
in
{
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.quartix = ./home.nix;
  };

  plasma = lib.nixosSystem {
    inherit system;
    modules = [
      ../sysconfigs
      ../desktops/plasma
      ./configuration.nix

      
      home-manager.nixosModules.home-manager {
        home-manager.users.${user} = {
        home.stateVersion = defaultStateVersion;
          imports = [
            ./home.nix
            ../desktops/plasma/home.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };
  
  dwm = lib.nixosSystem {
    inherit system;
    modules = [
      ../sysconfigs
      ../desktops/dwm
      ./configuration.nix
      
      home-manager.nixosModules.home-manager {
        home-manager.users.${user} = {
        home.stateVersion = defaultStateVersion;
          imports = [
            ./home.nix
            ../desktops/dwm/home.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };
  
  gnome = lib.nixosSystem {
    inherit system;
    modules = [
      ../sysconfigs
      ../desktops/gnome
      ./configuration.nix

      
      home-manager.nixosModules.home-manager {
        home-manager.users.${user} = {
        home.stateVersion = defaultStateVersion;
          imports = [
            ./home.nix
            ../desktops/gnome/home.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };

  pantheon = lib.nixosSystem {
    inherit system;
    modules = [
      ../sysconfigs
      ../desktops/pantheon
      ./configuration.nix

      
      home-manager.nixosModules.home-manager {
        home-manager.users.${user} = {
        home.stateVersion = defaultStateVersion;
          imports = [
            ./home.nix
            ../desktops/pantheon/home.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };
}

