{
    config,
    pkgs,
    cfg,
    lib,
    ...
}:
let
    prismCfg = cfg.profile.prism or { };
in
lib.mkIf (prismCfg.enable or false) {
    home.packages = with pkgs; [
        prismlauncher
        optifine
    ];
}
