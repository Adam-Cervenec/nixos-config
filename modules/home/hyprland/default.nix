{ config, pkgs, lib, cfg, ... }:

{

  imports = [
    ./session.nix # monitor, input and evn settings
    ./aesthetics.nix # windowrules, appearance and animations 
    ./keybindings.nix # bind and keymaps

    #modules
    ./modules/tools.nix
    ./modules/hyprlauncher.nix
    ./modules/wallpaper.nix
    ./modules/notifications.nix
    ./modules/waybar.nix
    ./modules/hypridle.nix
  ];

  config = lib.mkIf (cfg.settings.profile.hyprland.enable or false) {
    home.packages = with pkgs; [

    ];


    wayland.windowManager.hyprland = {
      enable = true;
      configType = "hyprlang";
      settings.cursor.no_hardware_cursors = true;
    };
  };
}
