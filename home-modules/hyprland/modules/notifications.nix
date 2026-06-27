{ pkgs, ... }:

let
  submapListener = pkgs.writeShellScriptBin "hypr-submap-listener" ''
    #!/usr/bin/env bash

    socket="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

    while [ ! -S "$socket" ]; do
      sleep 1
    done

    socat -U - UNIX-CONNECT:"$socket" | while read -r line; do
      case "$line" in
        "submap>>"*)
          mode="''${line#submap>>}"

          if [ "$mode" = "reset" ]; then
            notify-send --urgency=low -i dialog-information "Submap" "normal mode"
          else
            notify-send --urgency=low -i dialog-information "Submap" "$mode mode"
          fi
          ;;
      esac
    done
  '';
in
{
  home.packages = with pkgs; [
    submapListener
    libnotify
    socat
  ];

  services.swaync = {
    enable = true;

    settings = {
      positionX = "right";
      positionY = "top";
    };
  };

  wayland.windowManager.hyprland.settings.exec-once = [
    "uwsm app -- swaync"
    "uwsm app -- hypr-submap-listener"
  ];
}