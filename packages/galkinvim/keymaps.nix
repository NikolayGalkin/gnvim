{ lib, helpers, ... }:
{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  keymaps =
    let
      normal =
        lib.mapAttrsToList
          (
            key:
            { action, ... }@attrs:
            {
              mode = "n";
              inherit action key;
              options = attrs.options or { };
            }
          )
          {
            "<space>" = {
              action = "<NOP>";
            };

            # Esc to clear search results
            "<esc>" = {
              action = "<cmd>nohlsearch<cr>";
            };

            "<leader>w" = {
              action = "<cmd>w<cr>";
              options = {
                desc = "Save File";
              };
            };

            "<leader>q" = {
              action = "<Cmd>confirm q<CR>";
              options = {
                desc = "Quit";
              };
            };

            "j" = {
              action = "v:count == 0 ? 'gj' : 'j'";
              options = {
                desc = "Move cursor down";
                expr = true;
              };
            };

            "k" = {
              action = "v:count == 0 ? 'gk' : 'k'";
              options = {
                desc = "Move cursor up";
                expr = true;
              };
            };

            # fix Y behavior
            "Y" = {
              action = "y$";
            };

            "<c-d>" = {
              action = "<c-d>zz";
            };

            "<c-u>" = {
              action = "<c-u>zz";
            };
          };

      insert =
        lib.mapAttrsToList
          (
            key:
            { action, ... }@attrs:
            {
              mode = "i";
              inherit action key;
              options = attrs.options or { };
            }
          )
          {
            "jk" = {
              action = "<esc>";
            };
          };
    in
    helpers.keymaps.mkKeymaps { options.silent = true; } (normal ++ insert);
}
