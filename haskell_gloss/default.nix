{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;

haskell.lib.buildStackProject {
  name = "gloss-project";

  src = ./.;

  buildInputs = [ mesa freeglut ];

  shellHook = ''
    # nvidia swrast workaround
    export LD_LIBRARY_PATH=/run/opengl-driver/lib:$LD_LIBRARY_PATH
    export LIBGL_DEBUG=verbose
  '';
}
