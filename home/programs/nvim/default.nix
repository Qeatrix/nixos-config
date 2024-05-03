{
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nodejs
      vscode-langservers-extracted
    ];
  };

  xdg.configFile."nvim" = {
    source = ./config;
    recursive = true;
  };

  home.packages = with pkgs; [
    nodejs
    tree-sitter
    lua-language-server
    nil
  ];
}
