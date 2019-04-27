{ nixpkgs ? import <nixpkgs> {}, compiler ? "default", doBenchmark ? false }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, stdenv }:
      mkDerivation {
        pname = "hello-cabal";
        version = "0.1.0.0";
        src = ./.;
        libraryHaskellDepends = [ base ];
        doHaddock = false;
        license = "unknown";
        hydraPlatforms = stdenv.lib.platforms.none;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

  drv = variant (haskellPackages.callPackage f {});
  drvWithTools = pkgs.haskell.lib.addBuildDepends drv [ pkgs.cabal-install haskellPackages.doctest ];

in
  if pkgs.lib.inNixShell then drvWithTools.env else drv
