{
  description = "Flake templates";

  outputs = { self, ... }: {
    templates = {
      python-poetry = {
        path = ./python-poetry;
        description = "Simple Python + Poetry template";
      };
      rust-shell = {
        path = ./rust-shell;
        description = "Minimal Rust shell flake template";
      };
      rust-app = {
        path = ./rust-app-minimal;
        description = "Minimal Rust app flake template";
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
