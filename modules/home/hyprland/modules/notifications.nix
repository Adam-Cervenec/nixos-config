{ pkgs, cfg, ... }:

let
  isHyprlandOn =  cfg.profile.hyprland.enable or false;
in
lib.mkIf (isHyprlandOn) {
  home.packages = with pkgs; [
    libnotify
    socat
  ];

  services.swaync = {
    enable = true;

    settings = {
      positionX = "right";
      positionY = "top";
    };
  };
}