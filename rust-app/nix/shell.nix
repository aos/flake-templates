{ mkShell, cargo, clippy, openssl, pkg-config, rust-analyzer, rustc, rustPlatform, rustfmt }:

mkShell {
  nativeBuildInputs = [
    cargo
    clippy
    openssl
    pkg-config
    rustc
    rust-analyzer
    rustfmt
  ];

  RUST_SRC_PATH = "${rustPlatform.rustLibSrc}";
}
