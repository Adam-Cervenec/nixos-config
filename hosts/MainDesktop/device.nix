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
      browser = "firefox";
      terminal = "alacritty";
      fileManager = "thunar";
      codeEditor = "vscode"; #vscode
	    codeEditorCommand = "code"; #same as codeEditor for the most, code for vs code      
      notes = "obsidian";
    };

    install = [
      "fastfetch"
      "btop"
      "zip"
      "unzip"
      "qbittorrent"
      "obsidian"
      "cmatrix"
    ];
  };

  modules = {
    zsh.enable = true;
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
      disableTelemetry = true;
      homePageURL = ""; #f.e. https://start.duckduckgo.com
      defaultSearchEngie = "DuckDuckGo";
    };

    thunar = {
      enable = true;
      install = [
        "thunar"
        "thunar-volman"
        "ntfs3g"
      ];
    };
    
    hyprland = {
      enable = true;

      keybindings = {
        mod = "SUPER";
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
        wallpaper.duration = "120";
        wallpaper.monitor = "ALL"; # write "ALL" or name of monitors interface
        wallpaper.autostart = true;


        launcher.keybind = "SUPER_L";
      };
    };

    stylix = {
      enable = true;
      base16 = "chalk"; #https://tinted-theming.github.io/tinted-gallery/

      polarity = "dark"; #dark or light

      size = {
        applications = 10;
        terminal = 11;
        desktop = 10;
        popups = 8;
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
