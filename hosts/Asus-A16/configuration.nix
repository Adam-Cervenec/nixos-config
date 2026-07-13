{ config, pkgs, device, lib, ...}:

#define variables for paths in device.nix
let
  inherit (device) hardware machine ;
in
{

  # HOSTNAME
  networking.hostName = machine.hostname; # Define your hostname.
  
  imports = [
    ./hardware-configuration.nix
    #./disks.nix
    ../../configuration.nix


      #destkop
    ../../modules/desktop


      #gui
    ../../modules/gui/x11.nix
    #../../modules/gui/de/plasma.nix
    #../../modules/gui/display/sddm.nix


      #roles
    ../../modules/roles/steam.nix
    ../../modules/roles/thunar.nix
    ../../modules/roles/wol.nix


  ]
  ++ lib.optional (hardware.gpu == "nvidia")
    ../../modules/hardware/nvidia.nix
  ++ lib.optional (hardware.de == "hyprland")
    ../../modules/gui/wm/hyprland.nix;
}