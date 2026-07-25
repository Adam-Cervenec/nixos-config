{ config, pkgs, device, lib, ... }:

#define variable cfg for path
let
  cfg = device.modules.alacritty or {};
in

# Enable Alacritty if configured
lib.mkIf (cfg.enable or false) {
  programs.alacritty = {
    enable = true;
    settings = {}; # due to Stylix
  };
}