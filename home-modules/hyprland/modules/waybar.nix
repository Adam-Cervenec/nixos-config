{ config, device, lib, ... }:

let
  cfg = device.modules.hyprland.modules.waybar or {};
  #stylix = device.modules.stylix;

  color = name:
    "#${config.lib.stylix.colors.${device.theme.colors.${name}}}";
in
{
  programs.waybar = {
    enable = true;

    settings = {
      #ToDo: dodelat
      secondBar = {
        layer = "top";
        position = "top";
        height = 15;
        output = cfg.monitor.second;

        modules-left = [ ];
        modules-center = [  ];
        modules-right = [  ];



      };

      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = cfg.monitor.main;

        modules-left = [ "battery"  "cpu" "memory" "disk" "hyprland/submap" ];
        modules-center = ["hyprland/workspaces" ];
        modules-right = [ "battery" "tray" "network" "wireplumber#sink" "wireplumber#source" "hyprland/language"  "clock" ];



        "hyprland/workspaces" = {
          format = "{name}";

          persistent-workspaces = {
            "*" = [ 1 2 3 4 5 6 ];
          };
        };

        "hyprland/language" = {
          format = "{short}";
        };

        "hyprland/submap" = {
          format = " {}";
          max-length = 12;
          tooltip = false;
          always-on = true;
        };



        "battery" = {
          bat = "BAT1";
          interval = 60;

          format = "{capacity}% {icon}";

          format-icons = {
            default = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
            charging = [ "󰢟" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
          };
        };


        "clock" = {
          interval = 1;
          tooltip = true;

          format = "{:%H.%M}";
          tooltip-format = "{:%Y-%m-%d}";
        };

        "network" = {
          interface = device.hardware.network.interface;

          format = "{ifname}";
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ifname} ";
          format-disconnected = "";

          tooltip-format = "{ifname}";
          tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          tooltip-format-ethernet = "{ifname} ";
          tooltip-format-disconnected = "Disconnected";

          max-length = 50;

          on-click = "nm-connection-editor";
        };

        "wireplumber#sink" = {
          format = "{volume}% {icon}";
          format-muted = "󰖁";
          format-icons = [ "" "" "" ];

          on-click = "hyprpwcenter";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

          scroll-step = 5;
        };

        "wireplumber#source" = {
          node-type = "Audio/Source";

          format = "{volume}% ";
          format-muted = "";

          on-click = "hyprpwcenter";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

          scroll-step = 5;
        };

        





        "memory" = {
          interval = 10;
          format = " {used:0.1f}/{total:0.1f}G";
          max-length = 12;
        };

        "disk" = {
          interval = 30;
          format = " {used}";
          unit = "TB";
        };

        "cpu" = {
          interval = 1;
          format = " {icon0}{icon1}{icon2}{icon3} {usage:>2}%";
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
        };

      };
    };


    style =
      ''
        * {
          border: none;
          border-radius: 0;
          font-size: ${cfg.font-size};
          min-height: 0;
          margin: 0;
          padding: 0;
        }

        window#waybar {
          background: transparent;
          color: ${color "foreground"};
        }

        #workspaces {
          transition: all 300ms ease-in-out;
        }

        #workspaces button {
          transition: all 300ms ease-in-out;
          background: ${color "background"};
          color: ${color "special"};
          padding: 0 6px;
          margin: 3px;
          border-radius: 666px;
        }

        #workspaces button.active {
          transition: all 300ms ease-in-out;
          min-width: 40px;
          background: ${color "background"};
          color: ${color "foreground"};
          font-weight: bold;

          border: none;
          border-bottom: none;
          box-shadow: none;

        }
      '';
  };
}