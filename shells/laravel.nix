{ config, pkgs, ... }:
{
  devShells.laravel = pkgs.mkShell {
    # --------------------------------------------------------------------------------
    # These are runtime dependencies that are required by the package after it is built.
    # --------------------------------------------------------------------------------
    # Use case: Shared libraries like zlib, openssl, or anything needed by the software to function at runtime.
    #
    buildInputs = with pkgs; [
      # ...
    ];

    # --------------------------------------------------------------------------------
    # These are build-time dependencies required only during the build process.
    # --------------------------------------------------------------------------------
    # Use case: cmake, pkg-config, automake, gcc (if only needed for building).
    #
    nativeBuildInputs = with pkgs; [
      # ...
    ];

    # --------------------------------------------------------------------------------
    # Items listed here are added to the shell environment but do not affect builds when used in actual derivations.
    # --------------------------------------------------------------------------------
    # Use case: Specifying dependencies that should be available in the interactive shell but not necessarily for building derivations.
    #
    packages = with pkgs; [
      # PHP
      php84 # HTML-embedded scripting language
      php84Packages.composer # Dependency Manager for PHP

      # Laravel
      laravel # Laravel application installer

      # Database
      sqlite # Self-contained, serverless, zero-configuration, transactional SQL database engine

      # NodeJS LTS
      nodejs_22 # Event-driven I/O framework for the V8 JavaScript engine
      yarn
      pnpm
    ];
  };
}
