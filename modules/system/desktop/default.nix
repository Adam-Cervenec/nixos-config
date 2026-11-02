{ myHost, myLib, ... }:

{
    imports = myLib.importModules ./. (myHost.profile.modules or { });
}
