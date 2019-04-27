# hello

crated using cabal and cabal2nix

```
$ cabal init --minimal --package-name=hello-cabal --non-interactive

$ cabal2nix --shell . > default.nix
```

build using `nix-build`

```
$ nix-build
```

install using `nix-env`

```
$ nix-env -i -f default.nix
```
