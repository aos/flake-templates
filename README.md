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

```
nix flake init -t biscuits#latex-report
```
