{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 7.5;
      gaps_out = 15;
      border_size = 3;
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
        size = 6;
        passes = 2;
      };

      active_opacity = 0.97;
      inactive_opacity = 0.9;
    };

    windowrule = [
      {
        name = "Alacritty transparency";
        "match:class" = "^Alacritty$";
        opacity = "0.85 0.7";
      }
    ];
  };
}