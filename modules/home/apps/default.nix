{
    myHost,
    myLib,
    lib,
    pkgs,
    ...
}:

{
    imports = myLib.importModules ./. (myHost.profile.modules or { });
    home.packages = map (name: lib.attrByPath (lib.splitString "." name) null pkgs) (
        myHost.profile.apps.packages or [ ]
    );
}
