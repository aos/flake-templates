{
  description = "Flake templates";

  outputs = { self, ... }: {
    templates = {
      elixir-phoenix = {
        path = ./elixir-phoenix;
        description = "Elixir + Phoenix flake template";
      };
      python-poetry = {
        path = ./python-poetry;
        description = "Simple Python + Poetry template";
      };
      python-jupyter-dl = {
        path = ./python-jupyter-dl;
        description = "Python + Poetry + Jupyterlab for deep learning";
      };
      rust-shell = {
        path = ./rust-shell;
        description = "Minimal Rust shell flake template";
      };
      rust-app = {
        path = ./rust-app;
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
