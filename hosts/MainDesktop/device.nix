#device.nix

{
  hostname = "MainDeskop";

  apps = {
    browser = "firefox";
    terminal = "alacritty";
    fileManager = "thunar";
    codeEditor = "vscode";
  };

  monitors = [
    "HDMI-A-1,preferred,0x0,1"
    "DP-3,preferred,1920x0,1"
  ];

  theme = {
    base16 = "chalk";

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