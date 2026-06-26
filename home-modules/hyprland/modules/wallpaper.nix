{
  home.packages = with pkgs; [
    awww
    waypaper
  ];

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "awww daemon"
    ];
  }
}