{ cfg, myLib, ... }:

{
    imports = myLib.importModules ./. (cfg.profile.modules or { });
}
