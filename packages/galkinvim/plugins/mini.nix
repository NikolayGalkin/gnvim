{ config, lib, ... }:
{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;

    modules = {
      basics = {
        options.extra_ui = true;
        mappings.windows = true;
      };
      ai = { };
      icons = { };
      bracketed = { };
      pairs = { };
      surround = { };
      bufremove = { };
      animate = { };
      visits = { };
      move = {
        mappings = {
          left = "<C-M-h>";
          right = "<C-M-l>";
          down = "<C-M-j>";
          up = "<C-M-k>";

          line_left = "<C-M-h>";
          line_right = "<C-M-l>";
          line_down = "<C-M-j>";
          line_up = "<C-M-k>";
        };
      };
      cursorword = { };
      jump = { };
      jump2d = { };
      files = {
        windows = {
          preview = true;
          width_preview = 65;

        };
      };
      pick = {
        mappings = {
          move_down = "<c-j>";
          move_up = "<c-k>";
        };
      };
      indentscope = {
        symbol = "";
        options = {
          try_as_border = true;
        };
      };
    };
  };

  keymaps =
    lib.optionals (config.plugins.mini.enable && lib.hasAttr "files" config.plugins.mini.modules) [
      {
        mode = "n";
        key = "<leader>e";
        action.__raw = "MiniFiles.open";
      }
    ]

    ++ lib.optionals (config.plugins.mini.enable && lib.hasAttr "pick" config.plugins.mini.modules) [
      {
        mode = "n";
        key = "<leader>ff";
        action = ''<cmd>Pick files<cr>'';
      }
      {
        mode = "n";
        key = "<leader>fw";
        action = ''<cmd>Pick grep_live<cr>'';
      }
    ]

    ++
      lib.optionals (config.plugins.mini.enable && lib.hasAttr "bufremove" config.plugins.mini.modules)
        [
          {
            mode = "n";
            key = "<leader>x";
            action.__raw = "MiniBufremove.delete";
          }
        ]
    ++ lib.optionals (config.plugins.mini.enable && lib.hasAttr "visits" config.plugins.mini.modules) [
      {
        mode = "n";
        key = "<leader>v";
        action.__raw = "MiniVisits.select_path";
      }
    ];

  extraConfigLuaPost =
    lib.mkIf (config.plugins.mini.enable && lib.hasAttr "pick" config.plugins.mini.modules)
      ''
        local MiniPick = require('mini.pick');
        vim.ui.select = MiniPick.ui_select;
      '';
}
