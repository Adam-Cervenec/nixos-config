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
  };
}