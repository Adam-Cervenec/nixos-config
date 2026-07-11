{ config, device, lib, ... }:

let
  hyprland = device.modules.hyprland or {};

  monitorNames = map
    (monitor: builtins.head (lib.splitString "," monitor))
    device.modules.hyprland.monitors;
in
{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = monitorNames;

        modules-center = [ "hyprland/workspaces" "hyprland/submap"];

      };
    };
  };
}