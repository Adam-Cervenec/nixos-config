{device, pkgs, ... }:

let
  cfg = device.modules.hyprland or {};
in
{
  home.packages = [ pkgs.copyq ];

  wayland.windowManager.hyprland.settings = {
    bindr = [ "${cfg.keybindings.mod}, ${cfg.keybindings.hyprlauncher}, exec, hyprlauncher" ];
  };

  services.hyprlauncher = {
    enable = true;
    settings = {
      cache.enable = true;
      finders = {
        desktop_icons = true;
        math_prefix = "=";
      };
      general = {
        grab_focus = false;
      };
      ui = {
        window_size = "969 420";
      };
    };
  };
}