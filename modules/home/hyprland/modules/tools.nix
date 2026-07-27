{config, pkgs, lib, cfg, ... }:

let
  isHyprlandOn =  cfg.profile.hyprland.enable or false;
in
lib.mkIf (isHyprlandOn) {
  home.packages = with pkgs; [
    # GUI authentication daemon
    hyprpolkitagent

    # GUI pipewire controller
    hyprpwcenter

    # GUI logout util
    hyprshutdown

    # per window keyboard layout
    hyprland-per-window-layout

    #sceenshot agent
    hyprshot

    #lockscreen
    hyprlock

    #copy history
    copyq

    # pause, stop, play... audio
    playerctl
  ];

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "uwsm app -- systemctl --user start hyprpolkitagent"
      "uwsm app -- hyprland-per-window-layout"
      "uwsm app -- waybar &"
      "uwsm app -- swaync &"
      "uwsm app -- copyq --start-server &"
    ];

    windowrule = [
      {
        name = "Tools";
        "match:class" = "^(com.github.hluk.copyq$|hyprpwcenter|nm-connection-editor)";

        float = "on";
        center = "on";
        size = "666 420";
      }
    ];
  };
}