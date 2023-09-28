{ mkShell, rust-bin, ... }:

mkShell {
  nativeBuildInputs = [
    openssl
    pkg-config
    (rust-bin.stable.latest.default.override {
      extensions = [
        "rust-src"
        "rust-analyzer"
        "clippy"
      ];
    })

    # (rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
    #   extensions = [ "rust-src" ];
    #   targets = ["arm-unknown-linux-gnueabihf" ];
    # }))
  ];
}
