{ config, pkgs, ... }:
{
  devShells.python = pkgs.mkShell {
    packages = with pkgs; [
      python313 # High-level dynamically-typed programming language

      # tools
      ruff # Extremely fast Python linter and code formatter
      uv # Extremely fast Python package installer and resolver, written in Rust
    ];
  };
}
