#device.nix 

{
  machine = {
    hostname = "MainDesktop";
    username = "user";
    system = "x86_64-linux";
    unfreePkgs = true;
    homeVersion = "25.11";
    type = "desktop"; #set desktop, laptop, server...
  };

  hardware = {
    gpu = "nvidia"; # set to nVidia, AMD or Integrated (TODO: add AMD or Integrated option, if needed)
    de = "hyprland";
    network = {
      interface = "enp37s0";
      wol.enable = true;
    };
  };

  apps = {
      default = {
        browser = "zen";
        terminal = "alacritty";
        fileManager = "thunar";
        codeEditor = "vscode"; #vscode
        codeEditorCommand = "code"; #same as codeEditor for the most, code for vs code      
        notes = "obsidian";
    };

    install = [
      "zip"
      "unzip"
      "p7zip"
      "qbittorrent"
      "obsidian"
      "discord"

      "cava" # frekvenci graf audia
      "cmatrix" # hacker mode
      "pipes-rs" # proste trubky, neres bro
      "asciiquarium" # akvarium
      "cbonsai" # bonsai
      "hollywood" #hackerv2
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
      "neovim"
      "lazyjournal"

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
    ];
  };

  modules = {
    zsh.enable = true;
    alacritty.enable = true;
    music-player.enable = true;
    music-player.path = "~/Music";
    git = {
      enable = true;
      username = "Adam-Cervenec";
      email = "cervenec.a@protonmail.com";
    };

    vscode = {
      enable = true;
      extensions = [
        "ms-vscode.cpptools"
        "ms-vscode.cpptools-extension-pack"
        "platformio.platformio-vscode-ide"
        "formulahendry.code-runner"
        "bradlc.vscode-tailwindcss"
        "jnoortheen.nix-ide"
      ];
    };

    firefox = {
      enable = true;
      configPath = ".mozilla/firefox";
    };

    zen.enable = true;

    thunar = {
      enable = true;
      install = [
        "thunar"
        "thunar-volman"
        "ntfs3g"
        "gvfs"
        "tumbler"
      ];
    };
    
    hyprland = {
      enable = true;

      keybindings = {
        mod = "SUPER";
        resizeSize = "15";
      };

      monitors = [
        "HDMI-A-1,preferred,0x0,1"
        "DP-3,preferred,1920x0,1"
      ];

      aesthetics = {
        shadow.enable = true;
        blur.enable = true;
        gaps = 15;
        opacity = {
          active = 0.95;
          inactive = 0.9;
          floatOverride = "1 override 0.8 override";
          fullscreenOverride = "1 override 1 override";
        };
      };

      modules = {
        wallpaper.duration = 60*4; #seconds
        wallpaper.monitor = "ALL"; # write "ALL" or name of monitors interface
        wallpaper.autostart = true;
        wallpaper.loop = true;

        waybar = {
          monitor.main = ["HDMI-A-1"];
          monitor.second = [];
          font-size = "16px";
        };

        hypridle.lock-time = 10; # int minutes
        hypridle.black-screen-time = 20; # int minutes


        #launcher.keybind = "SUPER_L";
      };
    };

    stylix = {
      enable = true;
      base16 = "flexoki-dark"; #https://tinted-theming.github.io/tinted-gallery/
      #good ones: chalk, ayu-dark, flexoki-dark, 

      polarity = "dark"; #dark or light

      size = {
        applications = 11;
        terminal = 11;
        desktop = 11;
        popups = 11;
      };
      opacity.terminal = 0.5;
    };
  };

  theme = {
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
