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
      codeEditor = "vscode";
    };

    install = [
      "fastfetch"
      "btop"
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

      monitors = [
        "HDMI-A-1,preferred,0x0,1"
        "DP-3,preferred,1920x0,1"
      ];
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

      opacity = {
        terminal = 0.85;
      };
    };
  };

}