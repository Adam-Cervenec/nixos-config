{ lib, pkgs, cfg, ... }:

let
  musicPlayer = cfg.profile.musicPlayer or {};
in

lib.mkIf (musicPlayer.enable or false) {

  home.packages = with pkgs; [
    rmpc
    mpd
    mpc
  ];

  services.mpd = {
    enable = true;

    musicDirectory = musicPlayer.path;

    network = {
      listenAddress = "127.0.0.1";
      port = 6600;
    };

    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire"
      }
      auto_update "yes"
    '';
  };

  xdg.configFile."rmpc/config.ron".text = ''
    (
      address: "127.0.0.1:6600",
    )
  '';
}