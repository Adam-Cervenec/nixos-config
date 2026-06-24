{ config, pkgs, ... }:

{

  #thunar + thunar utils
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  environment.systemPackages = with pkgs; [
    ntfs3g
    thunar
    thunar-volman

    #terminal + utils
    alacritty
    fastfetch
    btop

  #torrent client
  qbittorrent


  #notes
  obsidian
  ];

}