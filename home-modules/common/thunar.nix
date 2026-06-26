{ lib, pkgs, device, ... }:

let
  cfg = device.modules.thunar or {};

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

  home.packages =
    map getInstall (cfg.install or []);

}