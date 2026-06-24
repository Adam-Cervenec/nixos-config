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

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        
        opacity = 0.75;
        
        blur = false;

        padding = {
          x = 7;
          y = 7;
        };

        decorations = "None";
      };
    };
  };

}