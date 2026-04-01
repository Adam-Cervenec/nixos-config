#home.nix

{ config, pkgs, ... }:

{

  imports = [
    ./home-modules/zsh.nix
  ];

  home.username = "user";
  home.homeDirectory = "/home/user";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "cervenec.a@protonmail.com";
    userName = "Adam-Cervenec";
  };

# --- Deklarace SW ---

  home.packages = with pkgs; [

    # terminal
    fastfetch
    btop
    alacritty

    #utils
    copyq
    flameshot
    networkmanagerapplet

    #code
    arduino
    vscodium

    #music
    high-tide

    #3D
    cura-appimage
    #freecad

    #for steam
    protonup-ng
    mangohud

    #app launcher
    ulauncher
    wmctrl # for wayland shortcut

    qbittorrent
  ];

  programs.firefox.enable = true;

}
