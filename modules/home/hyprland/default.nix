{ config, pkgs, lib, cfg, ... }:
let
  isHyprlandOn =  cfg.profile.hyprland.enable or false;
in
{

  # test
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

  config = lib.mkIf (isHyprlandOn) {

    wayland.windowManager.hyprland = {
      enable = true;
      configType = "hyprlang";
      settings.cursor.no_hardware_cursors = true;
    };
  };
}
