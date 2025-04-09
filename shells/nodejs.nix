{ config, pkgs, ... }:
let
  mkNode = { version ? 22 }: {
    packages = with pkgs; [
      yarn
      pnpm
      nodemon
      typescript
    ]
    ++ lib.optionals (version == 18) [ nodejs_18 ]
    ++ lib.optionals (version == 20) [ nodejs_20 ]
    ++ lib.optionals (version == 22) [ nodejs_22 ]
    ++ lib.optionals (version == 23) [ nodejs_23 ];
  };
in
{
  devshells = rec {
    nodejs-18 = mkNode { version = 18; };
    nodejs-20 = mkNode { version = 20; };
    nodejs-22 = mkNode { version = 22; };
    nodejs-23 = mkNode { version = 23; };
    nodejs-lts = nodejs-22;
    nodejs-latest = nodejs-23;
    nodejs = nodejs-lts;
  };
}
