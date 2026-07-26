{ pkgs, cfg, lib, ... }:

let
  wallpaper = cfg.settings.profile.wallpaper;
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
    exec-once = [
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
  systemd.user.timers.wallpaper-random = lib.mkIf wallpaper.loop.enable {
    Unit = {
      Description = "Timer for random wallpaper rotation";
    };

    Timer = {
      OnBootSec = "2min";
      OnUnitActiveSec = "${toString wallpaper.loop.duration}s";
      AccuracySec = "1s";
      Persistent = true;
    };

    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}