{
  description = "An empty project that uses Zig.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zig.url = "github:silversquirl/zig-flake";
    zls.url = "github:zigtools/zls";

    zig.inputs.nixpkgs.follows = "nixpkgs";
    zls.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, zig, zls, ... }:
  let
    forAllSystems = f: builtins.mapAttrs f nixpkgs.legacyPackages;
  in {
    packages = forAllSystems (system: pkgs: {
      default = zig.packages.${system}.default.makePackage {
        pname = "my-package";
        version = "0.1.0";
        src = ./.;
        zigReleaseMode = "fast"; # or "safe" or "small"
        # only needed if you don't set a preferred release mode in your build.zig
        #depsHash = "<fill this in from the error message>";
      };
    });

    devShells = forAllSystems (system: pkgs: {
      default = pkgs.mkShellNoCC {
        packages = [
          zig.packages.${system}.default
          zls.packages.${system}.zls
        ];
      };
    });
  };
}
