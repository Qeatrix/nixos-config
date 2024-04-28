{ 
  stateVersion,
  ...
}: {
  imports = [
    ./host/configuration.nix
  ];

  system.stateVersion = stateVersion;
}
