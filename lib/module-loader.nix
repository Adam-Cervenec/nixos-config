{ lib, modulesRoot }:

directory: moduleConfig:

let
    relativePath = lib.removePrefix "${toString modulesRoot}/" (toString directory);

    pathParts = lib.splitString "/" relativePath;

    currentConfig = lib.foldl' (config: name: config.${name} or { }) moduleConfig pathParts;

    entries = builtins.readDir directory;

    files = lib.filter (
        name:
        entries.${name} == "regular"
        && name != "default.nix"
        && lib.hasSuffix ".nix" name
        && (currentConfig.${lib.removeSuffix ".nix" name}.enable or false)
    ) (builtins.attrNames entries);

    directories = lib.filter (
        name:
        entries.${name} == "directory"
        && builtins.pathExists (directory + "/${name}/default.nix")
        && (currentConfig.${name}.enable or false)
    ) (builtins.attrNames entries);

in
map (name: directory + "/${name}") files
++ map (name: directory + "/${name}/default.nix") directories
