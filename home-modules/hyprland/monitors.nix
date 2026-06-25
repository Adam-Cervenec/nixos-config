{ device, ... }:

#define variable cfg for path
let
  cfg = device.modules.hyprland or {};
in
{
  wayland.windowManager.hyprland.settings.monitor = cfg.monitors;
}