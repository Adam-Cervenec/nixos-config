{ config, pkgs, cfg, ... }:
let
    cfg3d = cfg.printing or {};
in
lib.mkIf (cfg3d.enable or false) {
    home.packages = with pkgs; [

        #3D
        cura-appimage
        #freecad
    ];
}