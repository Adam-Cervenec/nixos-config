{ config, pkgs, inputs, device, lib, ... }:

#define variable cfg for path
let
  cfg = device.modules.stylix or {};
in

#if stylix is enabled, define stylix...
lib.mkIf (cfg.enable or false) {

  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/${cfg.base16}.yaml";

    polarity = cfg.polarity;

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
      terminal = cfg.opacity.terminal;
    };

    targets = {
      firefox = {
        enable = true;
        profileNames = [ "default" ];
      };
      waybar.enable = false;
    };
  };
}