{
    profile = {
        apps.default = {
            browser = "zen";
            terminal = "alacritty";
            fileManager = "thunar";
            codeEditor = "vscode"; # vscode
            codeEditorCommand = "code"; # same as codeEditor for the most, code for vs code
            notes = "obsidian";
        };

        apps.packages = [
            "zip"
            "unzip"
            "p7zip"
            "qbittorrent"
            "obsidian"
            "discord"
            "gh"
            "networkmanagerapplet"

            "cava" # frekvenci graf audia
            "cmatrix" # hacker mode
            "pipes-rs" # proste trubky, neres bro
            "asciiquarium" # akvarium
            "cbonsai" # bonsai
            "hollywood" # hackerv2
            "genact" # simulator prace
            "bonsai" # dalsi strom
            "rainfrog" # dest
            "bb" # bad bytes
            "clock-rs" # hodiny do kazde rodiny
            "tty-solitaire" # solitaire

            "fastfetch"
            "btop"
            "lazygit"
            "lm_sensors"
            "nvtopPackages.full"
            "yazi"
            "zellij"
            "lazyjournal"
            "numr"

            "nix-tree"
            "nh"

            # music downloader and analytics
            "ytmdl"
            "yt-dlp"
            "mediainfo"
            "ffmpeg"
            "flac"
            "sox"
            "spek"
            "kid3" # manual metadata tagger
            "picard" # automatic metadata tagger

            # nixvim
            "ripgrep"
        ];

        vscode.enable = true;
        firefox.enable = true;
        zen.enable = false;
        thunar.enable = true;
        stylix.enable = true;
        zsh.enable = true;
        fastfetch.enable = true;
        alacritty.enable = true;
        sddm.enable = true;
        sshAgent.enable = true;
        printing.enable = true;
        printScan.enable = true;
        virtualisation.enable = true;
        docker.enable = true;
        # wol.enable = true;
        embedded.enable = true;

        nixvim.enable = true;
        steam.enable = true;

        musicPlayer.enable = true;
        musicPlayer.path = "~/Music";

        git.enable = true;
        git.username = "Adam-Cervenec";
        git.email = "cervenec.a@protonmail.com";

        hyprland.enable = true;
        hyprland.modKey = "SUPER";

        hypridle.lock-time = 10; # int minutes
        hypridle.black-screen-time = 20; # int minutes

        wallpaper.loop.duration = 60 * 4; # int seconds
        wallpaper.loop.enable = false;

        prism.enable = true;

    };
}
