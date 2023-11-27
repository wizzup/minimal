{
  description = "bun : hello world";
  nixConfig.bash-prompt-suffix = "🔨";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

  outputs = {
    self,
    nixpkgs,
  }: (
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {inherit system;};

      # need baseline cuz my CPU is old
      bun = pkgs.bun.overrideAttrs (prev: {
        src = pkgs.fetchurl {
          url = "https://github.com/oven-sh/bun/releases/download/bun-v1.0.14/bun-linux-x64-baseline.zip";
          hash = "sha256-7vSYdYzhXdmw+s+HMPGOjVogIgnswu1jWdD3uQsPem8=";
        };
      });

      drv = pkgs.stdenvNoCC.mkDerivation {
        name = "hello";
        src = ./.;
        nativeBuildInputs = [bun];
        dontPatch = true;
        dontConfigure = true;

        buildPhase = ''
          make
        '';

        installPhase = ''
          mkdir -p $out/bin
          install ./hello $out/bin
        '';
      };
    in {
      packages.${system} = {
        inherit bun drv;

        default = drv;
      };
      formatter.${system} = pkgs.alejandra;
    }
  );
}
