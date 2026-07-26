{ lib, pkgs, cfg, ... }:

let
  thunar = cfg.profile.thunar or {};
in
lib.mkIf (thunar.enable or false) {

  home.packages = with pkgs; [
    thunar
    thunar-volman
    gvfs
    tumbler
    ntfs3g
  ];
}