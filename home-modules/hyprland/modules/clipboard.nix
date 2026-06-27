{device, pkgs, ... }:

let
  mod = device.modules.hyprland.keybindings.mod or {};
in
{
  home.packages = [ pkgs.copyq ];

  wayland.windowManager.hyprland.settings = {
    bind = [
      "${mod} SHIFT, C, exec, copyq toggle"
    ];

    windowrule = [
      {
        name = "CopyQ";
        "match:class" = "^com.github.hluk.copyq$";

        float = "on";
        center = "on";
        size = "800 500";
      }
    ];
    # autostart
    exec-once = [
      "uwsm app -- copyq --start-server &"
    ];
  };
}