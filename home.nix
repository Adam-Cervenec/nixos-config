{ config, pkgs, ... }:

{
  home.username = "user";
  home.homeDirectory = "/home/user";

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Adam-Cervenec";
    userEmail = "cervenec.a@protonmail.com";
  };

  home.packages = with pkgs; [
    fastfetch
    btop
    alacritty
    copyq
    flameshot
    arduino
    vscodium
  ];

  programs.zsh.enable = true;
}
