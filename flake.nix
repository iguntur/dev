{
  description = "Development shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs@{ self, nixpkgs, ... }:
    inputs.flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells = {
          default = pkgs.mkShell {
            shellHook = ''
              ${pkgs.figlet}/bin/figlet -f big -w 200 "Development Shell" | ${pkgs.lolcat}/bin/lolcat
            '';
          };

          nodejs-18 = import ./shells/nodejs.nix {
            inherit pkgs;
            version = 18;
          };
          nodejs-20 = import ./shells/nodejs.nix {
            inherit pkgs;
            version = 20;
          };
          nodejs-22 = import ./shells/nodejs.nix {
            inherit pkgs;
            version = 22;
          };

          nodejs-lts = self.devShells.${system}.nodejs-20;
          nodejs = self.devShells.${system}.nodejs-lts;

          go = pkgs.mkShell {
            packages = with pkgs; [ ];
            nativeBuildInputs = with pkgs; [ go ];
            buildInputs = with pkgs; [ gopls ];
            shellHook = ''
              go version
            '';
          };
        };
      }
    );
}
