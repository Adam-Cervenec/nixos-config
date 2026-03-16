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

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nix-config";
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
      ];
    };

  };

  programs.firefox.enable = true;
}
