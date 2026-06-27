{ pkgs, device, lib, ... }:

let
  cfg = device.modules.hyprland.wallpaper;
in
{
  home.packages = with pkgs; [
    waypaper
    mpvpaper
  ];

  wayland.windowManager.hyprland.settings = {

    windowrule = [
      {
        name = "Waypaper";
        "match:class" = "^waypaper$";

        float = "on";
        center = "on";
        size = "800 500";
      }
    ];
    exec-once = lib.optionals (cfg.autostart or false) [
      "mpvpaper -o \"no-audio --loop-playlist shuffle --image-display-duration=${cfg.duration}\" ALL ~/nixos-config/assets/wallpapers"
    ];
  };
}