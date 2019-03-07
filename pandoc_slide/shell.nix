# shell.nix for nix-shell

{ pkgs ? import <nixpkgs> {}, compiler ? "default" }:

with pkgs;

let
  revealjs = nodePackages."reveal.js";
in
  mkShell {
    name = "${compiler}-sh";

    buildInputs = [
      pandoc revealjs
    ];

    shellHook = ''
      export PS1="\[\033[1;32m\][$name:\W]\n$ \[\033[0m\]"

      # create symlink to revealjs
      export REVEALJS=${revealjs}/lib/node_modules/reveal.js
      # echo "reveal.js @ $REVEALJS"
      ln -sf $REVEALJS
    '';
}
