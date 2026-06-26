{ config, pkgs, lib, device, ... }:

#define variable cfg for path
let
  cfg = device.modules.hyprland or {};
in
{

  imports = [
    ./monitors.nix

    #modules
    ./modules/clipboard.nix
    ./modules/hyprlauncher.nix
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
      };

    extraConfig = ''
      source = ~/nixos-config/hypr/variables.conf
      source = ~/nixos-config/hypr/environment.conf
      source = ~/nixos-config/hypr/autostart.conf
      source = ~/nixos-config/hypr/input-rules.conf
      source = ~/nixos-config/hypr/keybindings.conf
    '';
    };
  };
}