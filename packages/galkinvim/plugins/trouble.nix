{ config, lib, ... }:
{
  plugins.trouble = {
    enable = true;

    settings = {
      auto_close = true;
      modes = {
        preview_split = {
          # NOTE: can automatically open when diagnostics exist
          # auto_open = true;
          mode = "diagnostics";
          preview = {
            type = "split";
            relative = "win";
            position = "right";
            size = 0.5;
          };
        };

        preview_float = {
          mode = "diagnostics";
          preview = {
            type = "float";
            relative = "editor";
            border = "rounded";
            title = "Preview";
            title_pos = "center";
            position = [
              0
              (-2)
            ];
            size = {
              width = 0.3;
              height = 0.3;
            };
            zindex = 200;
          };
        };
      };
    };
  };

  keymaps = lib.mkIf config.plugins.trouble.enable [
    {
      mode = "n";
      key = "<leader>td";
      action = "<cmd>Trouble diagnostics<cr>";
    }
  ];
}
