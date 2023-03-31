## Flake Templates

Repository to store Nix flake templates. Alias popular flakes using
identifiers.

### Check your current registeries

```
nix registery list
```

### Create your own templates

```
nix flake init -t ~/mytemplates#rust-hello
```

### Alias templates to a registery

```
nix registery add biscuits ~/mytemplates
```

### Use aliased template

```
nix flake init -t biscuits#latex-report
```

### Use template from another source (create in current dir)

```
nix flake init -t github:aos/flake-templates#rust-minimal
```

### Use template from another source (create new directory)

```
nix flake new -t github:aos/flake-templates#go-shell
```
