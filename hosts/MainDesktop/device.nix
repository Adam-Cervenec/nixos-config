#device.nix 

{
  machine = {
    hostname = "MainDesktop";
    username = "user";
    system = "x86_64-linux";
    unfreePkgs = true;
    homeVersion = "25.11";
  };

  apps = {
    browser = "firefox";
    terminal = "alacritty";
    fileManager = "thunar";
    codeEditor = "vscode";
  };

  modules = {
    zsh.enable = true;
    git = {
      enable = true;
      username = "Adam-Cervenec";
      email = "cervenec.a@protonmail.com";
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