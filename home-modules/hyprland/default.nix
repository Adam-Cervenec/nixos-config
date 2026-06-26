{ config, pkgs, lib, device, ... }:

#define variable cfg for path
let
  cfg = device.modules.hyprland or {};
in
{

  imports = [
    ./monitors.nix
    ./aesthetics.nix
    ./wallpaper.nix

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
      hyprshot
      swaynotificationcenter
      waybar
    ];


    wayland.windowManager.hyprland = {
      enable = true;
      configType = "hyprlang";



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