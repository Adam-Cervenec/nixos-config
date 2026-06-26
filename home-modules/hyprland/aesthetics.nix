{ device, config, lib, ... }:
let
  color = name:
    "rgb(${config.lib.stylix.colors.${device.theme.colors.${name}}})";
in
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 7.5;
      gaps_out = 15;
      border_size = 3;

      "col.active_border" = lib.mkForce "${color "primary"} ${color "special"} 169deg";
    };

    decoration = {
      rounding = 7;

      shadow = {
        enabled = true;
        range = 20;
        render_power = 3;
      };

      blur = {
        enabled = true;
        size = 4;
        passes = 3;
        vibrancy = 0.1696;
      };

      active_opacity = 0.97;
      inactive_opacity = 0.9;
    };

    windowrule = [
      {
        name = "Floating windows";
        "match:float" = true;
        
        no_blur = true;
        opacity = "1 override 0.8 override";
        border_color = color "secondary";

      }
    ];
  };
}