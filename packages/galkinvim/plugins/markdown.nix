{ pkgs, ... }:

{
  plugins.render-markdown = {
    enable = false;
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
