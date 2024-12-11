{ config, lib, ... }:
{
  plugins = {
    gitignore = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };

    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;

        current_line_blame_opts = {
          delay = 500;

          ignore_blank_lines = true;
          ignore_whitespace = true;
          virt_text = true;
          virt_text_pos = "eol";
        };

        signcolumn = false;
      };
    };
  };

  keymaps =
    lib.optionals config.plugins.gitignore.enable [
      {
        mode = "n";
        key = "<leader>gi";
        action.__raw = ''require('gitignore').generate'';
        options = {
          desc = "Gitignore generate";
          silent = true;
        };
      }
    ]
    ++ lib.optionals config.plugins.lazygit.enable [
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>LazyGit<cr>";
      }
    ];

}
