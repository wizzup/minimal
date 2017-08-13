{ pkgs ? import <nixpkgs> {} }:

with pkgs;

stdenv.mkDerivation {
  name = "auto-shell";
  buildInputs = [ automake autoconf ];

  shellHook = ''
    export PS1="\[\033[1;32m\][nix-at:\w]\n$ \[\033[0m\]"
  '';
}

