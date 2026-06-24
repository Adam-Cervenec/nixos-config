{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    #utils
    copyq
    networkmanagerapplet
  ];
}