{ device, config, lib, ... }:
let
  cfg = device.modules.hyprland.aesthetics;
  color = name:
    "rgb(${config.lib.stylix.colors.${device.theme.colors.${name}}})";
in
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = cfg.gaps / 2;
      gaps_out = cfg.gaps;
      border_size = 3;

      "col.active_border" = lib.mkForce "${color "primary"} ${color "special"} 169deg";
    };

    decoration = {
      rounding = 7;

      shadow = {
        enabled = cfg.shadow.enable;
        range = 20;
        render_power = 3;
      };

      blur = {
        enabled = cfg.blur.enable;
        size = 4;
        passes = 3;
        vibrancy = 0.1696;
      };

      active_opacity = cfg.opacity.active;
      inactive_opacity = cfg.opacity.inactive;
    };

    windowrule = [
      {
        name = "Floating windows";
        "match:float" = true;
        
        #no_blur = true;
        opacity = cfg.opacity.floatOverride;
        border_color = color "secondary";

      }
      {
        name = "Fullscreen windows";
        "match:fullscreen" = true;
        opacity = cfg.opacity.fullscreenOverride;
        no_shadow = true;
      }
    ];
  };
}