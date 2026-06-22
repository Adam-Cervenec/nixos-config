#configuration.nix

{ config, pkgs, ... }:

{
  imports =
    [
      #common modules
      ./modules/common/firewall.nix


      ./hosts/MainDesktop/hardware-configuration.nix
      ./hosts/Asus-A16/hardware-configuration.nix


      ./global-modules/system.nix
      ./global-modules/software.nix
      ./global-modules/gui.nix
      #./global-modules/gpu.nix
      #./global-modules/periferies/audio.nix
      #./global-modules/periferies/printers.nix
      #./global-modules/periferies/basic.nix
      #./global-modules/network/network.nix
      #./global-modules/network/wireless.nix
    ];

}
