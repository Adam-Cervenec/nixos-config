{
    cfg,
    config,
    lib,
    ...
}:
let
    style = cfg.style;
    color = name: "rgb(${config.lib.stylix.colors.${style.colors.${name}}})";
in
{
    wayland.windowManager.hyprland.settings = {
        general = {
            gaps_in = style.gaps / 2;
            gaps_out = style.gaps;
            border_size = style.border.width.bold;

            "col.active_border" = lib.mkForce "${color "primary"} ${color "special"} 169deg";
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

        windowrule = [
            {
                name = "Floating windows";
                "match:float" = true;

                #no_blur = true;
                opacity = style.opacity.window.floatOverride;
                border_color = color "secondary";

            }
            {
                name = "Fullscreen windows";
                "match:fullscreen" = true;
                opacity = style.opacity.window.fullscreenOverride;
                no_shadow = true;
            }
        ];
    };
}
