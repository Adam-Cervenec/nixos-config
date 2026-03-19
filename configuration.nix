#configuration.nix

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./global-modules/system.nix
      ./global-modules/software.nix
      ./global-modules/gui.nix
      ./global-modules/gpu.nix
      ./global-modules/periferies/audio.nix
      ./global-modules/periferies/printers.nix
      #./global-modules/periferies/basic.nix
      ./global-modules/network/firewall.nix
      ./global-modules/network/network.nix
      #./global-modules/network/wireless.nix
    ];

}
