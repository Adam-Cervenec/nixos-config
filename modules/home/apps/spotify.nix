{ pkgs, ... }:

{
    home.packages = [ pkgs.spotify ];
    xdg.desktopEntries.spotify-wayland = {
        name = "Spotify";
        genericName = "Music Player";
        exec = "${pkgs.spotify}/bin/spotify --enable-features=UseOzonePlatform --ozone-platform=wayland %U";
        terminal = false;
        categories = [
            "Audio"
            "Music"
            "Player"
        ];
        mimeType = [ "x-scheme-handler/spotify" ];
    };
}
