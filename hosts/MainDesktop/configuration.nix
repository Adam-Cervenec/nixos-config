{ config, pkgs, ...}:

{

  # HOSTNAME
  networking.hostName = "MainDesktop"; # Define your hostname.
  
  imports = [
    ./hardware-configuration.nix
    ./disks.nix
    ../../configuration.nix


    # modules
      #hardware
    ../../modules/hardware/nvidia.nix

      #destkop
    ../../modules/desktop


      #gui
    ../../modules/gui/x11.nix
    ../../modules/gui/de/plasma.nix
    ../../modules/gui/display/sddm.nix
    ../../modules/gui/wm/qtile.nix
    ../../modules/gui/wm/hyprland.nix


      #roles
    ../../modules/roles/steam.nix
    ../../modules/roles/thunar.nix
    (import ../../modules/roles/wol.nix {
      interface = "enp37s0";
    })


  ];
}