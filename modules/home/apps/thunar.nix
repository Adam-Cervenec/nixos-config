{
    pkgs,
    ...
}:

{

    home.packages = with pkgs; [
        thunar
        thunar-volman
        gvfs
        tumbler
        ntfs3g
    ];
}
