{
  pkgs ? import <nixpkgs> { },
  lib ? pkgs.lib,
  version ? 20,
  ...
}:

pkgs.mkShell {
  packages = with pkgs; [ ];
  nativeBuildInputs = with pkgs; [ ];
  buildInputs =
    with pkgs;
    [
      yarn
      pnpm
    ]
    ++ lib.optionals (version == 18) [ nodejs_18 ]
    ++ lib.optionals (version == 20) [ nodejs_20 ]
    ++ lib.optionals (version == 22) [ nodejs_22 ];

  shellHook = ''
    echo "--------------------------------------------------------------------------------"
    echo " > node --version: $(node --version)"
    echo " > npm --version:  $(npm --version)"
    echo "--------------------------------------------------------------------------------"
  '';
}
