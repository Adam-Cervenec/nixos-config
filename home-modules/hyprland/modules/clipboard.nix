{device, pkgs, ... }:

let
  cfg = device.modules.hyprland or {};
in
{
  home.packages = [ pkgs.copyq ];

  wayland.windowManager.hyprland.settings = {
    bind = [
      "${cfg.keybindings.mod} SHIFT, C, exec, copyq toggle"
    ];

    windowrule = [
      {
        name = "CopyQ";
        "match:class" = "^com.github.hluk.copyq$";

        float = "on";
        center = "on";
        size = "800 500";
        opacity = "0.9 0.85";
      }
    ];
    # autostart
    exec-once = [
      "uwsm app -- copyq --start-server &"
    ];
  };
}