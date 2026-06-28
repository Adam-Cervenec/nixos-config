{ pkgs, device, lib, ... }:

let
  cfg = device.modules.hyprland.modules.wallpaper;
in
{
  home.packages = with pkgs; [
    waypaper
    #mpvpaper

    awww
  ];

  wayland.windowManager.hyprland.settings = {    

    windowrule = [
      {
        name = "Waypaper";
        "match:class" = "^waypaper$";

        float = "on";
        center = "on";
        size = "800 500";
      }
    ];
    exec-once = lib.optionals (cfg.autostart or false) [
      #"mpvpaper -o \"no-audio --loop-playlist shuffle --image-display-duration=${cfg.duration}\" ${cfg.monitor} ~/nixos-config/assets/wallpapers"
      "uwsm app -- waypaper --random"
    ];
  };

  # systemd user service: change wallpaper
  systemd.user.services.wallpaper-random = {
    Unit = {
      Description = "Random wallpaper via waypaper";
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.waypaper}/bin/waypaper --random";
    };
  };

  #  timer: periodic wallpaper change
  systemd.user.timers.wallpaper-random = lib.mkIf cfg.loop {
    Unit = {
      Description = "Timer for random wallpaper rotation";
    };

    Timer = {
      OnBootSec = "2min";
      OnUnitActiveSec = "${toString cfg.duration}s";
      Persistent = true;
    };

    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}