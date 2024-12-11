{ ... }:
{
  autoCmd = [
    # Remove trailing whitespace on save
    # (lib.mkIf (!lib.elem "trim_whitespace" config.plugins.conform-nvim.settings.formatters_by_ft."_") {
    #   event = "BufWrite";
    #   command = "%s/\\s\\+$//e";
    # })

    # Enable spellcheck for some filetypes
    {
      event = "FileType";
      pattern = [
        "markdown"
      ];
      command = "setlocal spell spelllang=en_us";
    }
  ];
}
