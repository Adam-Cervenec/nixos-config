{ config, pkgs, ... }:

{

  home.packages = with pkgs; [

  #thunar
  ntfs3g
  thunar
  thunar-volman
  xfce.exo

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