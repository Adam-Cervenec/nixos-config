{ lib }:

{
    importModules = import ./module-loader.nix {
        inherit lib;
        modulesRoot = ../modules;
    };

    importAll = import ./import-all.nix { inherit lib; };
}
