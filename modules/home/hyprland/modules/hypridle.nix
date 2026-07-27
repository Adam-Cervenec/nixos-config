{config, pkgs, cfg, lib ...}:

let
  isHyprlandOn =  cfg.profile.hyprland.enable or false;
in
lib.mkIf (isHyprlandOn) {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };
      listener = [
        {
          on-timeout = "hyprlock";
          timeout = 60 * hypridle.lock-time;
        }
        {
          on-resume = "hyprctl dispatch dpms on";
          on-timeout = "hyprctl dispatch dpms off";
          timeout = 60 * hypridle.black-screen-time;
        }
      ];
    };
  };
}