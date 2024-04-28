{ nixpkgs, home-manager, user, hostname, ... }:

let
  system = "x86_64-linux";
  lib = nixpkgs.lib;
  defaultStateVersion = "23.11";
in
{
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.quartix = ./pkgsconf.nix;
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
            ./pkgsconf.nix
            ../desktops/plasma/home.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };

  hyprland = lib.nixosSystem {
    inherit system;
    modules = [
      ../sysconfigs
      ../desktops/hyprland
      ./configuration.nix


      home-manager.nixosModules.home-manager
      {
        home-manager.users.${user} = {
          home.stateVersion = defaultStateVersion;
          imports = [
            ./pkgsconf.nix
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


      home-manager.nixosModules.home-manager
      {
        home-manager.users.${user} = {
          home.stateVersion = defaultStateVersion;
          imports = [
            ./pkgsconf.nix
            ../desktops/gnome/home.nix
            ../desktops/gnome/desktopfiles.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };

  budgie = lib.nixosSystem {
    inherit system;
    modules = [
      ../sysconfigs
      ../desktops/budgie
      ./configuration.nix


      home-manager.nixosModules.home-manager
      {
        home-manager.users.${user} = {
          home.stateVersion = defaultStateVersion;
          imports = [
            ./pkgsconf.nix
            ../desktops/budgie/home.nix
            ../desktops/budgie/desktopfiles.nix
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
            ./pkgsconf.nix
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
            ./pkgsconf.nix
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
            ./pkgsconf.nix
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
            ./pkgsconf.nix
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
            ./pkgsconf.nix
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
            ./pkgsconf.nix
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
            ./pkgsconf.nix
            ../desktops/awesome/home.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };

  herbstluftwm = lib.nixosSystem {
    inherit system;
    modules = [
      ../sysconfigs
      ../desktops/herbstluftwm
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager.users.${user} = {
          home.stateVersion = defaultStateVersion;
          imports = [
            ./pkgsconf.nix
            ../desktops/herbstluftwm/home.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };

  xfce = lib.nixosSystem {
    inherit system;
    modules = [
      ../sysconfigs
      ../desktops/xfce
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager.users.${user} = {
          home.stateVersion = defaultStateVersion;
          imports = [
            ./pkgsconf.nix
            ../desktops/xfce/home.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };

  fvwm3 = lib.nixosSystem {
    inherit system;
    modules = [
      ../sysconfigs
      ../desktops/fvwm3
      ./configuration.nix

      home-manager.nixosModules.home-manager
      {
        home-manager.users.${user} = {
          home.stateVersion = defaultStateVersion;
          imports = [
            ./pkgsconf.nix
            ../desktops/fvwm3/home.nix
            ../modules
            ../configs
          ];
        };
      }
    ];
  };
}

