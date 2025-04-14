{ config, pkgs, ... }:
{
  devShells.c = pkgs.mkShell {
    buildInputs = with pkgs; [
      # ...
    ];

    nativeBuildInputs = with pkgs; [
      gcc # GNU Compiler Collection, version 14-20241116 (wrapper script)
      gnumake # Tool to control the generation of non-source files from sources
    ];

    packages = with pkgs; [
      gdb # GNU Project debugger
      ccls # C/c++ language server powered by clang
      # valgrind # Debugging and profiling tool suite
    ];
  };
}
