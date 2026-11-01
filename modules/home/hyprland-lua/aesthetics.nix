{
    cfg,
    config,
    lib,
    ...
}:

let
    style = cfg.style;
in
{
    wayland.windowManager.hyprland.settings.config = {

        general = {
            gaps_in = style.gaps / 2;
            gaps_out = style.gaps;
            border_size = style.border.width.bold;
        };

        decoration = {
            rounding = style.border.roundness.medium;

            shadow = {
                enabled = style.shadow.enable or true;
                range = 20;
                render_power = 3;
            };

            blur = {
                enabled = style.blur.enable or true;
                size = 4;
                passes = 3;
                vibrancy = 0.1696;
            };

            active_opacity = style.opacity.window.active;
            inactive_opacity = style.opacity.window.inactive;
        };

    };
}
