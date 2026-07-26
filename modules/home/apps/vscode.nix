{ config, pkgs, lib, cfg, ... }:

#define variable cfg for path and for extensions
let
  vscode = cfg.profile.vscode or {};
in
lib.mkIf (vscode.enable or false) {
  programs.vscode = {
    enable = true;
  };
}