{ lib, pkgs, cfg, ... }:

let
  thunar = cfg.profile.thunar or {};
in
lib.mkIf (thunar.enable or false) {
  programs.thunar.enable = true;

  home.packages = with pkgs; [
    thunar
    thunar-volman
    gvfs
    tumbler
    ntfs3g
  ];
}