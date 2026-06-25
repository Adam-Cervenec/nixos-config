{ config, pkgs, lib, device, ... }:

#define variable cfg for path and for extensions
let
  cfg = device.modules.vscode or {};
  extensions = cfg.extensions or [];
  getExtension = path:
    lib.attrByPath (lib.splitString "." path) null pkgs.vscode-extensions;
in
lib.mkIf (cfg.enable or false) {
  programs.vscode = {
    enable = true;

    profiles.default.extensions = map getExtension extensions;
  };
}