{ config, pkgs, cfg, lib, ... }:
let
    cfg3d = cfg.profile.printing or {};
in
lib.mkIf (cfg3d.enable or false) {
    home.packages = with pkgs; [

        #3D
        cura-appimage
        #freecad
    ];
}