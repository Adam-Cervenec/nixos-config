{ config, pkgs, cfg, lib, ... }:

#define variable cfg for path
let
  cfgAlacritty = cfg.profile.alacritty or {};
in

# Enable Alacritty if configured
lib.mkIf (cfgAlacritty.enable or false) {
  programs.alacritty = {
    enable = true;
    settings = {}; # due to Stylix
  };
}