{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    #utils
    networkmanagerapplet
  ];
}