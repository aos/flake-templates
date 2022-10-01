{
  description = "Flake templates";

  outputs = { self, ... }: {
    templates = {
      python-poetry = {
        path = ./python-poetry-template;
        description = "Simple Python + Poetry template";
      };
    };
  };
}
