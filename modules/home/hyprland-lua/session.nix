{ cfg, lib, ... }:

let
    hardware = cfg.hardware or { };
    gpu = hardware.gpu or { };
    hasNvidia = gpu.nvidia or false;

    envVars = {
        WLR_NO_HARDWARE_CURSORS = "1";

        # Applications
        MOZ_ENABLE_WAYLAND = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";

        # Wayland / Qt
        GDK_BACKEND = "wayland";
        QT_QPA_PLATFORM = "wayland;xcb";

        # Misc
        STEAM_FORCE_DESKTOPUI_SCALING = "0";
    }
    // lib.optionalAttrs hasNvidia {
        # NVIDIA
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        LIBVA_DRIVER_NAME = "nvidia";
        GBM_BACKEND = "nvidia-drm";
        __NV_PRIME_RENDER_OFFLOAD = "1";
        __VK_LAYER_NV_optimus = "NVIDIA_only";
    };

in
{
    wayland.windowManager.hyprland.settings = {
        # Environment variables
        env = lib.mapAttrsToList (name: value: {
            _args = [
                name
                value
            ];
        }) envVars;

        # Keyboard and input
        config.input = {
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
    };
}
