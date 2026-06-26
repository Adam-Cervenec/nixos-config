{ config, pkgs, lib, device, ... }:

#define variable cfg for path
let
  cfg = device.modules.hyprland or {};
in
{

  imports = [
    ./monitors.nix
  ];

  config = lib.mkIf (cfg.enable or false) {
    home.packages = with pkgs; [


      #hyprland temporary
      waypaper
      hypridle
      hyprlock
      hyprpaper
      hyprshot
      swaynotificationcenter
      waybar

      # utils for WM
      copyq # clipboard history
    ];


    wayland.windowManager.hyprland = {
      enable = true;
      configType = "hyprlang";

      settings = {
        general = {
          gaps_in = 7.5;
          gaps_out = 15;
          border_size = 3;
        };

        decoration = {
          rounding = 5;
        };

        #hyprlauncher
        bindr = [ "SUPER, SUPER_L, exec, hyprlauncher" ];
        bind = [ "SUPER SHIFT, C, exec, copyq"];

        # autostart
        exec-once = [
          "uwsm app -- copyq --start-server &
        ];
      };


    extraConfig = ''
      source = ~/nixos-config/hypr/variables.conf
      source = ~/nixos-config/hypr/environment.conf
      source = ~/nixos-config/hypr/autostart.conf
      source = ~/nixos-config/hypr/input-rules.conf
      source = ~/nixos-config/hypr/keybindings.conf
    '';
    };

    services.hyprlauncher = {
      enable = true;
      settings = {
        cache.enable = true;
        finders = {
          desktop_icons = true;
          math_prefix = "=";
        };
        general = {
          grab_focus = true;
        };
        ui = {
          window_size = "969 400";
        };
      };
    };
  };
}