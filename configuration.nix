#configuration.nix

{ config, pkgs, ... }:

{
  imports =
    [
      #common modules
      ./modules/common/system.nix
      ./modules/common/firewall.nix
      ./modules/common/users.nix
      ./modules/common/shell.nix
    ];

}
