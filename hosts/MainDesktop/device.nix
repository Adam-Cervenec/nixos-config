
{
  hostname = "MainDeskop";

  apps = {
    browser = "firefox";
    terminal = "alacritty";
    fileManager = "thunar";
    codeEditor = "vscode";
  };

  themes = {
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