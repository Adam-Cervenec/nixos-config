{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    # NTFS
    ntfs3g
  ];

}