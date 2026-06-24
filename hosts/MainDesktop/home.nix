#home.nix

{ config, pkgs, inputs, ... }:

{



  imports = [
    inputs.stylix.homeModules.stylix

    ../../home-modules/programs/zsh.nix
    ../../home-modules/programs/firefox.nix

    ../../home-modules/roles/dev.nix
    ../../home-modules/roles/3d-printing.nix
    ../../home-modules/roles/games.nix
    ../../home-modules/roles/office.nix
    ../../home-modules/roles/utils.nix
    ../../home-modules/roles/common.nix
  ];

  home.username = "user";
  home.homeDirectory = "/home/user";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;

    settings = {
      user.name = "Adam-Cervenec";
      user.email = "cervenec.a@protonmail.com";
    };
  };

# --- Deklarace SW ---

  home.packages = with pkgs; [

    #utils
    copyq
    networkmanagerapplet

    #app launcher
    ulauncher
    wmctrl # for wayland shortcut



    #hyprland temporary
    waypaper
    hypridle
    hyprlock
    hyprpaper
    hyprshot
    swaynotificationcenter
    waybar
  ];

  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyonight-night.yaml";

    polarity = "dark";
  };

}
