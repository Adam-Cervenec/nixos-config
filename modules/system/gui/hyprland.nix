{ config, pkgs, lib, cfg, ... }:

lib.mkIf (cfg.profile.hyprland.enable or false) {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
}