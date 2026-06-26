{ config, pkgs, device, lib, ... }:

#define variables for paths in device.nix
let
  cfg = "device.modules.thunar" ;
  install = cfg.install or [];
  getInstall = path:
    let
      pkg = lib.attrByPath (lib.splitString "." path) null pkgs;
    in
      if pkg == null then
        throw "Package '${path}' does not exist."
      else
        pkg;
in
lib.mkIf (cfg.enable or false) {
  imports = home.packages = map getInstall install
}