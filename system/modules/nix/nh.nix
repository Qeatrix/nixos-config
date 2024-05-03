{
  ...
}: {
  environment.variables.FLAKE = "/home/quartix/.setup-refactor";

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
    };
  };
}
