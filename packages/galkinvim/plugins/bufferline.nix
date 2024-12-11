{ config, lib, ... }:
{
  plugins.bufferline = {
    enable = true;

    settings = {
      options = {
        mode = "buffers";
        always_show_bufferline = true;
        diagnostics = "nvim_lsp";

        diagnostics_indicator = ''
          function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end
        '';
        numbers = "ordinal";
        show_buffer_close_icons = false;
        show_close_icon = false;
        show_tab_indicators = false;
      };
    };
  };

  keymaps = lib.mkIf config.plugins.bufferline.enable [
    {
      mode = "n";
      key = "g1";
      action = "<cmd>BufferLineGoToBuffer 1<cr>";
    }
    {
      mode = "n";
      key = "g2";
      action = "<cmd>BufferLineGoToBuffer 2<cr>";
    }
    {
      mode = "n";
      key = "g3";
      action = "<cmd>BufferLineGoToBuffer 3<cr>";
    }
    {
      mode = "n";
      key = "g4";
      action = "<cmd>BufferLineGoToBuffer 4<cr>";
    }
    {
      mode = "n";
      key = "g5";
      action = "<cmd>BufferLineGoToBuffer 5<cr>";
    }
    {
      mode = "n";
      key = "g6";
      action = "<cmd>BufferLineGoToBuffer 6<cr>";
    }
    {
      mode = "n";
      key = "g7";
      action = "<cmd>BufferLineGoToBuffer 7<cr>";
    }
    {
      mode = "n";
      key = "g8";
      action = "<cmd>BufferLineGoToBuffer 8<cr>";
    }
    {
      mode = "n";
      key = "g9";
      action = "<cmd>BufferLineGoToBuffer 9<cr>";
    }
  ];

}
