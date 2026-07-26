{ config, pkgs, lib, cfg, ... }:

#define variable cfg for path and for extensions
let
  cfgVscode = cfg.profile.vscode or {};
in
lib.mkIf (cfgVscode.enable or false) {
  programs.vscode = {
    enable = true;
  };
}