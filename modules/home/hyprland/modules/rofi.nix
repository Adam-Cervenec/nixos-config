{ pkgs, ... }:

{
    programs.rofi = {
        enable = true;

        modes = [
            "drun"
            "run"
            "window"
            "ssh"
        ];

        extraConfig = {
            show-icons = true;
            terminal = "alacritty";
            display-drun = "Apps";
            case-sensitive = false;
            modi = "drun,calc";
        };
        plugins = [
            pkgs.rofi-calc
        ];
    };
}
