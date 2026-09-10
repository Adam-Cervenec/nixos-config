{
    config,
    cfg,
    lib,
    pkgs,
}:

{
    home.packages = with pkgs; [
        brightnessctl
    ];
}
