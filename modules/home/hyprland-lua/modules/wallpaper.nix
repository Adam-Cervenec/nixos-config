{
    pkgs,
    myHost,
    lib,
    ...
}:

let
    wallpaper = myHost.profile.wallpaper;
in
{
    home.packages = with pkgs; [
        waypaper
        #mpvpaper

        awww
    ];

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
