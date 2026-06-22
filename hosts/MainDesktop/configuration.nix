{ config, pkgs, ...}:

{
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
    ../../modules/destkop/gui/x11.nix
    ../../modules/destkop/gui/de/plasma.nix
    ../../modules/destkop/gui/display/sddm.nix
    ../../modules/destkop/gui/wm/qtile.nix


      #roles
    ../../modules/roles/steam.nix
  ];

  # HOSTNAME
  networking.hostName = "MainDesktop"; # Define your hostname.
}