#device.nix

{
  hostname = "MainDeskop";
  username = "user";

  apps = {
    browser = "firefox";
    terminal = "alacritty";
    fileManager = "thunar";
    codeEditor = "vscode";
  };

  modules = {
    stylix = true;
    zsh = true;
    git = true;
  };

  monitors = [
    "HDMI-A-1,preferred,0x0,1"
    "DP-3,preferred,1920x0,1"
  ];

  #for stylix,
  theme = {
    base16 = "chalk";

    polarity = "dark";

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
}