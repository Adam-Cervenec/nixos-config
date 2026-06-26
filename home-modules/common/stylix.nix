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

    fonts = {

      # Základní rodiny písem
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
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

    targets = {
      firefox = {
        enable = false;
      };
    };
  };
}