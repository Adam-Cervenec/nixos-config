{ config, pkgs, ... }:


{
  services.asusd = {
    enable
  };


  home.packages = with pkgs; [
    "asusctl"
  ];
}