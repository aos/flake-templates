{ mkShell, cargo, clippy, openssl, pkg-config, rust-analyzer, rustfmt }:

mkShell {
  buildInputs = [
    cargo
    clippy
    openssl
    pkg-config
    rust-analyzer
    rustfmt
  ];
}
