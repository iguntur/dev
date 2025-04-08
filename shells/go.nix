{ config, pkgs, ... }:
{
  devshells.go = {
    packages = with pkgs; [
      go
      gopls
    ];
  };
}
