{ lib, ... }:

let
    entries = builtins.readDir ./.;

    imports = lib.mapAttrsToList (
        name: type:
        if type == "regular" && name != "default.nix" && lib.hasSuffix ".nix" name then
            ./. + "/${name}"
        else if type == "directory" then
            ./. + "/${name}"
        else
            null
    ) entries;
in
{
    imports = builtins.filter (x: x != null) imports;
}
