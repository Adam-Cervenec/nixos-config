{ config, pkgs, lib, device, ... }:

#define variable cfg for path
let
  cfg = device.modules.hyprland or {};
in
{

  imports = [
    ./monitors.nix
    ./aesthetics.nix
    ./keybindings.nix
    ./environment.nix

    #modules
    ./modules/clipboard.nix
    ./modules/hyprlauncher.nix
    ./modules/wallpaper.nix
  ];

  config = lib.mkIf (cfg.enable or false) {
    home.packages = with pkgs; [


      #hyprland temporary
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
      source = ~/nixos-config/hypr/autostart.conf
      source = ~/nixos-config/hypr/input-rules.conf
    '';
    };
  };
}