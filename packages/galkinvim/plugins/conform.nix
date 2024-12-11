{ lib, pkgs, ... }:
{
  plugins.conform-nvim = {
    enable = true;

    settings = {

      notify_on_error = true;
      format_on_save = {
        lsp_format = "fallback";
      };
      formatters_by_ft = {
        nix = [ "nixfmt-rfc-style" ];
        lua = [ "stylua" ];
        python = [ "ruff_fix" ];
        javascript = [ "prettierd" ];
        yaml = [ "yamlfmt" ];
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };
      formatters = {
        nixfmt-rfc-style = {
          command = lib.getExe pkgs.nixfmt-rfc-style;
        };
        ruff_fix = {
          command = lib.getExe pkgs.ruff;
        };
        prettierd = {
          command = lib.getExe pkgs.prettierd;
        };
        stylua = {
          command = lib.getExe pkgs.stylua;
        };
        yamlfmt = {
          command = lib.getExe pkgs.yamlfmt;
        };
      };

    };

  };
}
