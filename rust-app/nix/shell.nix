{ mkShell, openssl, pkg-config, rust-analyzer, rust-bin }:

mkShell {
  nativeBuildInputs = [
    openssl
    pkg-config
    rust-analyzer
    (rust-bin.stable.latest.default.override {
      extensions = [
        "rust-src"
        "rust-analyzer"
      ];
    })

    # (rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
    #   extensions = [ "rust-src" ];
    #   targets = ["arm-unknown-linux-gnueabihf" ];
    # }))
  ];
}
