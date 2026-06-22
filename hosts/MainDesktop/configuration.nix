{ config, pkgs, ...};

{
  imports = [
    ./hardware-configuration.nix
    ../../configuration.nix


    # modules
      #roles
    ../../modules/roles/nvidia.nix

      #destkop
    ../../modules/destkop/network.nix
  ];

  # HOSTNAME
  networking.hostName = "MainDesktop"; # Define your hostname.
}