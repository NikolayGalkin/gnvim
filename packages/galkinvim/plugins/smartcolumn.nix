{
  plugins.smartcolumn = {
    enable = true;
    settings = {
      colorcolumn = "120";
      disabled_filetypes = [
        "checkhealth"
        "help"
        "lspinfo"
        "markdown"
        "neo-tree"
        "noice"
        "text"
      ];
      custom_colorcolumn = {
        nix = [
          "100"
          "120"
        ];
      };
      scope = "file";
    };
  };
}
