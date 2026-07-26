{ config, pkgs, inputs, cfg, lib, ... }:

#define variable cfg for path
let
  style = cfg.style or {};
in

#if stylix is enabled, define stylix...
lib.mkIf (cfg.profile.stylix.enable or false) {

  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/${style.base16}.yaml";

    polarity = style.polarity;

    #image = ../../assets/wallpapers/anime-girl-relaxing.jpg;

    fonts = {

      # Základní rodiny písem
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };

      sansSerif = {
        package = pkgs.atkinson-hyperlegible-next;
        name = "Atkinson Hyperlegible Next";
      };

      serif = {
        package = pkgs.source-serif;
        name = "Source Serif 4";
      };
      
      # Velikosti pro různé části systému
      sizes = {
        applications = cfg.size.applications;
        terminal = cfg.size.terminal;
        desktop = cfg.size.desktop;
        popups = cfg.size.popups;
      };
    };

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    opacity = {
      terminal = style.opacity.terminal;
    };

    targets = {
      firefox = {
        enable = true;
        profileNames = [ "default" ];
      };
      waybar.enable = false;
    };

    cursor = {
      package = pkgs.layan-cursors; #banana-cursor, layan-cursors
      name = "layan-cursors"; #Banana
      size = 32;
    };
  };
  home.pointerCursor.enable = true;
}