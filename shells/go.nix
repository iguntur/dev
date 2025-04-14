{ config, pkgs, ... }:
{
  devShells.go = pkgs.mkShell {
    buildInputs = with pkgs; [ ];
    nativeBuildInputs = with pkgs; [
      go # Go Programming language
    ];
    packages = with pkgs; [
      gopls # Official language server for the Go language
      gotools # Additional tools for Go development This package contains tools like: godoc, goimports, callgraph, digraph, stringer or toolstash.
      gotests # Generate Go tests from your source code
      # go-tools # Collection of tools and libraries for working with Go code, including linters and static analysis
      # gomodifytags # Go tool to modify struct field tags
      # iferr # Generate "if err != nil {" block
      # impl # Generate method stubs for implementing an interface
    ];
  };
}
