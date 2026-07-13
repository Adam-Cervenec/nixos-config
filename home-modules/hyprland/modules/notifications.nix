{ pkgs, ... }:

{
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