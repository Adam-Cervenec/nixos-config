{ config, pkgs, lib, cfg, ... }:

#define path
let
    profile = cfg.profile or {};
in
lib.mkIf (profile.hyprland.enable or false) {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
}