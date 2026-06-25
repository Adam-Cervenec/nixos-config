{ pkgs, ... }:

{
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

  imports = [
    ./monitors.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      general = {
        gaps_in = 15;
      };
    };

  extraConfig = ''
    source = ~/nixos-config/hypr/variables.conf
    source = ~/nixos-config/hypr/monitors.conf
    source = ~/nixos-config/hypr/environment.conf
    source = ~/nixos-config/hypr/autostart.conf
    source = ~/nixos-config/hypr/input-rules.conf
    source = ~/nixos-config/hypr/keybindings.conf
  '';
  };
}