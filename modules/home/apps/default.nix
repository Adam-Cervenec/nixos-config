{
    cfg,
    myLib,
    lib,
    pkgs,
    ...
}:

{
    imports = myLib.importModules ./. (cfg.profile.modules or { });
    home.packages = map (name: lib.attrByPath (lib.splitString "." name) null pkgs) (
        cfg.profile.apps.packages or [ ]
    );
}

