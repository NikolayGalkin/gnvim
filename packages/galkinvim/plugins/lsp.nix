{
  lib,
  pkgs,
  self,
  ...
}:
{
  plugins = {
    lspkind.enable = true;
    lsp-lines.enable = true;
    lsp-signature.enable = true;

    lsp = {
      enable = true;
      inlayHints = true;

      keymaps = {
        lspBuf = {
          "gd" = "definition";
          "gD" = "declaration";
          "gi" = "implementation";
          "K" = "hover";
          "<leader>ca" = "code_action";
        };

        extra = [
          {
            key = "<leader>ih";
            action = ''vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())'';
          }
        ];
      };

      servers = {
        bashls = {
          enable = true;
        };
        cssls = {
          enable = true;
        };
        html = {
          enable = true;
        };
        jsonls = {
          enable = true;
        };

        lua_ls = {
          enable = true;
        };
        marksman = {
          enable = true;
        };
        nixd = {
          enable = true;
          settings =
            let
              flake = ''(builtins.getFlake "${self}")'';
            in
            {
              nixpkgs = {
                expr = "import ${flake}.inputs.nixpkgs { }";
              };
              formatting = {
                command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
              };
              # options = {
              #   nix-darwin.expr = ''${flake}.darwinConfigurations.khanelimac.options'';
              #   nixos.expr = ''${flake}.nixosConfigurations.khanelinix.options'';
              #   nixvim.expr = ''${flake}.packages.${pkgs.system}.nvim.options'';
              #   home-manager.expr = ''${flake}.homeConfigurations."khaneliman@khanelinix".options'';
              # };
            };
        };
        pyright = {
          enable = true;
        };
        yamlls = {
          enable = true;
        };
      };

    };
  };

}
