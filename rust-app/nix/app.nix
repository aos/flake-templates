{ rustPlatform, name, version }:

rustPlatform.buildRustPackage rec {
  pname = name;
  inherit version;

  src = ../.;

  cargoLock = {
    lockFile = ../Cargo.lock;
  };
}
