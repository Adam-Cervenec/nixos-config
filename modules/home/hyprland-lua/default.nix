{
    pkgs,
    ...
}:
{

    # test
    imports = [
    ];

    home.packages = with pkgs; [
    ];

    wayland.windowManager.hyprland = {

        enable = true;

        # fix uwsm systemd stop bug
        systemd.enable = false;

        configType = "lua";
        # settings.cursor.no_hardware_cursors = true;
        settings.cursor.inactive_timeout = 1;
        settings.cursor.no_warps = true;
    };
}
