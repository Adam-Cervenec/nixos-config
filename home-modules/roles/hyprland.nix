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

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      general = {
        gaps_in = 5;
      };
    };
  };
}