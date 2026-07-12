{ config, pkgs, device, ... }:
let 
  cfg = device.modules.music-player;
in 
{
  home.packages = with pkgs; [
    rmpc
    mpd
    mpc
  ];

  services.mpd = {
    enable = cfg.enable;

    musicDirectory = "/home/user/Music";

    network = {
      listenAddress = "127.0.0.1";
      port = 6600;
    };

    extraConfig = ''
      audio_output {
      type "pipewire"
      name "PipeWire"
      }
    '';
  };
  xdg.configFile."rmpc/config.ron".text = ''
    (
      address: "127.0.0.1:6600",
    )
    '';
}