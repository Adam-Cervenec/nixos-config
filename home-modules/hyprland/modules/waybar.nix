{ config, device, lib, ... }:

let
  cfg = device.modules.hyprland.modules.waybar or {};
in
{
  programs.waybar = {
    enable = true;

    settings = {
      secondBar = {
        layer = "top";
        position = "top";
        height = 15;
        output = cfg.monitor.second;

        modules-left = ["hyprland/workspaces" ];
        modules-center = [  ];
        modules-right = [ "battery"  "cpu" "memory" "disk" "temperature" ];



        "memory" = {
          interval = 30;
          format = " {used:0.1f}/{total:0.1f}G";
          max-length = 12;
        };

        "disk" = {
          interval = 30;
          format = " {free}/{total}";
        };

        "cpu" = {
          interval = 1;
          format = " {icon0}{icon1}{icon2}{icon3} {usage:>2}%";
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
        };

      };

      mainBar = {
        layer = "top";
        position = "top";
        height = 15;
        output = cfg.monitor.main;

        modules-left = [ "hyprland/workspaces" "hyprland/submap" ];
        modules-center = [ ];
        modules-right = [ "battery" "tray" "network" "pulseaudio" "hyprland/language"  "clock" ];



        "battery" = {
          format = "{capacity}% {icon}";
          format-icons = [ "" "" "" "" "" ];
        };

        "clock" = {
          format-alt = "{:%a, %d. %b  %H:%M}";
        };

        "hyprland/language" = {
          format = "{short}";
        };

        "hyprland/submap" = {
          format = " {}";
          max-length = 8;
          tooltip = false;
        };

      }; 
    };
  };
}