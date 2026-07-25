{ config, pkgs, ... }:


{
  services.asusd = {
    enable = true;
  };

  programs.rog-control-center.enable = true;

  environment.systemPackages = with pkgs; [
    asusctl
    power-profiles-daemon
  ];
}