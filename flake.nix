{
  description = "Development shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, ... }: flake-parts.lib.mkFlake { inherit inputs; } ({ ... }: {
    systems = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];

    perSystem = { config, pkgs, ... }: {
      imports = [
        ./shells/c.nix
        ./shells/cpp.nix
        ./shells/bun.nix
        ./shells/go.nix
        ./shells/jupyterlab.nix
        ./shells/laravel.nix
        ./shells/nodejs.nix
        ./shells/python.nix
      ];
    };
  });
}
