{ config, pkgs, ... }:
{
  devshells.hello = {
    packages = with pkgs; [
      cowsay
    ];
    # commands = [
    #   {
    #     help = "Print hello world";
    #     name = "hello";
    #     command = ''
    #       echo "hello world"
    #     '';
    #   }
    # ];
  };
}
