{ config, pkgs, lib, cfg, ... }:

#define path
let
    isEnabled = cfg.profile.hyprland.enable or {};
in
lib.mkIf (isEnabled or false) {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
}