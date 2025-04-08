{ config, pkgs, ... }: {
  devshells.laravel = {
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
