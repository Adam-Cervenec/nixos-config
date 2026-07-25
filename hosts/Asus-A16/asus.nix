{ config, pkgs, ... }:


{
  services.asusd = {
    enable = true;
  };

  programs.rog-control-center.enable = true;
  services.supergfxd.enable = true;
  power-profiles-daemon.enable = true;

  environment.systemPackages = with pkgs; [
    asusctl
  ];
}