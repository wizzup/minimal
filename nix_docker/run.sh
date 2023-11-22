docker load < $(nix build .#img --print-out-paths)

docker run hello-docker:latest 

