{
    myHost,
    config,
    lib,
    ...
}:
let
    style = myHost.style;
    color = name: "rgb(${config.lib.stylix.colors.${style.colors.${name}}})";
in
{
    wayland.windowManager.hyprland.settings = {
        window_rule = [
            {
                name = "Blueman";
                match.class = "^blueman-manager$";

                float = true;
                center = true;
                size = "800 500";
            }
            {
                name = "Copyq";
                match.class = "^(com.github.hluk.copyq$|hyprpwcenter|nm-connection-editor)";

                float = true;
                center = true;
                size = "666 420";
            }
            {
                name = "Waypaper";
                match.class = "^waypaper$";

                float = true;
                center = true;
                size = "800 500";
            }
            {
                name = "Floating windows";
                match.float = true;

                #no_blur = true;
                opacity = style.opacity.window.floatOverride;
                border_color = color "secondary";

            }
            {
                name = "Fullscreen windows";
                match.fullscreen = true;
                opacity = style.opacity.window.fullscreenOverride;
                no_shadow = true;
            }
        ];
    };
}
