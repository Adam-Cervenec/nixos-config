{ device, ... }:

{
  wayland.windowManager.hyprland.settings.monitor = device.monitors;
}