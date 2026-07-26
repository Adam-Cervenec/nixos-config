{ config, cfg, lib, pkgs, ... }:

let
  monitors = cfg.waybar.monitors;
  style = cfg.style;
  #stylix = device.modules.stylix;

  color = name:
    "#${config.lib.stylix.colors.${style.colors.${name}}}";
in
{
  programs.waybar = {
    enable = true;

    settings = {

      mainBar = {
        layer = "top";
        position = "top";
        margin-top = 4;
        height = 25;
        output = monitors;

        modules-left = [ "cpu" "memory" "disk" "hyprland/submap" ];
        modules-center = ["hyprland/workspaces" ];
        modules-right = [ "tray" "battery" "power-profiles-daemon" "network" "wireplumber#sink" "wireplumber#source" "hyprland/language"  "clock" ];



        "hyprland/workspaces" = {
          format = "{name}";

          persistent-workspaces = {
            "*" = [ 1 2 3 4 5 6 7 8 9 10 ];
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
          interval = 1;

          format = "{capacity}% {icon} {power:.0f} W";

          states = {
            warning = 25;
            critical = 10;
          };

          format-icons = {
            default = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
            charging = [ "󰢟" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅" ];
          };
        };

        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip = true;
          tooltip-format = ''
            Power profile: {profile}
            Driver: {driver}
          '';

          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };


        "clock" = {
          interval = 1;
          tooltip = false;

          format = "󰃰 {:%d.%m. %H:%M}";
        };

        "network" = {
          #interface = ; # todo dedalat a vymyslet

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
          
          states = {
            low = 0;
          };
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
          format = "  {used:0.1f}/{total:0.1f}G";
          max-length = 12;          
          
          states = {
            warning = 70;
            critical = 90;
          };
        };

        "disk" = {
          interval = 30;
          format = "  {used}";

          states = {
            warning = 70;
            critical = 90;
          };
        };

        "cpu" = {
          interval = 1;
          format = "  {icon0}{icon1}{icon2}{icon3} {usage:>2}%";
          format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          
          states = {
            warning = 70;
            critical = 90;
          };
        };

      };
    };


    style =
      ''
        * {
          border: none;
          border-radius: 0;
          font-size: ${style.fonts.size.waybar}px;
          min-height: 0;
          margin: 0;
          padding: 0;
        }

        window#waybar {
          background: transparent;
          color: ${color "foreground"};
        }


        #workspaces button {
          transition: all 300ms ease-in-out;
          background: ${color "background"};
          color: ${color "primary"};
          padding: 0 4px;
          margin: 0 2px;
          font-weight: 400;

          border-radius: 666px;
          border: 3px solid ${color "primary"};
        }

        #workspaces button.active {
          min-width: 40px;
          background: ${color "background"};
          color: ${color "foreground"};
          font-weight: 900;

          border: 3px solid ${color "special"};
        }


        #clock,  #language, #wireplumber, #network, #battery, #cpu, #memory, #disk, #submap, #power-profiles-daemon {
          transition: all 600ms ease-in-out;

          font-weight: 500;
          background: ${color "background"};
          color: ${color "foreground"};
          padding: 0 15px;
          margin: 0 2px;
          border-radius: 11px;
          border: 3px solid ${color "primary"};
        }

        #wireplumber:hover, #network:hover {
          background: ${color "foreground"};
          color: ${color "background"};
          border: 3px solid ${color "special"};
        }

        #battery.warning, #cpu.warning, #ram.warning, #disk.warning, #power-profiles-daemon.balanced {
          background: ${color "background"};
          color: ${color "secondary"};
          border: 3px solid ${color "secondary"};
        }

        #network.disconnected, #wireplumber.muted, #battery.critical, #cpu.critical, #ram.critical, #disk.critical, #power-profiles-daemon.performance {
          background: ${color "background"};
          color: ${color "warning"};
          border: 3px solid ${color "warning"};
        }


      '';
  };
}