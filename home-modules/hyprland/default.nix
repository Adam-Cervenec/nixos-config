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
    ./modules/clipboard.nix
    ./modules/hyprlauncher.nix
    ./modules/wallpaper.nix
    ./modules/notifications.nix
    ./modules/waybar.nix
  ];

  config = lib.mkIf (cfg.enable or false) {
    home.packages = with pkgs; [


      #hyprland temporary
      hypridle
      hyprlock
      hyprshot

      # GUI authentication daemon
      hyprpolkitagent

      # GUI pipewire controller
      hyprpwcenter

      # GUI logout util
      hyprshutdown

      # per window keyboard layout
      hyprland-per-window-layout
    ];


    wayland.windowManager.hyprland = {
      enable = true;
      configType = "hyprlang";

      settings.exec-once = [
        "uwsm app -- systemctl --user start hyprpolkitagent"
        "uwsm app -- hyprland-per-window-layout"
        "uwsm app -- waybar &"
        "uwsm app -- swaync &"
      ];
    };
  };
}