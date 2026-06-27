

{
  services.swaync = {
    enable = true;

    settings = {
      positionX = "right";
      positionY = "center";
    };
  };
    # autostart
  wayland.windowManager.hyprland.settings.exec-once = [
    "uwsm app -- swaync &"
  ];
}