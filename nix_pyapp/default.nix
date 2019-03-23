{ pkgs ? import <nixpkgs> {} }:

with pkgs;
with python3Packages;

let
  myapp = buildPythonApplication {
    name = "myapp";
    src = ./.;
  };

in
  myapp
