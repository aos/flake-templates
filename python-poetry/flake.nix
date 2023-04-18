{
  description = "Flake to manage python workspace";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        poetry-env = pkgs.poetry2nix.mkPoetryEnv {
          projectDir = ./.;
        };
      in
      {
        packages =
          {
            default = pkgs.poetry2nix.mkPoetryApplication {
              projectDir = ./.;
            };
          };

        devShell = poetry-env.env.overrideAttrs (oldAttrs: {
          buildInputs = with pkgs; [ poetry ];
        });
      });
}
