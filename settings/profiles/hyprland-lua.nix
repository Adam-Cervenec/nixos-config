{
    profile = {
        apps.default = {
            browser = "zen";
            terminal = "alacritty";
            fileManager = "thunar";
            codeEditor = ""; # vscode
            codeEditorCommand = ""; # same as codeEditor for the most, code for vs code
            notes = "";
        };

        apps.packages = [
            "zip"
            "unzip"
            "p7zip"

            "fastfetch"
            "btop"
            "lazygit"
            "lm_sensors"
            "nvtopPackages.full"

            "nix-tree"
            "nh"

            # music downloader and analytics
            # nixvim
            "ripgrep"
        ];

        modules = {
            apps = {
                firefox.enable = false;
                vscode.enable = false;
                zen.enable = true;
                spotify.enable = false;
            };
            hyprland.enable = false;
            hyprland-lua.enable = true;
            terminal = {
                alacritty.enable = true;
                fastfetch.enable = true;
                git.enable = true;
                musicPlayer.enable = false;
                nixvim.enable = true;
                sshAgent.enable = false;
                zsh.enable = true;

            };
            embedded.enable = false;
            printing.enable = false;
            prism.enable = false;
            stylix.enable = true;
            thunar.enable = true;
            desktop = {
                audio.enable = true;
                network.enable = true;
                printers.enable = false;
            };
            sddm.enable = true;
            virtualisation.enable = false;
            docker.enable = false;
            ollama.enable = false;
            steam.enable = false;
        };

        musicPlayer.path = "~/Music";

        git.username = "Adam-Cervenec";
        git.email = "cervenec.a@protonmail.com";

        hyprland.modKey = "SUPER";

        hypridle.lock-time = 10; # int minutes
        hypridle.black-screen-time = 20; # int minutes

        wallpaper.loop.duration = 60 * 4; # int seconds
        wallpaper.loop.enable = false;

    };
}
