{
    wayland.windowManager.hyprland.settings = {

        settings = {
            windowrule = [
                {
                    name = "Blueman";
                    match.class = "^blueman-manager$";

                    float = true;
                    center = true;
                    size = "800 500";
                }
            ];
        };
    };
}
