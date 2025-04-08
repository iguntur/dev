{ config, pkgs, ... }:
{
  devshells.hello = {
    # buildInputs = with pkgs; [ ];
    # nativeBuildInputs = with pkgs; [ ];
    packages = [
      pkgs.cowsay
    ];
    commands = [
      {
        help = "Print hello world";
        name = "hello";
        command = ''
          echo "hello world"
        '';
      }
    ];
  };
}
