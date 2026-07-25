{ config, pkgs, ... }:


{
  services.asusd = {
    enable = true;
  };
  
  programs.rog-control-center.enable = true;

  home.packages = with pkgs; [
    asusctl
    power-profiles-daemon
  ];
}