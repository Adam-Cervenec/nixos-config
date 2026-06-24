{ config, pkgs, ... }:

{

  home.packages = with pkgs; [

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