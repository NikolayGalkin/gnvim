{ pkgs, ... }:

{
  plugins.render-markdown = {
    enable = true;
  };

  plugins.image = {
    enable = true;
    backend = "kitty";
  };

  plugins.clipboard-image = {
    enable = true;
    clipboardPackage = pkgs.pngpaste;
  };
}
