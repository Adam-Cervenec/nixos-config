{ pkgs, cfg, ... }:

let
  isHyprlandOn =  cfg.profile.hyprland.enable or false;
in
lib.mkIf (isHyprlandOn) {
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