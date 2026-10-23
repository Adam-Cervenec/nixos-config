{
    pkgs,
    ...
}:
{
    home.packages = with pkgs; [
        prismlauncher
        optifine
    ];
}
