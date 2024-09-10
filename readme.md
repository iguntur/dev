# Development Shell

> My `devShell` using Nix.


## Usage

### Golang

```sh
nix develop github:iguntur/dev#go
```

### NodeJS

```sh
nix develop github:iguntur/dev#nodejs     # alias for #nodejs-lts
nix develop github:iguntur/dev#nodejs-lts # alias for #nodejs-20
nix develop github:iguntur/dev#nodejs-18  # use nodejs version 18
nix develop github:iguntur/dev#nodejs-20  # use nodejs version 20
nix develop github:iguntur/dev#nodejs-22  # use nodejs version 22
```

## Show available dev shells

```sh
nix flake show github:iguntur/dev
```

## License

[MIT](https://opensource.org/licenses/MIT) © [Guntur Poetra](https://github.com/iguntur)
