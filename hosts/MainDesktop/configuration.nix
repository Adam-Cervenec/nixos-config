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

      #roles
    ../../modules/roles/steam.nix
  ];

  # HOSTNAME
  networking.hostName = "MainDesktop"; # Define your hostname.
}