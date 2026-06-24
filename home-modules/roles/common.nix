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
        # Nastavení průhlednosti na 0.5 (což odpovídá 50 %)
        opacity = 0.5;
        
        # Volitelně: přidání bluru nebo jiných vlastností, 
        # pokud to váš window manager podporuje
        blur = true; 
      };
      
      # Zbytek vaší konfigurace...
      font = {
        size = 12.0;
      };
    };
  };

}