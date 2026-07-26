{ lib, device, ... }:

#define variable cfg for path
let
  cfg = device.modules.thunar or {};
in

#if git is enabled, define git...
lib.mkIf (cfg.enable or false) {
  services.udisks2.enable = true;
  services.gvfs.enable = true;
}