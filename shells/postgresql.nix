{ config, lib, pkgs, ... }:
let
  tools = with pkgs; [ ];
  help-text =
    # sh
    ''
      echo "Available Commands:"
      echo "  ?                 (alias for help)"
      echo "  help              Print this available commands"
      echo "  pg-start          Start postgres"
      echo "  pg-stop           Stop postgres"
      echo
    '';
  help = (pkgs.writeShellScriptBin "help" help-text);
  scripts = with pkgs; [
    (writeShellScriptBin "?" help-text)
    (writeShellScriptBin "pg-start" ''
      echo "Start PostgreSQL..."
    '')
    (writeShellScriptBin "pg-stop" ''
      echo "Stop PostgreSQL..."
      # ...
    '')
    # (writeShellScriptBin "..." ''?'')
  ];
in
{
  devShells.postgresql = pkgs.mkShell {
    buildInputs = with pkgs; [ ];
    nativeBuildInputs = with pkgs; [ ];
    packages = with pkgs; [
      postgresql_17 # Powerful, open source object-relational database system
    ]
    ++ tools
    ++ scripts;

    shellHook = ''
      ${help}/bin/help
    '';
  };
}

