{
  description = "hello-gol";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = {
    self,
    nixpkgs,
  }: (let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    img = pkgs.dockerTools.buildImage {
      name = "hello-docker";
      tag = "latest";
      copyToRoot = [pkgs.hello];
      config = {
        Cmd = ["/bin/hello"];
      };
    };
  in {
    formatter.${system} = pkgs.alejandra;
    packages.${system} = {
      inherit img;
      default = img;
    };
  });
}
