{ lib }:

{
    importModules = import ./module-loader.nix { inherit lib; };
}
