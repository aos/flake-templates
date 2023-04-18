{
  description = "Minimal Rust app flake template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, rust-overlay, utils }:
    let
      cargoToml = nixpkgs.lib.importTOML ./Cargo.toml;
      inherit (cargoToml.package) name version;

      # put devShell and other packages in a local overlay
      localOverlay = import ./nix/overlay.nix { inherit name version; };

      pkgsForSystem = system: import nixpkgs {
        inherit system;
        overlays = [
          localOverlay
        ];
      };
    in
    utils.lib.eachDefaultSystem
      (system: rec {
        legacyPackages = pkgsForSystem system;

        # nix build
        packages.default = legacyPackages.${name};

        # nix run
        apps.default = utils.lib.mkApp { drv = self.packages.${system}.default; };

        # nix develop
        devShells.default = legacyPackages.rustAppDevShell;
      }) // {
      overlays.default = final: prev: {
        ${name} = self.packages.${prev.stdenv.hostPlatform.system}.${name};
      };
    };
}
