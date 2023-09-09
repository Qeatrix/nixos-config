{ pkgs, ... }: with pkgs; {
  # bash-language-server will use shellcheck if it's installed
  home.packages = [ shellcheck ];

  programs.helix.languages.language-server = {
    rust-analyzer = {
      command = "${rust-analyzer}/bin/rust-analyzer";
      config.inlayHints = {
        bindingModeHints.enable = false;
        closingBraceHints.minLines = 10;
        closureReturnTypeHints.enable = "with_block";
        discriminantHints.enable = "fieldless";
        lifetimeElisionHints.enable = "skip_trivial";
        typeHints.hideClosureInitialization = false;
      };
    };
    bash-language-server = {
      command = "${nodePackages.bash-language-server}/bin/bash-language-server";
      args = [ "start" ];
    };
    vscode-json-language-server = {
      command = "${nodePackages_latest.vscode-langservers-extracted}/bin/vscode-json-language-server";
      args = [ "--stdio" ];
      config.provideFormatter = true;
    };
    vscode-html-language-server = {
      command = "${nodePackages_latest.vscode-langservers-extracted}/bin/vscode-html-language-server";
      args = [ "--stdio" ];
      config.provideFormatter = true;
    };
    docker-langserver = {
      command = "${nodePackages.dockerfile-language-server-nodejs}/bin/docker-langserver";
      args = [ "--stdio" ];
    };
  };
}
