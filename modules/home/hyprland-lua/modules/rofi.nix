{ pkgs, ... }:

{
    programs.rofi = {
        enable = true;

        plugins = [
            pkgs.rofi-calc
        ];

        settings = {
            modes = [
                "drun"
                "run"
                "window"
                "ssh"
            ];

            show-icons = true;
            terminal = "alacritty";
            display-drun = "Apps";
            case-sensitive = false;
            modi = "drun,calc";
        };
    };
}
