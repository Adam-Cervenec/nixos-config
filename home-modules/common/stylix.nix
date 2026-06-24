{ config, pkgs, inputs, ... }:

{

  imports = [
    inputs.stylix.homeModules.stylix
  ];
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/chalk.yaml";

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
        applications = 10;
        terminal = 11;
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