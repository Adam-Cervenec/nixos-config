{ lib, pkgs, cfg, ... }:

let
  cfgThunar = cfg.profile.thunar or {};
in
lib.mkIf (cfgThunar.enable or false) {

  home.packages = with pkgs; [
    thunar
    thunar-volman
    gvfs
    tumbler
    ntfs3g
  ];
}