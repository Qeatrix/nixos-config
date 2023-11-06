{ inputs, nixpkgs, nur, home-manager, user, hostname, ... }:

let
  system = "x86_64-linux";
  lib = nixpkgs.lib;
  defaultStateVersion = "23.05";
in
{
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.quartix = ./packages.nix;
  };


  # Desktop Environments
  plasma = lib.nixosSystem {
    inherit system;
    modules = [
      ../sysconfigs
      ../desktops/plasma
      ./configuration.nix


      home-manager.nixosModules.home-manager
      {
        home-manager.users.${user} = {
          home.stateVersion = defaultStateVersion;
          imports = [
            ./packages.nix
            ../desktops/plasma/home.nix
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
      { nixpkgs.overlays = [ nur.overlay ]; }
      ({ pkgs, ... }:
        let
          nur-no-pkgs = import nur {
            nurpkgs = import nixpkgs { system = "x86_64-linux"; };
          };
        in
        {
          imports = [ nur-no-pkgs.repos.iopq.modules.xraya ];
          services.xraya.enable = true;
        })


      home-manager.nixosModules.home-manager
      {
        home-manager.users.${user} = {
          home.stateVersion = defaultStateVersion;
          imports = [
            ./packages.nix
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


      home-manager.nixosModules.home-manager
      {
        home-manager.users.${user} = {
          home.stateVersion = defaultStateVersion;
          imports = [
            ./packages.nix
            ../desktops/pantheon/home.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };


  # Window Managers
  dwm = lib.nixosSystem {
    inherit system;
    modules = [
      ../sysconfigs
      ../desktops/dwm
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager.users.${user} = {
          home.stateVersion = defaultStateVersion;
          imports = [
            ./packages.nix
            ../desktops/dwm/home.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };

  i3 = lib.nixosSystem {
    inherit system;
    modules = [
      ../sysconfigs
      ../desktops/i3
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager.users.${user} = {
          home.stateVersion = defaultStateVersion;
          imports = [
            ./packages.nix
            ../desktops/i3/home.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };

  openbox = lib.nixosSystem {
    inherit system;
    modules = [
      ../sysconfigs
      ../desktops/openbox
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager.users.${user} = {
          home.stateVersion = defaultStateVersion;
          imports = [
            ./packages.nix
            ../desktops/openbox/home.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };

  icewm = lib.nixosSystem {
    inherit system;
    modules = [
      ../sysconfigs
      ../desktops/icewm
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager.users.${user} = {
          home.stateVersion = defaultStateVersion;
          imports = [
            ./packages.nix
            ../desktops/icewm/home.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };

  qtile = lib.nixosSystem {
    inherit system;
    modules = [
      ../sysconfigs
      ../desktops/qtile
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager.users.${user} = {
          home.stateVersion = defaultStateVersion;
          imports = [
            ./packages.nix
            ../desktops/qtile/home.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };

  awesome = lib.nixosSystem {
    inherit system;
    modules = [
      ../sysconfigs
      ../desktops/awesome
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager.users.${user} = {
          home.stateVersion = defaultStateVersion;
          imports = [
            ./packages.nix
            ../desktops/awesome/home.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };
}

