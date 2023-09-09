{ pkgs, ... }: with pkgs; {
  programs.helix.languages.language = map (l: l // { auto-format = true; }) [
    {
      name = "nix";
      formatter = {
        command = "${nixpkgs-fmt}/bin/nixpkgs-fmt";
      };
    }
    {
      name = "rust";
    }
    {
      name = "bash";
      formatter = {
        command = "${shfmt}/bin/shfmt";
      };
    }
  ];
}