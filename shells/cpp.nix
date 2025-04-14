{ config, pkgs, ... }:
{
  devShells.cpp = pkgs.mkShell {
    buildInputs = with pkgs; [
      # ...
    ];

    nativeBuildInputs = with pkgs; [
      clang # C language family frontend for LLVM (wrapper script)
      cmake # Cross-platform, open-source build system generator
      gnumake # Tool to control the generation of non-source files from sources
    ];

    packages = with pkgs; [
      gdb # GNU Project debugger
      ccls # C/c++ language server powered by clang
    ];
  };
}
