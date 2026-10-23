{ lib, modulesRoot }:

directory: moduleConfig:

let
    relativePath = lib.removePrefix "${toString modulesRoot}/" (toString directory);

    allPathParts = lib.splitString "/" relativePath;

    pathParts = builtins.tail allPathParts;

    currentConfig = lib.foldl' (config: name: config.${name} or { }) moduleConfig pathParts;

    hasEnabled =
        value:
        if builtins.isAttrs value then
            (value.enable or false)
            || lib.any hasEnabled (builtins.attrValues (builtins.removeAttrs value [ "enable" ]))
        else
            false;

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
        && hasEnabled (currentConfig.${name} or { })
    ) (builtins.attrNames entries);

in
map (name: directory + "/${name}") files
++ map (name: directory + "/${name}/default.nix") directories
