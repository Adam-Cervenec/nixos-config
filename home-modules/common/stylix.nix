{ config, pkgs, inputs, device, ... }:

{

  imports = [
    inputs.stylix.homeModules.stylix
  ];
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/${device.theme.base16}.yaml";

    polarity = "dark";

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
        applications = ${device.theme.size.applications};
        terminal = device.theme.size.terminal;
        desktop = 10;
        popups = 8;
      };
    };

      
    opacity = {
      terminal = 0.85;
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