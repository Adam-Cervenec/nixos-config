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
        ];
    };
}
