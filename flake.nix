{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.home-manager.follows = "home-manager";
      # inputs.nix-darwin.follows = "darwin";
      # inputs.nuschtosSearch.follows = "nuschtosSearch";
    };

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    snowfall-flake = {
      url = "github:snowfallorg/flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pre-commit-hooks-nix.url = "github:cachix/pre-commit-hooks.nix";
  };

  outputs =
    inputs:
    let
      inherit (inputs) snowfall-lib;

      lib = snowfall-lib.mkLib {
        inherit inputs;

        src = ./.;

        snowfall = {
          meta = {
            name = "galkinvim";
            title = "galkinvim";
          };

          namespace = "galkinvim";
        };
      };
    in
    lib.mkFlake {
      alias = {
        packages = {
          default = "galkinvim";
          nvim = "galkinvim";
        };
      };

      channels-config = {
        allowUnfree = true;
      };

      outputs-builder = channels: { formatter = channels.nixpkgs.nixfmt-rfc-style; };
    }
    // {
      inherit (inputs) self;
    };
}
