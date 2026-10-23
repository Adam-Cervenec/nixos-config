{ lib }:

directory: cfg: {
    imports =
        let
            entries = builtins.readDir directory;

            files = lib.filter (
                name:
                entries.${name} == "regular"
                && name != "default.nix"
                && lib.hasSuffix ".nix" name
                && (
                    let
                        moduleName = lib.removeSuffix ".nix" name;
                    in
                    (cfg.${moduleName}.enable or false)
                )
            ) (builtins.attrNames entries);

            directories = lib.filter (
                name: entries.${name} == "directory" && builtins.pathExists (directory + "/${name}/default.nix")
            ) (builtins.attrNames entries);
        in
        map (name: directory + "/${name}") files
        ++ map (name: directory + "/${name}/default.nix") directories;
}
