{
    pkgs,
    config,
    ...
}:
{

    # test
    imports = [
        ./session.nix # monitor, input and evn settings
        ./aesthetics.nix # windowrules, appearance and animations
        ./keybindings.nix # bind and keymaps
        ./windowrules.nix # windowrules

        #modules
        ./modules/tools.nix
        #./modules/hyprlauncher.nix
        ./modules/wallpaper.nix
        ./modules/notifications.nix
        ./modules/waybar.nix
        ./modules/hypridle.nix
        ./modules/rofi.nix
    ];

    home.packages = with pkgs; [
        hyprmoncfg
    ];

    wayland.windowManager.hyprland = {

        enable = true;

        # fix uwsm systemd stop bug
        systemd.enable = false;

        configType = "hyprlang";
        # settings.cursor.no_hardware_cursors = true;
        settings.cursor.inactive_timeout = 1;
        settings.cursor.no_warps = true;
        settings.source = [ "${config.home.homeDirectory}/.config/hypr/monitors.conf" ];
    };
}
