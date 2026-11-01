{
    pkgs,
    config,
    lib,
    ...
}:
{
    imports = [
        #./session.nix
        #./aesthetics.nix
        #./keybindings.nix
        #./windowrules.nix

        # Modules
        #./modules/tools.nix
        #./modules/wallpaper.nix
        #./modules/notifications.nix
        #./modules/waybar.nix
        #./modules/hypridle.nix
        #./modules/rofi.nix
    ];

    home.packages = with pkgs; [
        hyprmoncfg
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
