{
  description = "Development shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    devshell.url = "github:numtide/devshell";
  };

  outputs = inputs@{ flake-parts, ... }: flake-parts.lib.mkFlake { inherit inputs; } ({ ... }: {
    imports = [
      inputs.devshell.flakeModule
    ];

    systems = [
      # systems for which you want to build the `perSystem` attributes
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];

    perSystem = { config, pkgs, ... }: {
      imports = [
        ./shells/bun.nix
        ./shells/go.nix
        ./shells/laravel.nix
        ./shells/nodejs.nix
        ./shells/python.nix
      ];
    };
  });
}
