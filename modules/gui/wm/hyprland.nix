{ config, pkgs, lib, device, ... }:

#define variable cfg for path
let
  cfg = device.modules.hyprland or {};
in
lib.mkIf (cfg.enable or false) {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

}