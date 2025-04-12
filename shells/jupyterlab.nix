{ config, pkgs, ... }:
{
  devshells.jupyter = {
    packages = with pkgs; [
      (pkgs.python313.withPackages (p: with p; [
        jupyterlab
        pandas
        numpy
        graphviz
        matplotlib
      ]))
      ruff # Extremely fast Python linter and code formatter
      uv # Extremely fast Python package installer and resolver, written in Rust
    ];
  };
}
