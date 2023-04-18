{ name, version }:

final: prev: {
  ${name} = prev.callPackage ./app.nix { inherit name version; };

  rustAppDevShell = prev.callPackage ./shell.nix { };
}
