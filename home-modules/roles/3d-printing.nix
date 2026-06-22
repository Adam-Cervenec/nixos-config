{ config, pkgs, ... }:
{
    home.packages = with pkgs; [

        #3D
        cura-appimage
        #freecad
    ];
}