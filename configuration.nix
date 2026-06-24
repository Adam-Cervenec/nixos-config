#configuration.nix

{ config, pkgs, ... }:

{
  imports =
    [
      #common modules
      ./modules/common
    ];

}
