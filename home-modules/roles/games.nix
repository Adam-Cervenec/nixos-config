{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    #for steam
    protonup-ng
    mangohud
  ];
}