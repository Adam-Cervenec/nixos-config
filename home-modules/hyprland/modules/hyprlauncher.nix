{device, pkgs, ... }:

let
  cfg = device.modules.hyprland.modules.launcher or {};
  mod = device.modules.hyprland.keybindings.mod or {};
in
{
  home.packages = [ pkgs.copyq ];

  services.hyprlauncher = {
    enable = true;
    settings = {
      cache.enable = true;
      finders = {
        desktop_icons = true;
        math_prefix = "=";
      };
      general = {
        grab_focus = true;
      };
      ui = {
        window_size = "969 420";
      };
    };
  };
}