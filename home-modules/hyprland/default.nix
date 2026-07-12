{ config, pkgs, lib, device, ... }:

#define variable cfg for path
let
  cfg = device.modules.hyprland or {};
in
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
  ];

  config = lib.mkIf (cfg.enable or false) {
    home.packages = with pkgs; [


      #hyprland temporary
      hypridle

    ];


    wayland.windowManager.hyprland = {
      enable = true;
      configType = "hyprlang";
    };
  };
}