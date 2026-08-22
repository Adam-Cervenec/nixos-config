{
    profile = {
        apps.default = {
        };

        apps.packages = [
            "zip"
            "unzip"
            "p7zip"
            "gh"

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
            "lazyjournal"
            "numr"
            "tmux"

            "nix-tree"
            "nh"

            # nixvim
            "ripgrep"
        ];

        zsh.enable = true;
        fastfetch.enable = true;
        sshAgent.enable = true;
        printScan.enable = true;
        docker.enable = true;

        nixvim.enable = true;

        git.enable = true;
        git.username = "Adam-Cervenec";
        git.email = "cervenec.a@protonmail.com";

        # server servicies
        ssh.enable = true;
        ssh.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICdJtCVaWgW7MeDnOTfLqrcRxsdM7F+beToHE+rLGzam cervenec.a@protonmail.com"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAnPf9uiUZOe1ON7wopCc/jCrX1nvGSqzpAkh8zQtX/c cervenec.a@protonmail.com"
        ];
    };
}
