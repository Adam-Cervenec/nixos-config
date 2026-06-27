{ pkgs, ... }:

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
    exec-once = [
      "mpvpaper -o \"no-audio --loop-playlist shuffle --image-display-duration=120\" ALL ~/nixos-config/assets/wallpapers"
    ];
  };
}