{ lib }:

directory:
let
    entries = builtins.readDir directory;

    files = lib.filter (
        name: entries.${name} == "regular" && name != "default.nix" && lib.hasSuffix ".nix" name
    ) (builtins.attrNames entries);
in
map (name: directory + "/${name}") files
