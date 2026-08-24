{
    cfg,
    lib,
    pkgs,
    ...
}:

let
    cfgEmbedded = cfg.profile.embedded or { };
in
lib.mkIf (cfgEmbedded.enable or false) {

    home.packages = with pkgs; [
        platformio
        avrdude
        clang-tools
    ];
}
