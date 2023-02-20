{
  description = "A basic Go shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachSystem [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ] (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        version = builtins.substring 0 8 self.lastModifiedDate;
      in {
        # You will need to provide a default package
        # packages = {
        #   default = pkgs.buildGoModule {
        #     pname = "web-server";
        #     inherit version;
        #     src = ./.;

        #     # This hash locks the dependencies of this package. It is
        #     # necessary because of how Go requires network access to resolve
        #     # VCS.  See https://www.tweag.io/blog/2021-03-04-gomod2nix/ for
        #     # details. Normally one can build with a fake sha256 and rely on native Go
        #     # mechanisms to tell you what the hash should be or determine what
        #     # it should be "out-of-band" with other tooling (eg. gomod2nix).
        #     # To begin with it is recommended to set this, but one must
        #     # remeber to bump this hash when your dependencies change.
        #     vendorSha256 = null;
        #     #vendorSha256 =
        #     #  "sha256-pQpattmS9VmO3ZIQUFn66az8GSmB4IvYhTTCFn6SUmo=";
        #   };
        # };

        # apps.default = utils.lib.mkApp { drv = self.packages.${system}.default; };

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [ go gopls gotools go-tools ];
        };
      });
}
