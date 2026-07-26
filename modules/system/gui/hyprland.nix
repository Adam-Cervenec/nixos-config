{ config, pkgs, lib, cfg, ... }:

#define path
let
  isHyprlandEnabled = cfg.settings.profile.enable.hyprland or {};
in
lib.mkIf (isHyprlandEnabled or false) {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
}