{ ... }:
{
  plugins.blink-cmp = {
    enable = true;

    settings = {
      completion = {
        accept.auto_brackets.enabled = true;
        ghost_text.enabled = true;
        documentation = {
          auto_show = true;
          window.border = "rounded";
        };
        menu = {
          border = "rounded";
          draw = {
            columns = [
              {
                __unkeyed-1 = "label";
              }
              {
                __unkeyed-1 = "kind_icon";
                __unkeyed-2 = "kind";
                gap = 1;
              }
              { __unkeyed-1 = "source_name"; }
            ];
          };
        };
      };
      fuzzy = {
        prebuilt_binaries = {
          download = false;
          ignore_version_mismatch = true;
        };
      };
      appearance = {
        use_nvim_cmp_as_default = true;
      };
      keymap = {
        preset = "enter";
        "<Tab>" = [
          "select_next"
          "fallback"
        ];
        "<S-Tab>" = [
          "select_prev"
          "fallback"
        ];
      };
      signature = {
        enabled = true;
        window.border = "rounded";
      };
      sources = {
        default = [
          # BUILT-IN SOURCES
          "lsp"
          "buffer"
          "luasnip"
          "path"
          "snippets"
        ];
        providers = {
          # BUILT-IN SOURCES
          lsp.score_offset = 4;
        };
      };
    };
  };
}
