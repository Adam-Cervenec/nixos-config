{ config, pkgs, inputs, device, ... }:

{

  imports = [
    inputs.stylix.homeModules.stylix
  ];
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/${device.theme.base16}.yaml";

    polarity = device.theme.polarity;

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
        applications = device.theme.size.applications;
        terminal = device.theme.size.terminal;
        desktop = device.theme.size.desktop;
        popups = device.theme.size.popups;
      };
    };

      
    opacity = {
      terminal = device.theme.opacity.terminal;
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