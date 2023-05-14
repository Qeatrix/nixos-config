{
  # List your module files here
  # my-module = import ./my-module.nix;

  imports = [
    ./programs.nix
    ./games.nix
    ./customization.nix
  ];
}
