{
    pkgs,
    config,
    lib,
    ...
}:
{
    imports = [
        ./session.nix
        ./aesthetics.nix
        ./keybindings.nix
        ./windowrules.nix
        ./autostart.nix

        # Modules
        ./modules/wallpaper.nix
        ./modules/notifications.nix
        ./modules/waybar.nix
        ./modules/hypridle.nix
        ./modules/rofi.nix
        ./modules/hyprmoncfg.nix
    ];

    home.packages = with pkgs; [
        hyprmoncfg

        # GUI authentication daemon
        hyprpolkitagent

        # GUI pipewire controller
        hyprpwcenter

        # GUI logout util
        hyprshutdown

        # per window keyboard layout
        hyprland-per-window-layout

        #sceenshot agent
        hyprshot

        #lockscreen
        hyprlock

        #copy history
        copyq

        # pause, stop, play... audio
        playerctl
    ];

    wayland.windowManager.hyprland = {
        enable = true;

        # Fix uwsm systemd stop bug
        systemd.enable = false;

        # Generate Lua configuration
        configType = "lua";

        settings = {
            config = {
                cursor = {
                    inactive_timeout = 1;
                    no_warps = true;
                };
            };
        };
    };
}
