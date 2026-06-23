{ config, pkgs, ... }:


{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  xdg.configFile."hypr/hyprland.conf".source = ./hyprland.conf
}