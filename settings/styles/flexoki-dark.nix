{
    style = {
        base16 = "flexoki-dark";
        polarity = "dark";

        fonts = {
            size.applications = 11;
            size.terminal = 11;
            size.desktop = 11;
            size.popups = 11;
            size.waybar = 16;
        };

        opacity = {
            terminal = 0.8;
            window = {
                active = 0.95;
                inactive = 0.9;
                floatOverride = "1 override 0.8 override";
                fullscreenOverride = "1 override 1 override";
            };
        };

        gaps = 6;
        shadow.enable = true;
        blur.enable = true;

        border = {
            width.normal = 2;
            width.bold = 3;
            roundness.window = 0;
            roundness.small = 2;
            roundness.medium = 5;
            roundness.large = 7;
        };

        colors = {
            background = "base00";
            foreground = "base05";
            primary = "base0D";
            accent = "base0C";
            secondary = "base0A";
            special = "base0E";
            warning = "base08";
        };
    };
}
