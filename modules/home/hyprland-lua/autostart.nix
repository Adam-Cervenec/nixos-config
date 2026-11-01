{ lib, ... }:
{
    wayland.windowManager.hyprland.settings = {
        on = {
            _args = [
                "hyprland.start"
                (lib.generators.mkLuaInline ''
                    function()
                      hl.exec_cmd("uwsm app -- systemctl --user start hyprpolkitagent")
                      hl.exec_cmd("uwsm app -- hyprland-per-window-layout")
                      hl.exec_cmd("uwsm app -- waybar")
                      hl.exec_cmd("uwsm app -- swaync")
                      hl.exec_cmd("uwsm app -- copyq --start-server")
                    end
                '')
            ];
        };
    };
}
