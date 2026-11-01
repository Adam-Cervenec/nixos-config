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
        ];
    };
}
