{ config, pkgs, ... }:
{
  devShells.bun = pkgs.mkShell {
    packages = with pkgs; [
      bun # Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one
    ];
  };
}
