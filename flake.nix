{
  description = "Flake templates";

  outputs = { self, ... }: {
    templates = {
      python-poetry = {
        path = ./python-poetry-template;
        description = "Simple Python + Poetry template";
      };
      rust-minimal = {
        path = ./rust-minimal;
        description = "Minimal Rust flake template";
      };
    };
  };
}
