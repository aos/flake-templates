{
  description = "Flake templates";

  outputs = { self, ... }: {
    templates = {
      elixir = {
        path = ./elixir;
        description = "Elixir flake template";
        welcomeText = ''
          For Phoenix applications, run:

            mix archive.install hex phx_new
        '';
      };
      elixir-psql = {
        path = ./elixir-psql;
        description = "Elixir + PSQL podman flake template";
        welcomeText = ''
          For Phoenix applications, run:

            mix archive.install hex phx_new

          Make sure to also supply the correct `pg_port` if need be.
        '';
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
      zig-shell = {
        path = ./zig-shell;
        description = "Minimal Zig flake template";
      };
    };
  };
}
