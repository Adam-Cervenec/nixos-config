{ lib, cfg, ... }:

#define variable cfg for path
let
  cfgThunar = cfg.profile.thunar or {};
in

#if git is enabled, define git...
lib.mkIf (cfgThunar.enable or false) {
  services.udisks2.enable = true;
  services.gvfs.enable = true;
}