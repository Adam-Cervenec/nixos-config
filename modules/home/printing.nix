{ pkgs, ... }:
{
    home.packages = with pkgs; [

        #3D
        #cura-appimage
        freecad
        orca-slicer
    ];
}
