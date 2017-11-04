# hello

created using

    stack new --bare hello

build using `stack` in shell

    nix-shell --run 'stack build'

build using `nix-build`

    nix-build

install using `nix-env`

    nix-env -i -f default.nix
