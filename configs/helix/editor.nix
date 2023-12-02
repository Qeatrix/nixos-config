{
  programs.helix = {
    enable = true;

    settings = {
      theme = "papercolor-light";

      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        true-color = true;

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };

      keys.normal = {
        space.space = "file_picker";
        space.w = ":w";
        space.W = ":wq";
        space.q = ":q";
        S-x = "shrink_to_line_bounds";
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
    };
  };
}
