{ cfg, lib, ... }:

#define variable cfg for path
let
    isHyprlandOn = cfg.profile.hyprland.enable or false;

    hardware = cfg.hardware or { };
in
lib.mkIf (isHyprlandOn) {
    wayland.windowManager.hyprland.settings = {

        monitor = hardware.monitors;

        env = [

            # cursor
            "WLR_NO_HARDWARE_CURSORS,1"

            # Applications
            "MOZ_ENABLE_WAYLAND=1"
            "ELECTRON_OZONE_PLATFORM_HINT=auto"

            # Wayland / Qt
            "GDK_BACKEND=wayland"
            "QT_QPA_PLATFORM=wayland;xcb"

            # Misc
            "STEAM_FORCE_DESKTOPUI_SCALING=0"
        ]
        ++ lib.optionals (hardware.gpu.nvidia) [
            # NVIDIA
            "__GLX_VENDOR_LIBRARY_NAME=nvidia"
        ];

        input = {
            kb_layout = "us,cz";
            kb_variant = ",qwerty";
            kb_options = "grp:win_space_toggle";
            numlock_by_default = true;

            follow_mouse = 1;
            sensitivity = 0.5;

            touchpad = {
                natural_scroll = true;
            };
        };

        # Per-device overrides
        # device = {
        #   name = "epic-mouse-v1";
        #   sensitivity = -0.7;
        # };

        # Laptop gestures
        # gestures = {
        #   workspace_swipe = false;
        # };
    };
}
