{ config, pkgs, ... }:
{
  devshells.bun = {
    packages = with pkgs; [
      bun # Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one
    ];
  };
}
