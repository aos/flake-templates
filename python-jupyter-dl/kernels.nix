{pkgs, ...}: {
  kernel.python.minimal = {
    enable = true;
    projectDir = ./.;
  };
}
