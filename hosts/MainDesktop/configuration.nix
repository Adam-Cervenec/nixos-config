{ config, pkgs, ...}:

{

  # HOSTNAME
  networking.hostName = "MainDesktop"; # Define your hostname.
  
  imports = [
    ./hardware-configuration.nix
    ../../configuration.nix


    # modules
      #hardware
    ../../modules/hardware/nvidia.nix

      #destkop
    ../../modules/desktop/network.nix
    ../../modules/desktop/audio.nix
    ../../modules/desktop/printers.nix

        #gui
    ../../modules/desktop/gui/x11.nix
    ../../modules/desktop/gui/de/plasma.nix
    ../../modules/desktop/gui/display/sddm.nix
    ../../modules/desktop/gui/wm/qtile.nix


      #roles
    ../../modules/roles/steam.nix
  ];
}