{
    wayland.windowManager.hyprland.settings = {
        exec-once = [
            "uwsm app -- systemctl --user start hyprpolkitagent"
            "uwsm app -- hyprland-per-window-layout"
            "uwsm app -- waybar"
            "uwsm app -- swaync"
            "uwsm app -- copyq --start-server"
        ];
    };
}
