{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "nixos_small";
        padding = {
          right = 2;
        };
      };

      display = {
        separator = " 󱄅 ";
        color = {
          keys = "blue";
          output = "white";
        };
      };

      modules = [
        "title"
        "separator"

        {
          type = "os";
          key = "OS";
        }

        {
          type = "kernel";
          key = "Kernel";
        }

        {
          type = "packages";
          key = "Packages";
        }

        {
          type = "shell";
          key = "Shell";
        }

        {
          type = "wm";
          key = "WM";
        }

        {
          type = "terminal";
          key = "Terminal";
        }

        "break"

        {
          type = "cpu";
          key = "CPU";
        }

        {
          type = "gpu";
          key = "GPU";
        }

        {
          type = "memory";
          key = "RAM";
        }

        {
          type = "disk";
          key = "Disk";
        }

        "break"

        {
          type = "uptime";
          key = "Uptime";
        }

        {
          type = "datetime";
          key = "Date";
          format = "{1}-{2}-{3} {14}:{17}";
        }
      ];
    };
  };
}