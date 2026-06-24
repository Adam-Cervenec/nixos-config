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
}