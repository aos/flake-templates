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
      go-shell = {
        path = ./go-shell;
        description = "Minimal Go flake template";
      };
      go-web-server = {
        path = ./go-web-server;
        description = "Minimal Go web server template";
      };
    };
  };
}
