{
    config,
    pkgs,
    lib,
    cfg,
    ...
}:
let
    isHyprlandOn = cfg.profile.hyprland.enable or false;
in
{

    # test
    imports = [
        ./session.nix # monitor, input and evn settings
        ./aesthetics.nix # windowrules, appearance and animations
        ./keybindings.nix # bind and keymaps

        #modules
        ./modules/tools.nix
        #./modules/hyprlauncher.nix
        ./modules/wallpaper.nix
        ./modules/notifications.nix
        ./modules/waybar.nix
        ./modules/hypridle.nix
        ./modules/rofi.nix
    ];

    config = lib.mkIf (isHyprlandOn) {

        wayland.windowManager.hyprland = {
            enable = true;

            # this will stop generating systemctl stop in main hyprland.conf
            systemd.enable = false;

            configType = "hyprlang";
            settings.cursor.no_hardware_cursors = true;
            settings.cursor.inactive_timeout = 1;
            settings.cursor.no_warps = true;
        };
    };
}
