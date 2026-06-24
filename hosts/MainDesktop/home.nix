#home.nix

{ config, pkgs, inputs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  imports = [

    ../../home-modules/programs/zsh.nix
    ../../home-modules/programs/firefox.nix
    ../../home-modules/programs/stylix.nix
    ../../home-modules/programs/git.nix
    ../../home-modules/programs/common.nix

    ../../home-modules/roles/dev.nix
    ../../home-modules/roles/3d-printing.nix
    ../../home-modules/roles/games.nix
    ../../home-modules/roles/office.nix
    ../../home-modules/roles/utils.nix
  ];

  home.username = "user";
  home.homeDirectory = "/home/user";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;



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

  
}
