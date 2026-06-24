{ config, pkgs, ...}:

{

  # HOSTNAME
  networking.hostName = "Asus-A16"; # Define your hostname.
  
  imports = [
    ./hardware-configuration.nix
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

  ];
}
