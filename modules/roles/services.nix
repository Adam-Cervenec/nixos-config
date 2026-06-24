{ config, pkgs, ... }:

{
  #for thunar
  services.udisks2.enable = true;
  services.gvfs.enable = true;
}