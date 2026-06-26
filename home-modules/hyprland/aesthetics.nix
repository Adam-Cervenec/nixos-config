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
        size = 4;
        passes = 3;
        vibrancy = 0.1696;
      };

      active_opacity = 0.97;
      inactive_opacity = 0.9;
    };

    #windowrule = [
      #{
        #name = "Floating windows";
        #"match:floating" = true;

      #}
      #{
        #name = "Alacritty transparency";
        #"match:class" = "^Alacritty$";
        #opacity = "0.85 override 0.7 override";
      #}
    #];
  };
}