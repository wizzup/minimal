# shell.nix for nix-shell
#
{ pkgs ? import <nixpkgs> {} }:

let
  hs = pkgs.haskellPackages.ghcWithHoogle (self: with self; [
        QuickCheck
        ]);
in
pkgs.stdenv.mkDerivation {
  name = "haskell-shell";
  buildInputs = with pkgs.haskellPackages; [ hs ghc-mod hlint ];

  shellHook = ''
    export PS1="\[\033[1;32m\][ns-hs:\w]\n$ \[\033[0m\]"
    eval "$(egrep ^export "$(type -p ghc)")"
  '';
}
