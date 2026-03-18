#home.nix

{ config, pkgs, ... }:

{

  imports = [
    ./home-modules/zsh.nix
  ];

  home.username = "user";
  home.homeDirectory = "/home/user";

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userEmail = "cervenec.a@protonmail.com";
    userName = "Adam-Cervenec";
  };



# --- Deklarace SW ---

  home.packages = with pkgs; [

    # TTI
    fastfetch
    btop
    alacritty

    #utils
    copyq
    flameshot

    #code
    arduino
    vscodium

    #music
    high-tide

    #3D
    cura-appimage
  ];

  programs.firefox.enable = true;
}
