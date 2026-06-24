{ config, pkgs, ... }:

{

  home.packages = with pkgs; [

  #thunar
  ntfs3g
  thunar
  thunar-volman

  #terminal + utils
  #alacritty
  fastfetch
  btop

  #torrent client
  qbittorrent


  #notes
  obsidian
  ];

  #due to stylix
  programs.alacritty = {
    enable = true;
    settings = {};
  };

}